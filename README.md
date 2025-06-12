# generalscripts

This repository contains general utility scripts.

## Archive script

- `archive_all.sh`: Creates a compressed tarball of the entire repository (excluding the `.git` directory). The output filename is `archive_<timestamp>.tar.gz`.

### Usage

```bash
./archive_all.sh
```

The script will generate the archive in the repository root directory and print the archive name when finished.
