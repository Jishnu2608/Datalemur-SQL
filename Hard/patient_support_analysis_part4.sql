with cte as (select year(call_date) as yr, month(call_date) as mth, count(case_id) as total_cases from callers 
where call_duration_secs >300 group by 1,2 order by 2),

cte2 as (select yr, mth, total_cases, lag(total_cases) over(order by yr, mth) as prev_cases from cte)

select yr, mth, round((total_cases - prev_cases) * 100.0 / prev_cases,1) from cte2;
