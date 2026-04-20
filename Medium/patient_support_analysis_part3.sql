with cte as (select policy_holder_id, call_date, call_duration_secs, 
lag(call_date) over (partition by policy_holder_id order by call_date) as prev_call
from callers)

select count(distinct policy_holder_id) as policy_holder_count 
from cte where prev_call > date_sub(call_date, interval 7 day)
