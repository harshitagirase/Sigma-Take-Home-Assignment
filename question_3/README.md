## Problem
Write a query that finds the latest closed won opportunity by account and by opportunity type, and returns the opportunity amount for each of the closed won opportunity types. The output should also include the name of the account.


## Data Source
`applications.salesforce.opportunity`


## Data Dictionary

* `name`: The name of the opportunity.
* `type`: The type of the opportunity. This can be one of Upsell, Renewal or New Business.
* `sum_amount`: The dollar value corresponding to each opportunity where stage_name = Closed Won.


## Output
