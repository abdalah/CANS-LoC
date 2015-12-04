library(dplyr)
library(magrittr)

#my.vars = c("AGENCY_NAME", "number_placements", "AvgPlacements")
#test <- complete[my.vars]


new <- subset(complete, !duplicated(CHILD_ID))
new <- new %>%
  group_by(AGENCY_ID) %>%
  mutate(AgencyPlacements = sum(number_placements))

new <- subset(new, !duplicated(AGENCY_ID))
new$AvgPlacements <- new$AgencyPlacements/new$KidsInAgency

merger <- cbind.data.frame(new$AGENCY_ID, new$AvgPlacements)
colnames(merger) <- c("AGENCY_ID", "AvgPlacements")

complete <- merge(complete, merger, by="AGENCY_ID")
complete$AvgPlacements[complete$AvgPlacements==NA] <- 0


test <- subset(complete, AGENCY_NAME == "Franklin County Children Services Board")
my.vars = c("CHILD_ID", "AGENCY_ID", "number_placements", "KidsInAgency", "AvgPlacements")
test <- test[my.vars]
test <- subset(test, !duplicated(CHILD_ID))
test <- test %>%
  group_by(AGENCY_ID) %>%
  mutate(AgencyPlacements = sum(number_placements))
test <- test %>%
  group_by(AGENCY_ID) %>%
  mutate(MedianPlacements = median(number_placements))