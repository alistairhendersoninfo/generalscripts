#!/usr/bin/env bash
set -euo pipefail

DATA_ROOT=${DATA_ROOT:-./data}
mkdir -p "$DATA_ROOT/worldbank" "$DATA_ROOT/logs" "$DATA_ROOT/pcap"

WORLD_BANK_DATASETS=(
  "USA;NY.GDP.MKTP.CD"
  "USA;SP.POP.TOTL"
  "USA;NY.GDP.PCAP.CD"
  "CAN;NY.GDP.PCAP.CD"
  "GBR;NY.GDP.PCAP.CD"
)

worldbank_download() {
  local country indicator
  IFS=';' read -r country indicator <<<"$1"
  local outfile="$DATA_ROOT/worldbank/${country}_${indicator}.json"
  echo "Downloading World Bank series $country/$indicator"
  curl -fsSL "https://api.worldbank.org/v2/country/${country}/indicator/${indicator}?downloadformat=csv" -o "${outfile%.json}.zip"
}

echo "Fetching World Bank datasets"
for item in "${WORLD_BANK_DATASETS[@]}"; do
  worldbank_download "$item"
done

pushd "$DATA_ROOT/logs" > /dev/null
  echo "Downloading Apache HTTP logs"
  wget -q -O apache_logs.log https://raw.githubusercontent.com/elastic/examples/master/Common-Data-Formats/apache_logs/apache_logs

  echo "Downloading CIC-IDS2017 labelled flows (large download)"
  wget -q -O CIC-IDS-2017-GeneratedLabelledFlows.zip http://205.174.165.80/CICDataset/CIC-IDS-2017/Dataset/GeneratedLabelledFlows.zip || echo "Warning: CIC dataset download requires public internet access"
popd > /dev/null

pushd "$DATA_ROOT/pcap" > /dev/null
  echo "Downloading Wireshark HTTP capture"
  wget -q -O http.pcap https://gitlab.com/wireshark/wireshark/-/wikis/uploads/moin_import/attachments/SampleCaptures/http.pcap
popd > /dev/null

echo "Dataset download complete."
