x1 <-c(1,2,3)
x2 <-c(4,5)
z <- x1+x2;z
library(gtrendsR)

NBA=gtrends("NBA", time = "2014-01-01 2019-01-01")

NBA$interest_over_time
NBA$interest_over_time$hits
NBA$interest_over_time$date

max(NBA$interest_over_time$hits)
which.max(NBA$interest_over_time$hits)
NBA$interest_over_time$date[157]

which.min(NBA$interest_over_time$hits)
NBA$interest_over_time$date[35]
sum(NBA$interest_over_time$hits)

NFL=gtrends("NFL", time = "2014-01-01 2019-01-01")

NFL$interest_over_time
NFL$interest_over_time$hits
NFL$interest_over_time$date

max(NFL$interest_over_time$hits)
which.max(NFL$interest_over_time$hits)
NFL$interest_over_time$date[262]

which.min(NFL$interest_over_time$hits)
NFL$interest_over_time$date[24]
sum(NFL$interest_over_time$hits)


MLB=gtrends("MLB", time = "2014-01-01 2019-01-01")

MLB$interest_over_time
MLB$interest_over_time$hits
MLB$interest_over_time$date

max(MLB$interest_over_time$hits)
which.max(MLB$interest_over_time$hits)
MLB$interest_over_time$date[198]

which.min(MLB$interest_over_time$hits)
MLB$interest_over_time$date[1]
sum(MLB$interest_over_time$hits)

sum(NBA$interest_over_time$hits > MLB$interest_over_time$hits)



