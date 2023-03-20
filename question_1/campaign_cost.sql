-- model: campaign_cost
-- grain: one record per campaign

with

source as (

    select
      id as campaign_id,
      name as campaign_name,
      type as campaign_type,
      actual_cost as campaign_cost,
      start_date,
      end_date
    from applications.salesforce.campaign

),

responded_campaign_members as (

    select
      campaign_id, 
      count(*) as responded
    from applications.salesforce.campaign_member
    where has_responded = 'true'
    group by 1

),

final as (

    select
      campaign_name,
      campaign_type,
      responded,
      campaign_cost,
      campaign_cost / responded as avg_cost_per_attendee
    from source
    left join responded_campaign_members rcm on 
      rcm.campaign_id = source.campaign_id
    where start_date >= '2022-01-01' -- we only want to compare all campaigns that ran since 2022

)
  
select * from final
order by avg_cost_per_attendee desc -- sort by most costly campaign
limit 10 -- we only want top 10 campaigns
