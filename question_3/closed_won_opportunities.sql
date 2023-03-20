-- model: closed_won_opportunities
-- grain: one record per account per opportunity type

with

opportunities as (

  select
    account_id,
    type,
    amount,
    -- the latest record for an opportunity (determined by latest `close_date`) will be asigned a 
    -- value of 1 in the `row_num` column.
    row_number() over (
            partition by name
            order by close_date desc)
    as row_num
  from applications.salesforce.opportunity
  -- alternative: where stage_name = 'Closed Won'
  where is_closed = 'True' and is_won = 'True' -- we only care about opportunities that are in the 'Closed Won' stage

),

accounts as (

  select
    account_id,
    name
  from applications.salesforce.account
    
),

/*  Since we want to get the latest opportunity, we filter our result to only include records with row_num = 1
*/
final as (

  select
    accounts.name,
    opportunities.type,
    sum(opportunities.amount) as sum_amount
  from opportunities
  left join accounts on 
    accounts.account_id = opportunities.account_id
  where row_num = 1
  group by 1, 2

)

select * from final
order by name
