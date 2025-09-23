# Python data generators

Utility scripts to create synthetic data used by the Laravel demo and by the chart backends.

## Order generator

```bash
python order_generator.py --count 500 --output ./output/orders.csv
```

Outputs a CSV with customer, SKU and address references that can be imported into Postgres or
ClickHouse using the ETL tools.
