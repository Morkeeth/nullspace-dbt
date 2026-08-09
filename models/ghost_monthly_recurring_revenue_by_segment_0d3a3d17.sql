-- Nullspace builder-agent output for demand: monthly recurring revenue by segment
-- Requesters: revenue-copilot-1.0.0, finance-agent-2.3.1, board-deck-writer-0.9.0
-- Ghost URN: urn:li:dataset:(urn:li:dataPlatform:nullspace,ghost_monthly_recurring_revenue_by_segment_0d3a3d17,PROD)
-- Generated from registered query contracts and a DataHub-returned source.

select
    "segment",
    "mrr",
    "month",
    "churned_mrr"
from {{ source('warehouse_source', 'revenue_events') }}
