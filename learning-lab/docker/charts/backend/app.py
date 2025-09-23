from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import os
import clickhouse_connect

CLICKHOUSE_HOST = os.environ.get("CLICKHOUSE_HOST", "clickhouse")
CLICKHOUSE_PORT = int(os.environ.get("CLICKHOUSE_PORT", "9000"))
CLICKHOUSE_USER = os.environ.get("CLICKHOUSE_USER", "analytics")
CLICKHOUSE_PASSWORD = os.environ.get("CLICKHOUSE_PASSWORD", "analytics")
CLICKHOUSE_DATABASE = os.environ.get("CLICKHOUSE_DATABASE", "analytics")

app = FastAPI(title="Learning Lab Charts API")
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"]
)


def get_client():
    return clickhouse_connect.get_client(
        host=CLICKHOUSE_HOST,
        port=CLICKHOUSE_PORT,
        username=CLICKHOUSE_USER,
        password=CLICKHOUSE_PASSWORD,
        database=CLICKHOUSE_DATABASE,
    )


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/worldbank/gdp_per_capita")
def gdp_per_capita(country: str = "USA", limit: int = 25):
    client = get_client()
    query = """
        SELECT toDate(period) AS period, value
        FROM worldbank_gdp_per_capita
        WHERE country_code = %(country)s
        ORDER BY period DESC
        LIMIT %(limit)s
    """
    rows = client.query(query, parameters={"country": country, "limit": limit}).result_rows
    return {
        "country": country,
        "series": [{"period": r[0].isoformat(), "value": r[1]} for r in rows],
    }


@app.get("/orders/sales_totals")
def sales_totals():
    client = get_client()
    rows = client.query(
        """
        SELECT toDate(order_date) AS day, sum(order_total) AS total
        FROM sales_orders
        GROUP BY day
        ORDER BY day
        LIMIT 180
        """
    ).result_rows
    return {"series": [{"day": r[0].isoformat(), "total": float(r[1])} for r in rows]}
