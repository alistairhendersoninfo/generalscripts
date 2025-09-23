"""Synthetic data generators used across the demos."""
from __future__ import annotations

import argparse
import csv
import random
import uuid
from datetime import datetime, timedelta
from pathlib import Path

CUSTOMERS = [
    {"id": 1, "name": "Acme Industries", "email": "ops@acme.example", "segment": "Manufacturing"},
    {"id": 2, "name": "Globex Retail", "email": "hello@globex.example", "segment": "Retail"},
    {"id": 3, "name": "Soylent Health", "email": "support@soylent.example", "segment": "Healthcare"},
]

SKUS = [
    {"id": 1001, "name": "Widget A", "price": 12.5},
    {"id": 1002, "name": "Widget B", "price": 8.9},
    {"id": 1003, "name": "Widget C", "price": 4.1},
]

ADDRESSES = [
    {"id": 501, "customer_id": 1, "line1": "100 Main St", "city": "Springfield", "country": "US"},
    {"id": 502, "customer_id": 2, "line1": "200 Trade Rd", "city": "Metropolis", "country": "US"},
    {"id": 503, "customer_id": 3, "line1": "300 Health Ave", "city": "Gotham", "country": "US"},
]


def generate_orders(count: int) -> list[dict[str, str | int | float]]:
    now = datetime.utcnow()
    orders = []
    for i in range(count):
        customer = random.choice(CUSTOMERS)
        sku = random.choice(SKUS)
        address = random.choice([a for a in ADDRESSES if a["customer_id"] == customer["id"]])
        order_date = now - timedelta(days=random.randint(0, 365))
        quantity = random.randint(1, 10)
        orders.append(
            {
                "order_id": str(uuid.uuid4()),
                "order_number": f"SO-{order_date:%Y%m%d}-{i:04d}",
                "customer_id": customer["id"],
                "shipping_address_id": address["id"],
                "sku_id": sku["id"],
                "quantity": quantity,
                "unit_price": sku["price"],
                "order_total": quantity * sku["price"],
                "order_date": order_date.isoformat(),
            }
        )
    return orders


def write_csv(rows: list[dict[str, str | int | float]], path: Path) -> None:
    if not rows:
        raise ValueError("No rows to write")
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as fh:
        writer = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate synthetic order CSV data")
    parser.add_argument("--count", type=int, default=250)
    parser.add_argument("--output", type=Path, default=Path("./output/orders.csv"))
    args = parser.parse_args()

    rows = generate_orders(args.count)
    write_csv(rows, args.output)
    print(f"Wrote {len(rows)} orders to {args.output}")


if __name__ == "__main__":
    main()
