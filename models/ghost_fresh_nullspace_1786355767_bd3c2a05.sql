-- Nullspace fallback model for demand: fresh-nullspace-1786355767
-- Requesters: revenue-copilot-1.0.0, finance-agent-2.3.1, board-deck-writer-0.9.0, cfo-assistant-1.1.0
-- Ghost URN: urn:li:dataset:(urn:li:dataPlatform:nullspace,ghost_fresh_nullspace_1786355767_bd3c2a05,PROD)
-- Schema source: disclosed fallback (no requester queries were registered)

select
    cohort_id,
    count(*) as trials,
    count(converted_at) as conversions,
    count(converted_at)::double precision / nullif(count(*), 0) as trial_to_paid_rate
from {{ source('warehouse_source', 'trials') }}
group by cohort_id
