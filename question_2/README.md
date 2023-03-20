## Problem
Write a query that produces a result for the total active rows for each schema, each month, with a month-over-month percent change calculation. BONUS — if the month is not complete, estimate the usage for that month


## Data Source
`applications.fivetran_log.fivetran_log__mar_table_history`


## Data Dictionary

* `measured_month`: The month when the data for the schema was measured.
* `schema_name`: The name of the schema.
* `total_monthly_active_rows`: The total monthly active rows for that schema. This is derived from the sum of the 'free_monthly_active_users' and 'paid_monthly_active_users' for each month.
* `month_mar`: The sum of the active rows for each month.
* `prev_month_mar`: The monthly active rows for the previous month.
* `mom_pct_change`: The month-over-month percentage change for a given month. This is calculated by getting the difference between the current month and previous month's data and diving that value by the previous month's data. To convert it into a percentage value, we multiply the result by 100.


## Notes
For the bonus part of the question, I'd divide the number of days in the month by the number of days left in the month and multiply the result by the current usage for the ongoing month. Eg. If we were looking at the data on March 15, then the estimate for the month of March would be (31/(31-15) * current_usage).


## Output

<img width="998" alt="Screen Shot 2023-03-20 at 1 39 54 AM" src="https://user-images.githubusercontent.com/16471203/226287865-4cfa2904-96aa-4078-b5f6-fdb02cac9993.png">
<img width="995" alt="Screen Shot 2023-03-20 at 1 41 00 AM" src="https://user-images.githubusercontent.com/16471203/226288112-57ea7682-6989-49f4-a2db-1857d1a11a60.png">
