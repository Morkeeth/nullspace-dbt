# nullspace-dbt

The warehouse repo that **Nullspace's builder agent writes into**.

Companion to [`Morkeeth/nullspace`](https://github.com/Morkeeth/nullspace) — the
DataHub agent-hackathon submission.

## Why this repo exists separately

Nullspace is demand-side metadata: consumer agents search DataHub for a dataset that
does not exist, and each miss materialises or increments a **ghost** — a real DataHub
dataset URN tagged `ghost`, carrying a demand counter and edges back to every agent
that asked.

When demand crosses threshold, a builder agent claims the ghost, reads the requesters'
declared query contracts off the graph to infer the grain, discovers a warehouse source
from DataHub, validates its generated SQL against the live warehouse (`EXPLAIN` plus a
sampled read), and **opens a pull request here**.

That pull request has to be real, against a repo a stranger can open, or the last beat
of the demo is a `file://` path and a promise. This repo is that target.

## What is in `main`

Only the base: `dbt_project.yml` and `models/stg_trials.sql`. **`main` deliberately
contains no ghost models.** Every `nullspace/ghost_*` branch and its pull request is
work an agent did, not work a human staged.

## Reading a Nullspace PR

Each PR carries, in its body, the provenance the human ancestor of this workflow never
had: which agents asked, what each of them was trying to run, the union of fields that
became the schema, the warehouse source the builder discovered, and the SQL-validation
proof. On merge, the ghost goes solid in DataHub — real schema, real lineage, and the
demand edges persist as provenance pointing at the agents that caused the table to exist.

## Running it

```bash
dbt deps && dbt build   # profile: nullspace (Postgres; see nullspace/compose.yaml)
```

Licensed Apache-2.0, same as the parent project.
