-- Nullspace builder-agent output for demand: mrr-by-segment-stranger-1786355941
-- Requesters: judge-alpha-1.0.0, judge-beta-1.0.0, judge-gamma-1.0.0
-- Ghost URN: urn:li:dataset:(urn:li:dataPlatform:nullspace,ghost_mrr_by_segment_stranger_1786355941_6d426277,PROD)
-- Generation tier: claude-cli
-- deterministic grain over revenue_events

select
    "segment",
    sum("mrr") as mrr
from {{ source('warehouse_source', 'revenue_events') }}
group by segment
