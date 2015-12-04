load("V:/secure_data/CANS LoC Pilot/working/updated.RData")

my.vars = c("AGENCY_ID", "AGENCY_NAME", "county", "KidsInAgency", "MinorityPercent", "FemalePercent", "pilot")

test <- complete[my.vars]
length(unique(test$AGENCY_ID))

test <- test[!duplicated(test$AGENCY_ID),]

library(ggplot2)


#### 12/2

load("V:/secure_data/CANS LoC Pilot/working/sacwis_pilot.rdata")
load("V:/secure_data/CANS LoC Pilot/working/pilot_data.rdata")

pilot$Person.ID <- as.factor(pilot$Person.ID)
dupd <- pilot[duplicated(pilot$Person.ID),]
dupd2 <- pilot[duplicated(pilot$Person.ID, fromLast = T),]
dupd <- rbind(dupd, dupd2)


load("V:/secure_data/CANS LoC Pilot/working/updated.RData")

dead <- subset(complete, DECEASED_FLAG == 1)
dead <- dead[!duplicated(dead$CHILD_ID),]
with(dead, table(AGENCY_NAME))

ggplot(dead, aes(factor(IntakeAgeGroup))) +
  geom_bar(stat = "bin", aes(fill = factor(number_placements)))



####
install.packages('timeline', repos='http://cran.r-project.org')
require(timeline)
data(ww2)
timeline(ww2, ww2.events, event.spots=2, event.label='', event.above=FALSE)

my.vars = c("CHILD_ID", "IntakeAgeGroup", "REMOVED_DATE", "DECEASED_DATE")
dead.test <- dead[my.vars]
colnames(dead.test)[3] = "Start_date"
colnames(dead.test)[4] = "End_date"


timeline(dead.test, event.spots=2, event.label='', event.above=FALSE)


ggplot(dead, aes(factor(race))) +
  geom_bar(stat = "bin", aes(fill = factor(number_placements)))

save(dead, file = "V:/secure_data/CANS LoC Pilot/working/deceased.rdata")
