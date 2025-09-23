## Final Deliverable Manifest and Packaging

            **Objective**: List all artefacts the LLM must output and where they should reside.

            Produce a closing summary that enumerates every artefact created during the session. At minimum include:

- `docs/specs/functional_spec.md`
- `docs/specs/technical_architecture.md`
- `docs/specs/security_plan.md`
- `docs/specs/data_model.md`
- `docs/specs/api_reference.yaml`
- `docs/specs/ux_guidelines.md`
- `docs/diagrams/workflows/*.mmd`
- `docs/test_plan.md` with detailed manual, automated, happy-path, and chaotic-path cases
- `tests/playwright/` scripts covering UX regression flows
- `tests/security/` scripts/instructions for Kali-driven penetration testing
- `infrastructure/` IaC blueprints and CI/CD pipeline definitions
- `LLM_DESIGN.md`
- `docs/user/installation.md`, `docs/user/operations.md`, `docs/user/upgrade.md`
- `backlog/human_readable_todo.md` and `backlog/machine_todo.yaml`
- `memory/memory_agents.sqlite` schema definition and management guide
- Automation scripts for GitHub and ForgeJo project initialisation, including stage-gate task promotion
- Crewe.ai Docker setup documentation and orchestration scripts

Confirm storage paths, naming conventions, and any post-processing (e.g., publishing to GitHub Pages). Provide a final checklist to validate completeness.