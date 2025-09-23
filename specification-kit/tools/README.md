# Tools

Automate quality checks and publishing workflows by placing scripts or
configuration files in this directory. Potential additions include:

- Markdown or reStructuredText linters
- Diagram generation scripts (e.g., PlantUML, Mermaid CLI wrappers)
- Specification validation tools that enforce required sections or metadata
- Continuous integration workflows for verifying spec quality

Document how to run each tool and list any dependencies so contributors can set
up the toolkit quickly.

## Available utilities

### `llm_spec_prompt_builder.py`

Generates a comprehensive prompt pack for running specification discovery
sessions with Codex, Claude, or other LLMs. The script outputs a master prompt
and modular sub-prompts that drive requirement capture, testing strategy,
documentation plans, GitHub/ForgeJo project automation, and Crewe.ai
orchestration guidance.

```bash
python tools/llm_spec_prompt_builder.py "Project Phoenix"
```

By default, artefacts are written to `docs/generated/project-phoenix/` inside
the working repository. Use `--output-dir` to select another location or repeat
`--module <identifier>` to generate a subset of the available modules. Each
module is independent so teams can update accessibility requirements or other
sections without rewriting the entire prompt.
