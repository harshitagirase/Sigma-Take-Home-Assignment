-- model: campaign_cost.sql
-- grain: one record per campaign

with

source as (

    select
      id as campaign_id,
      name as campaign_name,
      type as campaign_type,
      actual_cost,
      number_of_responses,
      start_date,
      end_date
    from applications.salesforce.campaign
),

final as (
    select
      campaign_name,
      campaign_type,
      number_of_responses,
      actual_cost,
      actual_cost / number_of_responses as campaign_cost
    from source
    where start_date >= '2022-01-01' -- we only want to compare all campaigns that ran since 2022
)
  
select * from final
order by campaign_cost desc
limit 10