# Language tooling

This stack combines LangFlow, a FastAPI-based LangChain microservice and a LangGraph workflow.
All services read from ClickHouse and (optionally) use OpenAI for completions.  Provide your API
key via the `OPENAI_API_KEY` environment variable when starting the compose stack.

```bash
OPENAI_API_KEY=sk-... docker compose -f docker-compose.lang.yml up -d --build
```

* LangFlow UI: `http://localhost:7860`
* LangChain service: `http://localhost:8001/qa`
* LangGraph workflow: prints aggregation results to stdout when the container starts.
