-- Nullspace fallback model for demand: weekly active accounts by plan tier
-- Requesters: verify_agent_a, verify_agent_b, verify_agent_c
-- Ghost URN: urn:li:dataset:(urn:li:dataPlatform:nullspace,ghost_weekly_active_accounts_by_plan_tier_e33ebde2,PROD)
-- Schema source: disclosed fallback (no requester queries were registered)

select
    cohort_id,
    count(*) as trials,
    count(converted_at) as conversions,
    count(converted_at)::double precision / nullif(count(*), 0) as trial_to_paid_rate
from {{ source('warehouse_source', 'trials') }}
group by cohort_id
