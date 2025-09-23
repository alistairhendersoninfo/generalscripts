from fastapi import FastAPI
import os
import clickhouse_connect
from langchain.chains import LLMChain
from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate

CLICKHOUSE_HOST = os.environ.get("CLICKHOUSE_HOST", "clickhouse")
CLICKHOUSE_PORT = int(os.environ.get("CLICKHOUSE_PORT", "9000"))
CLICKHOUSE_USER = os.environ.get("CLICKHOUSE_USER", "analytics")
CLICKHOUSE_PASSWORD = os.environ.get("CLICKHOUSE_PASSWORD", "analytics")
CLICKHOUSE_DATABASE = os.environ.get("CLICKHOUSE_DATABASE", "analytics")

app = FastAPI(title="LangChain QA")

prompt = PromptTemplate.from_template("Using the following metrics: {data}\nAnswer the question: {question}")


@app.get("/qa")
def qa(question: str = "What is the latest GDP per capita?"):
    client = clickhouse_connect.get_client(
        host=CLICKHOUSE_HOST,
        port=CLICKHOUSE_PORT,
        username=CLICKHOUSE_USER,
        password=CLICKHOUSE_PASSWORD,
        database=CLICKHOUSE_DATABASE,
    )
    rows = client.query(
        """
        SELECT country_code, toString(period) AS period, value
        FROM worldbank_gdp_per_capita
        ORDER BY period DESC
        LIMIT 5
        """
    ).result_rows
    data = ", ".join(f"{country} {period}: {value}" for country, period, value in rows)
    chain = LLMChain(llm=OpenAI(temperature=0), prompt=prompt)
    answer = chain.invoke({"data": data, "question": question})
    return {"answer": answer["text"], "evidence": rows}


@app.get("/health")
def health():
    return {"status": "ok"}
