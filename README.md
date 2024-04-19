# Addressing Toil in UpCommerce Ticketing

Its become apparent there are a number of duplicated and older alerts appearing in the ticketing system.

Some possible solutions may include:


## Commercial / COTS products

Some product such as Pagerduty, Stackdriver ( Now "cloud ops" ), Incident.io etc may allow the filtering and grouping of these raised ticket entries.


## Other actions to take

If issues/tickets being opened are from now obsolite systems another method may be to seek out those alert generators and simply turn them off or change the alert parameters so that they are more meaningful when raised.

That may include adding additional information to the alert both in to the body of the message and also in to the subject line of the message itself so that the alerts can be more easily broken down.



## Changes to how alerts are generated

Some times alerts generated in this way may need to be changes to different collection methods.

This may also include switching them over to metric based gathering systems such as prometheus and joining that with Grafana for ease of visability 
