-- model: mom_change
-- grain: one record per measured month per schema name


with
  
source as (

    select
      measured_month,
      schema_name,
      -- there are multiple records for a given month so we add up all active users for a specific month for each schema name
      sum(total_monthly_active_rows) as month_mar
    from applications.fivetran_log.fivetran_log__mar_table_history
    group by 1, 2

),

/*  
    we use the lag() window function to get previous month's MAR details. Partitioning by schema_name ensures that 
    we're only looking at data for the given schema. ie.if we want to calculate MOM change for 'asana', we shouldn't be 
    comparing or looking at 'bingads' data or that'll give us inaccurate information. We order by 'measured_month' so that
    we can accurately look at and compare prev month's data.
*/
prev_month_details as (

  select 
    *, 
    lag (month_mar) over (
        partition by schema_name
        order by measured_month asc
      ) as prev_month_mar 
  from source

),

/*
    We calculate month-over-month value change by getting the difference between the current month and previous
    month's data and diving that value by the previous month's data. To convert it into a percentage value, we multiply
    the result by 100. Note that the MOM change for the first month for each schema will be null because we don't have data
    for the month before that.
*/
final as (

  select
    *,
    (month_mar - prev_month_mar) * 100 / prev_month_mar as mom_pct_change
  from prev_month_details

)

select * from final