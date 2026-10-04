# PDLF presentation research

## What makes a technical presentation memorable

### Duarte Sparkline

Use a repeated contrast between the current state and the desired future state. This keeps attention moving because the audience feels the gap instead of just hearing a list of features.

For PDLF:

- Current state: people and AI chase tasks, burn time, and fix the wrong thing faster.
- Future state: attention moves with the problem, while AI handles execution after the problem becomes clear.
- Repeated contrast: "Task first" versus "Problem first".

### Pyramid Principle and SCQA

Use a top-down answer, then explain the reasoning. SCQA gives the opening logic:

- Situation: AI makes execution cheap.
- Complication: cheap execution makes wrong problem definitions more expensive.
- Question: where should human attention go?
- Answer: attention follows the problem, not the task.

For PDLF, this keeps the talk from becoming a method dump.

### Monroe's Motivated Sequence

Use a persuasive five-step arc:

- Attention: show the audience a familiar failure: "AI says done, but the real problem survives."
- Need: wrong attention allocation creates repeated rework and hidden risk.
- Satisfaction: PDLF gives one principle, two trees, and a seven-stage lifecycle.
- Visualization: walk through a slow API case from signal to reusable risk pattern.
- Action: start the next problem with a problem file, not a task list.

### Problem-solution-demo-proof

For technical audiences, credibility comes from a concrete example. Use the slow API case because it shows:

- L0 signal: P99 jumps to 3200ms.
- L1 candidate: query latency looks like the problem.
- L2 problem: function-wrapped index column causes a full scan.
- L3 risk: a reusable pattern now prevents future incidents.

## reveal.js research

reveal.js is a HTML presentation framework. It supports:

- Nested slides for vertical drill-down.
- Fragments for staged reveals.
- Speaker notes through the notes plugin.
- Markdown slides, themes, transitions, and PDF export through browser print.
- Plugins for syntax highlighting, search, zoom, math, and notes.

For this project, the implementation uses:

- CDN-loaded reveal.js, so no local dependency install is required.
- Inline HTML slides for full visual control.
- Fragments for storytelling beats and audience interaction.
- Speaker notes for talk track cues.
- A small local script for the "attention budget" interaction.

## Talk structure

1. Hook: "The most expensive AI failure is solving the wrong problem quickly."
2. Tension: task-first work burns attention and tokens.
3. Core idea: attention follows the problem.
4. Framework: one principle, two trees.
5. Lifecycle: seven stages with human gates.
6. Proof: slow API case from L0 to L3.
7. Audience action: start with `problem.md`.

## Sources consulted

- reveal.js documentation: https://revealjs.com/
- reveal.js plugins and notes docs: https://revealjs.com/plugins/
- Duarte Sparkline overview: https://www.duarte.com/presentation-skills-resources/sparkline-presentations/
- Barbara Minto, The Pyramid Principle: https://www.barbaraminto.com/
- Monroe's Motivated Sequence overview: https://www.mindtools.com/a5nan7a/monroes-motivated-sequence

