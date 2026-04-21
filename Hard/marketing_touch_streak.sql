with cte as (select m.event_id, m.contact_id, m.event_type, m.event_date,
date_sub(m.event_date, interval weekday(m.event_date) day) as week, c.email from marketing_touches m join crm_contacts c on m.contact_id = c.contact_id)

, cte2 as (select contact_id, event_date, week,
lag(week, 2) over (partition by contact_id order by week) as prev1_week,
lag(week, 1) over (partition by contact_id order by week) as prev2_week, email from cte)

select email from cte2 where prev1_week = date_sub(prev2_week, interval 1 week) 
and prev2_week = date_sub(week, interval 1 week) 
and contact_id in (select contact_id from marketing_touches where event_type = 'trial_request');
