"""LLM specification prompt builder.

This script assembles a comprehensive orchestration prompt for Codex, Claude,
or comparable large language models.  The generated prompt instructs the LLM to
run a full discovery and specification workflow that results in all
documentation, project management assets, and automation hooks required to hand
off implementation to additional agents.

The script is intentionally modular.  Each major activity in the workflow is
encapsulated in a dedicated section so downstream teams can swap, extend, or
remove pieces (for example, updating the accessibility intake as legislation
changes).
"""

from __future__ import annotations

import argparse
import json
from dataclasses import dataclass
from pathlib import Path
from textwrap import dedent
from typing import Dict, Iterable, List


DEFAULT_MODULE_ORDER: List[str] = [
    "session_setup",
    "project_overview",
    "user_and_actor_profiles",
    "workflow_and_state_mapping",
    "administration_and_maintenance",
    "technology_and_platform",
    "data_and_memory_design",
    "api_contracts",
    "ux_and_accessibility",
    "security_privacy_and_resilience",
    "testing_strategy",
    "documentation_and_enablement",
    "project_management_and_governance",
    "devops_and_environments",
    "automation_hooks_and_integrations",
    "deliverable_manifest",
]


@dataclass(frozen=True)
class PromptModule:
    """Container that describes a single prompt module."""

    identifier: str
    title: str
    objective: str
    instructions: str

    def render(self) -> str:
        return dedent(
            f"""
            ## {self.title}

            **Objective**: {self.objective}

            {self.instructions.strip()}
            """
        ).strip()


def build_modules(context: Dict[str, str]) -> Dict[str, PromptModule]:
    """Create the prompt module dictionary.

    The modules reference the ``context`` dictionary for key project values.
    Keeping the module definitions in a dedicated function makes it trivial to
    adjust or extend individual sections without rewriting the entire prompt.
    """

    project_name = context["project_name"]
    stakeholder_label = context.get("stakeholder_label", "stakeholder")

    return {
        "session_setup": PromptModule(
            identifier="session_setup",
            title="Engagement Setup and Working Agreement",
            objective="Align the LLM facilitator with the client and establish confidentiality, tooling, and scope guardrails.",
            instructions=dedent(
                f"""
                1. Introduce yourself as the specification orchestrator for the **{project_name}** initiative.
                2. Confirm that all sensitive information will be handled confidentially and that only anonymised artefacts leave the session transcript.
                3. Explain that you will guide the {stakeholder_label} through a structured discovery process that generates:
                   - Functional and technical specifications.
                   - Test, security, deployment, and maintenance plans.
                   - GitHub and ForgeJo project structures including automation hooks.
                   - Documentation bundles for both humans and downstream LLM agents.
                4. Verify the available tooling: Claude / Codex CLI, Playwright UX harness, Kali Linux security toolchain, Crewe.ai orchestration, and access to GitHub and ForgeJo.
                5. Share the full list of deliverables from the "Deliverable Manifest" section so expectations are transparent from the outset.
                """
            ),
        ),
        "project_overview": PromptModule(
            identifier="project_overview",
            title="Project Vision, Outcomes, and Constraints",
            objective="Capture the overarching goals, measurable success criteria, domain background, and temporal constraints.",
            instructions=dedent(
                """
                1. Ask for an executive summary of the product, including target users, core problem statements, and differentiators.
                2. Capture quantitative and qualitative success metrics (e.g., adoption targets, revenue goals, compliance thresholds).
                3. Record explicit in-scope and out-of-scope items.
                4. Identify budget, timeline, or resource constraints, including expectations for MVP, subsequent releases, and sunset considerations.
                5. Summarise competitive landscape or existing solutions and any mandated integrations with current systems.
                """
            ),
        ),
        "user_and_actor_profiles": PromptModule(
            identifier="user_and_actor_profiles",
            title="User, Actor, and Persona Mapping",
            objective="Document all user types, external systems, and automation agents that interact with the solution.",
            instructions=dedent(
                """
                1. Enumerate end-user personas, including accessibility needs, assistive technologies, and localisation requirements.
                2. Capture administrative, operational, and maintenance personas separately from primary users.
                3. Identify external services, partner APIs, hardware devices, or manual processes that interact with the system.
                4. Note any regulatory bodies or audit stakeholders that impose reporting or evidence requirements.
                """
            ),
        ),
        "workflow_and_state_mapping": PromptModule(
            identifier="workflow_and_state_mapping",
            title="End-to-End Workflow and State Exploration",
            objective="Map every functional flow, alternative path, exception, and supporting loop across the product lifecycle.",
            instructions=dedent(
                f"""
                1. Facilitate iterative exploration of workflows. After each flow, ask whether additional flows exist and loop until the {stakeholder_label} indicates completion.
                2. For each workflow, capture:
                   - Triggering conditions and entry points.
                   - Detailed step-by-step narrative, including parallel tasks permitted (maximum concurrency of four independent tasks).
                   - Required data inputs, transformations, and outputs at every stage.
                   - Alternate, error, and edge-case paths where steps are skipped, data is invalid, or user behaviour deviates from the happy path.
                3. Request Mermaid (`.mmd`) sequence and flow diagrams for each workflow, capturing both primary and exception paths. Store in `docs/diagrams/workflows/`.
                4. Flag dependencies between workflows so that implementation order and testing plans avoid circular or blocking relationships.
                """
            ),
        ),
        "administration_and_maintenance": PromptModule(
            identifier="administration_and_maintenance",
            title="Administration, Operations, and Maintenance Duties",
            objective="Ensure lifecycle support tasks are integrated into the specification.",
            instructions=dedent(
                """
                1. Catalogue provisioning, configuration, and rollout activities for administrators.
                2. Document recurring maintenance jobs (backups, log rotation, patching) and responsible parties.
                3. Capture support processes: incident response flows, escalation paths, and rollback procedures.
                4. Identify audit and reporting obligations including data retention, deletion policies, and evidence required for compliance checks.
                """
            ),
        ),
        "technology_and_platform": PromptModule(
            identifier="technology_and_platform",
            title="Technology Stack and Deployment Blueprint",
            objective="Select and justify the end-to-end technology architecture, deployment targets, and integration standards.",
            instructions=dedent(
                """
                1. Discuss desired front-end frameworks, back-end runtimes, microservices vs. monolith patterns, and integration middleware.
                2. Choose database technologies (transactional, analytical, cache, and memory agents) with justification based on data requirements.
                3. Decide on hosting models (Docker, bare metal, cloud providers) and outline networking, load balancing, and CDN considerations.
                4. Specify web servers, API gateways, message brokers, observability stack, and secrets management.
                5. Capture coding standards, language versions, formatting rules, linting requirements, and architectural decision records needed.
                6. Outline environment matrix (local, CI, staging, production) and required parity.
                """
            ),
        ),
        "data_and_memory_design": PromptModule(
            identifier="data_and_memory_design",
            title="Data Architecture, Schemas, and Memory Agents",
            objective="Define the logical and physical data models, storage policies, and long-term memory strategy for agents.",
            instructions=dedent(
                """
                1. Gather detailed entity relationship requirements including keys, constraints, indexing, and archival strategies.
                2. Request canonical database schemas and migrations for all datastores. Provide SQL or migration snippets.
                3. Capture memory agent requirements, including SQLite-backed recall, retention timelines, summarisation cadence, and privacy controls.
                4. Identify data import/export formats, retention policies, residency constraints, and backup/restore procedures.
                5. Record analytics and telemetry data capture requirements along with schema expectations.
                """
            ),
        ),
        "api_contracts": PromptModule(
            identifier="api_contracts",
            title="API and Integration Specification",
            objective="Define all service contracts, event payloads, and integration boundaries.",
            instructions=dedent(
                """
                1. Document REST, GraphQL, gRPC, WebSocket, and messaging interfaces. Include request/response bodies, status codes, headers, and error formats.
                2. Capture authentication, authorisation, rate limiting, and versioning strategies.
                3. Specify external API dependencies, including sandbox vs. production endpoints, contract testing requirements, and failover behaviour.
                4. Generate OpenAPI or equivalent schema files saved under `docs/api/`.
                """
            ),
        ),
        "ux_and_accessibility": PromptModule(
            identifier="ux_and_accessibility",
            title="User Experience, Visual Design, and Accessibility Standards",
            objective="Produce UX artefacts that satisfy usability and evolving accessibility regulations.",
            instructions=dedent(
                """
                1. Compile screen inventories with wireframes, component hierarchies, and navigation models. Output Markdown and companion Mermaid UI diagrams.
                2. Capture interaction design for each user role, including responsive behaviour, keyboard navigation, and assistive technology support.
                3. Explicitly ask about applicable accessibility legislation (e.g., WCAG 2.2, EN 301 549) and record additional organisational policies. Keep this module easy to modify as new laws emerge.
                4. Identify content strategy requirements such as copy tone, localisation, error messaging, and empty states.
                5. Produce Playwright-based UX regression scenarios aligned with the test strategy.
                """
            ),
        ),
        "security_privacy_and_resilience": PromptModule(
            identifier="security_privacy_and_resilience",
            title="Security, Privacy, and Resilience Planning",
            objective="Integrate threat modelling, security controls, and resilience expectations from the start.",
            instructions=dedent(
                """
                1. Conduct high-level threat modelling (STRIDE or similar) and capture mitigations.
                2. Define authentication, authorisation, encryption (in transit and at rest), key rotation, and secrets handling.
                3. Capture privacy requirements including consent, data minimisation, DSAR/Right-to-be-forgotten workflows.
                4. Plan penetration and vulnerability testing leveraging the Kali Linux toolchain. Document inputs/outputs for the MCP server that will orchestrate these tests.
                5. Describe disaster recovery, RTO/RPO targets, chaos testing cadence, and monitoring/alerting thresholds.
                """
            ),
        ),
        "testing_strategy": PromptModule(
            identifier="testing_strategy",
            title="Comprehensive Testing and Quality Strategy",
            objective="Define executable tests covering happy and unhappy paths across all layers.",
            instructions=dedent(
                """
                1. Produce a test plan that enumerates manual and automated scenarios. For each UI flow, list explicit steps (buttons to click, data to enter) and expected outcomes.
                2. Include negative tests covering invalid data, out-of-order steps, and random user actions to validate graceful degradation.
                3. Align Playwright scripts for UX testing with the UX deliverables. Store in `tests/playwright/`.
                4. Define API contract tests, integration tests, performance tests, and security testing sequences (including Kali-based penetration steps).
                5. Provide coverage goals, test data management plans, and CI gating rules.
                """
            ),
        ),
        "documentation_and_enablement": PromptModule(
            identifier="documentation_and_enablement",
            title="Documentation Suite and Knowledge Transfer",
            objective="Ensure both humans and LLM agents receive actionable documentation.",
            instructions=dedent(
                f"""
                1. Produce an `LLM_DESIGN.md` (Claude/Codex friendly) summarising architecture, conventions, and invocation instructions for the agent workforce.
                2. Create human-readable guides covering installation, configuration, upgrades, and operational checklists.
                3. Generate machine-readable TODO/backlog files (YAML or JSON) for automation and a synchronised human-readable counterpart.
                4. Document memory agent configurations, including SQLite schemas, summarisation cadence, retention policies, and reset procedures.
                5. Provide user manuals, FAQ, and troubleshooting guides stored under `docs/user/`.
                6. Outline documentation publishing workflows for GitHub Pages (doc.github) and the ForgeJo equivalent.
                """
            ),
        ),
        "project_management_and_governance": PromptModule(
            identifier="project_management_and_governance",
            title="Project Planning, Agile Cadence, and Governance",
            objective="Create a delivery roadmap aligned with Scrum/Agile practices and tooling automation.",
            instructions=dedent(
                """
                1. Break work into MVP and subsequent release increments, mapping epics, features, and user stories with acceptance criteria.
                2. Define sprint length, ceremonies, Definition of Ready, and Definition of Done.
                3. Generate a project plan that respects dependency ordering and only schedules parallel tasks when independence is guaranteed (maximum four concurrent workstreams).
                4. Provide burndown/burnup reporting expectations and metrics.
                5. Prepare automation scripts or CLI commands to duplicate the required GitHub project template, populate project items (not issues) with all tasks assigned to **alistairhendersoninfo** and status `Todo`, and replicate the same structure in ForgeJo.
                6. Describe stage-gate criteria and how scripts should pull tasks as gates are cleared.
                """
            ),
        ),
        "devops_and_environments": PromptModule(
            identifier="devops_and_environments",
            title="DevOps Tooling, CI/CD, and Environment Provisioning",
            objective="Detail automated pipelines and environment configuration.",
            instructions=dedent(
                """
                1. Define CI/CD workflows for build, lint, test, security scan, and deployment, including required secrets and approvals.
                2. Capture infrastructure-as-code expectations (Terraform, Pulumi, Ansible, etc.) and environment promotion strategies.
                3. Specify observability requirements: logging, metrics, tracing, dashboards, and alert routing.
                4. Document rollback, hotfix, and blue/green or canary deployment strategies.
                5. Outline container image standards, registry management, SBOM generation, and supply chain security.
                """
            ),
        ),
        "automation_hooks_and_integrations": PromptModule(
            identifier="automation_hooks_and_integrations",
            title="Automation, Integrations, and Crewe.ai Orchestration",
            objective="Explain how agentic tooling and orchestration platforms interact with the project assets.",
            instructions=dedent(
                """
                1. Provide detailed instructions for the Crewe.ai Docker environment, including Dockerfile snippets, environment variables, network requirements, and how agents authenticate with GitHub and ForgeJo.
                2. Describe how the LLM should call auxiliary tools (Playwright harness, Kali MCP server, database migration runners) including expected input/output formats.
                3. Outline scheduler or cron requirements for automation scripts that sync project boards, execute regression suites, or rotate credentials.
                4. Capture integration touchpoints with communication platforms (Slack/Teams/email) for notifications and status reporting.
                """
            ),
        ),
        "deliverable_manifest": PromptModule(
            identifier="deliverable_manifest",
            title="Final Deliverable Manifest and Packaging",
            objective="List all artefacts the LLM must output and where they should reside.",
            instructions=dedent(
                """
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
                """
            ),
        ),
    }


def render_master_prompt(context: Dict[str, str], modules: Iterable[PromptModule]) -> str:
    """Create the master orchestration prompt."""

    project_name = context["project_name"]
    intro = dedent(
        f"""
        # {project_name} Specification Orchestrator Prompt

        You are an expert product and delivery consultant tasked with running a
        full discovery, specification, and enablement workflow. Drive an
        interview-style session with stakeholders, iteratively gather
        requirements, and produce the complete artefact set listed in the
        deliverable manifest. Work transparently, recap decisions, and confirm
        understanding at each major milestone.

        Follow the modules in order. Revisit earlier modules when new
        information affects previous conclusions. Always document assumptions and
        outstanding questions in the backlog files.
        """
    ).strip()

    module_text = "\n\n".join(module.render() for module in modules)

    outro = dedent(
        """
        ## Working Notes and Transcript Hygiene

        - Maintain a running `notes/session_transcript.md` capturing key
          decisions, open questions, and follow-up actions.
        - Sanitise sensitive data before storing in artefacts. Use placeholders
          where necessary and mark items requiring redaction.
        - At the end of the engagement, present a summary, confirm next steps,
          and list any dependencies on external approvals or missing inputs.
        """
    ).strip()

    return f"{intro}\n\n{module_text}\n\n{outro}\n"


def build_prompt_pack(context: Dict[str, str]) -> Dict[str, str]:
    """Construct the individual module prompts keyed by identifier."""

    modules = build_modules(context)
    ordered_modules = [modules[mid].render() for mid in context["module_order"]]
    return {
        "master_prompt": render_master_prompt(
            context=context,
            modules=[modules[mid] for mid in context["module_order"]],
        ),
        "modules": {
            mid: modules[mid].render() for mid in context["module_order"]
        },
        "module_sequence": context["module_order"],
    }


def write_prompt_pack(output_dir: Path, prompt_pack: Dict[str, str]) -> None:
    """Persist the prompt pack as Markdown and JSON for downstream tooling."""

    output_dir.mkdir(parents=True, exist_ok=True)

    (output_dir / "MASTER_PROMPT.md").write_text(
        prompt_pack["master_prompt"], encoding="utf-8"
    )

    modules_dir = output_dir / "modules"
    modules_dir.mkdir(exist_ok=True)
    for identifier, content in prompt_pack["modules"].items():
        (modules_dir / f"{identifier}.md").write_text(content, encoding="utf-8")

    json_payload = {
        "module_sequence": prompt_pack["module_sequence"],
        "modules": prompt_pack["modules"],
    }
    (output_dir / "prompt_pack.json").write_text(
        json.dumps(json_payload, indent=2), encoding="utf-8"
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a comprehensive prompt pack for LLM-driven specification capture.",
    )
    parser.add_argument(
        "project_name",
        help="Name of the initiative. Used in headings and contextual prompts.",
    )
    parser.add_argument(
        "--stakeholder-label",
        default="stakeholder",
        help="How to refer to the primary interviewee (e.g., client, product owner).",
    )
    parser.add_argument(
        "--output-dir",
        default=None,
        help="Directory where prompt files will be generated. Defaults to docs/generated/<slugified project name>.",
    )
    parser.add_argument(
        "--module",
        dest="modules",
        action="append",
        choices=DEFAULT_MODULE_ORDER,
        help="Optional subset of modules to include (can be repeated). Defaults to all modules in predefined order.",
    )
    return parser.parse_args()


def slugify(value: str) -> str:
    """Convert an arbitrary string into a filesystem-friendly slug."""

    sanitized = [c.lower() if c.isalnum() else "-" for c in value.strip()]
    slug = "".join(sanitized)
    while "--" in slug:
        slug = slug.replace("--", "-")
    return slug.strip("-") or "project"


def main() -> None:
    args = parse_args()

    module_order = args.modules if args.modules else DEFAULT_MODULE_ORDER

    context = {
        "project_name": args.project_name,
        "stakeholder_label": args.stakeholder_label,
        "module_order": module_order,
    }

    output_dir = (
        Path(args.output_dir)
        if args.output_dir
        else Path("docs/generated") / slugify(args.project_name)
    )

    prompt_pack = build_prompt_pack(context)
    write_prompt_pack(output_dir, prompt_pack)

    print(f"Prompt pack written to {output_dir.resolve()}")


if __name__ == "__main__":
    main()
