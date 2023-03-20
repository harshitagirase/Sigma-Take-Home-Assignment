## Problem
Write a query that finds the latest closed won opportunity by account and by opportunity type, and returns the opportunity amount for each of the closed won opportunity types. The output should also include the name of the account.


## Data Source
`applications.salesforce.opportunity`
`applications.salesforce.account`


## Data Dictionary

* `name`: The name of the opportunity.
* `type`: The type of the opportunity. This can be one of Upsell, Renewal or New Business.
* `sum_amount`: The dollar value corresponding to each opportunity where stage_name = `Closed Won`.

## Notes
I verified the data in the schema to ensure that every opportunity record where `stage_name` = 'Closed Won' also had the `is_won` and `is_closed` columns set to `true`. 


## Output

<img width="1056" alt="Screen Shot 2023-03-20 at 2 17 25 AM" src="https://user-images.githubusercontent.com/16471203/226296385-03c37d00-7e14-462c-84fc-a925543195c3.png">


