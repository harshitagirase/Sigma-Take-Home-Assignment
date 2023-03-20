## Problem
Write a query that finds the top 10 most costly campaigns ran since 2022, where most costly is determined as the total campaign cost divided by the number of campaign members that responded to the campaign.


## Data Source
`applications.salesforce.campaign`


## Data Dictionary

* `campaign_name`: The name of the campaign.
* `campaign_type`: The type of the campaign.
* `responded`: The number of members that responded to the campaign.
* `campaign_cost`: The actual cost of the campaign.
* `avg_cost_per_attendee`: The average cost of the campaign per attendee. This is calculated by dividing the total campaign cost by the number of campaign members that responded to the campaign.

## Notes/ Assumptions
I initially used the `number_of_responses` column in the `campaign` schema but realized that the values for the campaign did not match the data I got by counting the number of responses using the `campaign_member` schema. Since the data from the `campaign_number` schema matched the result table in the Assignment PDF, I decided to change my approach and not use the `number_of_responses` column in the `campaign` schema. But, if the business objective was to leverage the `number_of_responses` column, I would use that column in that case.

<img width="1140" alt="Screen Shot 2023-03-20 at 1 26 57 AM" src="https://user-images.githubusercontent.com/16471203/226285880-47bdcd0a-3004-4d9e-8c4e-025d38d5bd72.png">


Also, the data is a little weird. I was exploring the `campaign` schema and the data in the schema was confusing. For a campaign member with status = 'Responded', the 'has_responded' field is set to 'false' which is odd.

<img width="922" alt="Screen Shot 2023-03-20 at 1 15 34 AM" src="https://user-images.githubusercontent.com/16471203/226285923-645cb9ef-6819-4306-88f5-b7dd23a6e37f.png">



## Output

<img width="1040" alt="Screen Shot 2023-03-20 at 1 28 18 AM" src="https://user-images.githubusercontent.com/16471203/226285959-982af6f6-a5b3-4ffe-bf0c-0123d3f69a0e.png">

