import os
import clickhouse_connect
from langgraph.graph import Graph

client = clickhouse_connect.get_client(
    host=os.environ.get("CLICKHOUSE_HOST", "clickhouse"),
    port=int(os.environ.get("CLICKHOUSE_PORT", "9000")),
    username=os.environ.get("CLICKHOUSE_USER", "analytics"),
    password=os.environ.get("CLICKHOUSE_PASSWORD", "analytics"),
    database="analytics",
)

def extract(_: dict) -> dict:
    rows = client.query(
        "SELECT toString(period) AS period, value FROM worldbank_gdp_per_capita ORDER BY period DESC LIMIT 10"
    ).result_rows
    return {"rows": rows}

def transform(payload: dict) -> dict:
    average = sum(row[1] for row in payload["rows"]) / len(payload["rows"]) if payload["rows"] else 0
    return {"summary": average, "rows": payload["rows"]}

def load(payload: dict) -> dict:
    print("LangGraph summary of GDP per capita (latest 10):", payload["summary"])
    return payload

graph = Graph()
graph.add_node("extract", extract)
graph.add_node("transform", transform)
graph.add_node("load", load)
graph.add_edge("extract", "transform")
graph.add_edge("transform", "load")

if __name__ == "__main__":
    graph.invoke({})
