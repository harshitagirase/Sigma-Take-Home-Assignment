## Problem
Write a query that produces a result for the total active rows for each schema, each month, with a month-over-month percent change calculation.


## Data Source
`applications.fivetran_log.fivetran_log__mar_table_history`


## Data Dictionary

* `measured_month`: The month when the data for the schema was measured.
* `schema_name`: The name of the schema.
* `total_monthly_active_rows`: The total monthly active rows for that schema. This is derived from the sum of the 'free_monthly_active_users' and 'paid_monthly_active_users' for each month.
* `month_mar`: The sum of the active rows for each month.
* `prev_month_mar`: The monthly active rows for the previous month.
* `mom_pct_change`: The month-over-month percentage change for a given month. This is calculated by getting the difference between the current month and previous month's data and diving that value by the previous month's data. To convert it into a percentage value, we multiply the result by 100.


## Output

