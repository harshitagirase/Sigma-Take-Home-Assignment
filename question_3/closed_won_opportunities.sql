-- model: closed_won_opportunities
-- grain: one record per opportunity per opportunity type

with

final as (

    select
        name,
        type,
        amount as sum_amount,
        row_number() over (
            partition by name
            order by close_date desc)
        as row_num
    from applications.salesforce.opportunity
    where stage_name = 'Closed Won'

)

select
    name,
    type,
    sum_amount
from final
where row_num = 1