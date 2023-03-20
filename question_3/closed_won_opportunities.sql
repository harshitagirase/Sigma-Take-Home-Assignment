-- model: closed_won_opportunities
-- grain: one record per opportunity per opportunity type

with

final as (

    select
        name,
        type,
        amount as sum_amount,
        -- this will help identify the la
        row_number() over (
            partition by name
            order by close_date desc)
        as row_num
    from applications.salesforce.opportunity
    where stage_name = 'Closed Won' -- we only care about opportunities that are in the 'Closed Won' stage

)

select
    name,
    type,
    sum_amount
from final
/* in the final CTE, the latest record for an opportunity (determined by latest `close_date`) will be asigned a value of 1 
in the `row_num` column. Since we want to get the latest opportunity, we filter our result to only include record with row_num = 1
*/
where row_num = 1
order by 1, 2
