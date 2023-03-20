## Problem
Write a query that finds the top 10 most costly campaigns ran since 2022, where most costly is determined as the total campaign cost divided by the number of campaign members that responded to the campaign.


## Data Source(s)
`applications.salesforce.campaign`
`applications.salesforce.campaign_member`


## Data Dictionary

* `campaign_name`: The name of the campaign.
* `campaign_type`: The type of the campaign.
* `responded`: The number of members that responded to the campaign.
* `campaign_cost`: The actual cost of the campaign.
* `avg_cost_per_attendee`: The average cost of the campaign per attendee. This is calculated by dividing the total campaign cost by the number of campaign members that responded to the campaign.


## Output

<img width="1111" alt="Screen Shot 2023-03-18 at 12 45 26 PM" src="https://user-images.githubusercontent.com/16471203/226134108-612ab747-931c-4929-97c6-7b66142d8a57.png">

