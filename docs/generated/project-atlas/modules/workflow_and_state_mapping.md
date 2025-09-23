## End-to-End Workflow and State Exploration

            **Objective**: Map every functional flow, alternative path, exception, and supporting loop across the product lifecycle.

            1. Facilitate iterative exploration of workflows. After each flow, ask whether additional flows exist and loop until the stakeholder indicates completion.
2. For each workflow, capture:
   - Triggering conditions and entry points.
   - Detailed step-by-step narrative, including parallel tasks permitted (maximum concurrency of four independent tasks).
   - Required data inputs, transformations, and outputs at every stage.
   - Alternate, error, and edge-case paths where steps are skipped, data is invalid, or user behaviour deviates from the happy path.
3. Request Mermaid (`.mmd`) sequence and flow diagrams for each workflow, capturing both primary and exception paths. Store in `docs/diagrams/workflows/`.
4. Flag dependencies between workflows so that implementation order and testing plans avoid circular or blocking relationships.