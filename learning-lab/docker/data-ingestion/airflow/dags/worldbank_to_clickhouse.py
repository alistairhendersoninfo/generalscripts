from __future__ import annotations

from datetime import datetime

from airflow import DAG
from airflow.operators.python import PythonOperator
import clickhouse_connect
import csv
from pathlib import Path

DATA_DIR = Path("/opt/airflow/data/logs")
FILE_NAME = "apache_logs.log"


def load_into_clickhouse():
    client = clickhouse_connect.get_client(
        host="clickhouse",
        port=9000,
        username="analytics",
        password="analytics",
        database="analytics",
    )
    client.command(
        """
        CREATE TABLE IF NOT EXISTS apache_logs (
            host String,
            identity String,
            user String,
            time String,
            request String,
            status UInt16,
            size UInt64,
            referer String,
            agent String
        ) ENGINE = MergeTree() ORDER BY (host, time)
        """
    )
    file_path = DATA_DIR / FILE_NAME
    with file_path.open() as fh:
        reader = csv.reader(fh, delimiter=' ')
        rows = []
        for row in reader:
            if len(row) < 9:
                continue
            rows.append(
                {
                    "host": row[0],
                    "identity": row[1],
                    "user": row[2],
                    "time": row[3].lstrip('['),
                    "request": row[5].lstrip('"'),
                    "status": int(row[8]) if row[8].isdigit() else 0,
                    "size": int(row[9]) if len(row) > 9 and row[9].isdigit() else 0,
                    "referer": row[10] if len(row) > 10 else '',
                    "agent": ' '.join(row[11:]) if len(row) > 11 else '',
                }
            )
        if rows:
            client.insert("apache_logs", rows)


def _noop():
    pass


def build_dag():
    with DAG(
        dag_id="worldbank_to_clickhouse",
        start_date=datetime(2024, 1, 1),
        schedule_interval=None,
        catchup=False,
    ) as dag:
        PythonOperator(task_id="load_clickhouse", python_callable=load_into_clickhouse)
    return dag


globals()["worldbank_to_clickhouse"] = build_dag()
