load("updated.RData")

complete$county <- lapply(strsplit(as.character(complete$AGENCY_NAME), "\\County"), "[", 1)

complete$county <- unlist(complete$county)

library(magrittr)
library(dplyr)
library(lubridate)
#you have to create a new dataframe (or rewrite your existing one)
complete <- complete %>%
  group_by(CHILD_ID) %>%
  mutate(number_placements = length(unique(END_DATE)))


# library(ggplot2)
# library(plyr)
# library(lubridate)
# complete3$LengthOfStay <- as.numeric(as.Date(complete3$END_DATE)-as.Date(complete3$BEGIN_DATE), units="days")
# ggplot(complete3, aes(x=lengthofstay)) + geom_histogram(binwidth=7)
# 
# complete$IntakeAge <- NULL
# complete$DischargeAge <- NULL
# 
# complete3$IntakeYears <- new_interval(complete3$BIRTH_DATE, complete3$BEGIN_DATE) / duration(num = 1, units = "years")
# complete3$IntakeMonths <- new_interval(complete3$BIRTH_DATE, complete3$BEGIN_DATE) / duration(num = 1, units = "months")
# complete3$IntakeDays <- new_interval(complete3$BIRTH_DATE, complete3$BEGIN_DATE) / duration(num = 1, units = "days")
# 
# age.labels <- c("0-4 years old", "5-7 years old", "8-11 years old", "12-14 years old", "15-17 years old", "18+ years old")
# complete3$IntakeAgeGroup <- cut(complete3$IntakeYears, breaks = c(0, 5, 8, 12, 15, 18, 100), labels = age.labels, include.lowest = TRUE)
# 
# complete3$LengthOfStay <- new_interval(complete3$BEGIN_DATE, complete3$END_DATE) / duration(num = 1, units = "months")
# los.labels <- c("Under 1 month", "1 to 2 months", "3 to 6 months", "7 to 11 months", "1 to 2 years", "2+ years")
# complete3$losMonths <- cut(complete3$LengthOfStay, breaks = c(0, 1,  3,  7, 12, 24, 100), labels = los.labels, include.lowest = FALSE)
# 
# ggplot(complete3, aes(x=IntakeAgeGroup)) + geom_bar()
# ggplot(complete3, aes(x=losMonths)) + geom_bar()
# ggplot(complete3, aes(x=IntakeYears)) + geom_histogram(binwidth=1)


#####
library(dplyr)
library(magrittr)
library(data.table)

# complete$AGENCY_ID <- factor(complete$AGENCY_ID)
# complete$CHILD_ID <- factor(complete$CHILD_ID)
# 
# complete <- complete %>% group_by(AGENCY_ID) %>%
#   mutate(KidsInAgency=n_distinct(CHILD_ID))
# 
# complete$KidsInAgency2 <- complete$`as.factor(AGENCY_ID)` <- complete$White <- NULL
# 
# complete$White <- 0
# complete$White[complete$race=="White"] <- 1

# complete <- complete %>% group_by(county) %>%
#   mutate(AgencyWhite=sum(unqiue(White)))

# ggplot(complete, aes(x=KidsInAgency)) + geom_histogram()
# ggplot(complete, aes(x=AgencyWhiteWhite, y=county)) + geom_histogram()

save(complete, df.5, file="updated.RData")
load("updated.RData")

new<-subset(complete, !duplicated(CHILD_ID) & race=="White",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(White=length(unique(CHILD_ID)))
new <- subset(new, !duplicated(AGENCY_ID))
new$MinorityPercent <- 1-new$White/new$KidsInAgency
merger <- cbind.data.frame(new$AGENCY_ID, new$MinorityPercent)
colnames(merger) <- c("AGENCY_ID", "MinorityPercent")

complete <- merge(complete, merger, by="AGENCY_ID", all.x = T)

new<-subset(complete, !duplicated(CHILD_ID) & GENDER_CODE=="FEMALE",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(Female=length(unique(CHILD_ID)))
new <- subset(new, !duplicated(AGENCY_ID))
new$AgencyFemalePercent <- new$Female/new$KidsInAgency
merger <- cbind.data.frame(new$AGENCY_ID, new$AgencyFemalePercent)
colnames(merger) <- c("AGENCY_ID", "AgencyFemalePercent")

complete <- merge(complete, merger, by="AGENCY_ID", all.x = T)


complete$pilot <- 0
complete$pilot[complete$county=="Athens "] <- 1
complete$pilot[complete$county=="Clark "] <- 1
complete$pilot[complete$county=="Franklin "] <- 1
complete$pilot[complete$county=="Greene "] <- 1
complete$pilot[complete$county=="Guernsey "] <- 1
complete$pilot[complete$county=="Knox "] <- 1
complete$pilot[complete$county=="Madison "] <- 1
complete$pilot[complete$county=="Montgomery "] <- 1
complete$pilot[complete$county=="Morrow "] <- 1
complete$pilot[complete$county=="Stark "] <- 1
complete$pilot[complete$county=="Summit "] <- 1


new<-subset(complete, !duplicated(CHILD_ID),)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(AgencyAverageAge=mean(IntakeYears, na.rm=T))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$AgencyAverageAge)
colnames(merger) <- c("AGENCY_ID", "AgencyAverageAge")

complete <- merge(complete, merger, by="AGENCY_ID", all.x = T)

new<-subset(complete, !duplicated(CHILD_ID),)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(AgencyAverageLOS=mean(LengthOfStay, na.rm=T))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$AgencyAverageLOS)
colnames(merger) <- c("AGENCY_ID", "AgencyAverageLOS")

complete <- merge(complete, merger, by="AGENCY_ID", all.x = T)

## Average Number of Placements, Placement Types, Remove Service Authorization

save(complete, df.5, file="updated.RData")

########################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################

rm(list = ls())
load("updated.RData")

complete$SERVICE_AUTH_ID <-  complete$BASIC_COST <-  complete$COST_TYPE_CODE <-  complete$SERVICE_BEGIN_DATE <-  complete$SERVICE_END_DATE <-  complete$SERVICE_RATE_ID <-  complete$EFFECTIVE_DATE <-  complete$UNIT_OF_MEASURE <-  complete$STANDARD_COST <-  complete$CONTRACT_ID <-  complete$CONTRACT_COST_ID <-  complete$PERSON_ID <-  complete$COST_BEGIN_DATE <-  complete$COST_END_DATE <-  complete$UNIT_COST <-  complete$MAINTENANCE_COST <-  complete$ADMIN_COST <-  complete$PROVIDER_SERVICE_ID <- complete$EFFECTIVE_DATE.y <- complete$LEGAL_STATUS_INFO_ID.y <- NULL

new<-subset(complete, PlacementType=="Certified Children's Residential Center",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(ResidentialCenter=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$ResidentialCenter)
colnames(merger) <- c("AGENCY_ID", "ResidentialCenter")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)

new<-subset(complete, PlacementType=="Certified Foster Home",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(FosterHome=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$FosterHome)
colnames(merger) <- c("AGENCY_ID", "FosterHome")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)

new<-subset(complete, PlacementType=="Certified Approved Non-Relative",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(NonRelative=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$NonRelative)
colnames(merger) <- c("AGENCY_ID", "NonRelative")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)


new<-subset(complete, PlacementType=="Certified Group Home",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(GroupHome=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$GroupHome)
colnames(merger) <- c("AGENCY_ID", "GroupHome")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)

new<-subset(complete, PlacementType=="Certified/Approved Relative Care",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(RelativeCare=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$RelativeCare)
colnames(merger) <- c("AGENCY_ID", "RelativeCare")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)


new<-subset(complete, PlacementType=="Detention Facility",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(DetentionFacility=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$DetentionFacility)
colnames(merger) <- c("AGENCY_ID", "DetentionFacility")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)


new<-subset(complete, PlacementType=="LICENSEDMEF",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(LICENSEDMEF=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$LICENSEDMEF)
colnames(merger) <- c("AGENCY_ID", "LICENSEDMEF")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)

new<-subset(complete, PlacementType=="Adoptive Placement",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(AdoptivePlacement=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$AdoptivePlacement)
colnames(merger) <- c("AGENCY_ID", "AdoptivePlacement")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)

new<-subset(complete, PlacementType=="Certified Emergency Shelter Care Facility",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(EmergencyShelter=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$EmergencyShelter)
colnames(merger) <- c("AGENCY_ID", "EmergencyShelter")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)

new<-subset(complete, PlacementType=="Independent Living",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(IndependentLiving=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$IndependentLiving)
colnames(merger) <- c("AGENCY_ID", "IndependentLiving")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)

new<-subset(complete, PlacementType=="Own Home",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(OwnHome=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$OwnHome)
colnames(merger) <- c("AGENCY_ID", "OwnHome")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)

new<-subset(complete, PlacementType=="Residential Parenting Facility",)
new <- new %>% group_by(AGENCY_ID) %>%
  mutate(ResidentialParenting=length(AGENCY_ID))
new <- subset(new, !duplicated(AGENCY_ID))
merger <- cbind.data.frame(new$AGENCY_ID, new$ResidentialParenting)
colnames(merger) <- c("AGENCY_ID", "ResidentialParenting")

complete <- merge(complete, merger, by="AGENCY_ID", all.x=T)

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(ResidentialCenter=ResidentialCenter/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(FosterHome=FosterHome/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(NonRelative=NonRelative/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(GroupHome=GroupHome/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(RelativeCare=RelativeCare/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(DetentionFacility=DetentionFacility/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(LICENSEDMEF=LICENSEDMEF/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(AdoptivePlacement=AdoptivePlacement/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(EmergencyShelter=EmergencyShelter/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(IndependentLiving=IndependentLiving/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(OwnHome=OwnHome/length(AGENCY_ID))

complete <- complete %>% group_by(AGENCY_ID) %>%
  mutate(ResidentialParenting=ResidentialParenting/length(AGENCY_ID))

new <- subset(complete, !duplicated(CHILD_ID))
new <- new %>%
  group_by(AGENCY_ID) %>%
  mutate(AgencyPlacements = sum(number_placements))

new <- subset(new, !duplicated(AGENCY_ID))
new$AvgPlacements <- new$AgencyPlacements/new$KidsInAgency

merger <- cbind.data.frame(new$AGENCY_ID, new$AvgPlacements)
colnames(merger) <- c("AGENCY_ID", "AvgPlacements")

complete <- merge(complete, merger, by="AGENCY_ID", all.x = T)

save(complete, df.5, file = "updated.RData")
rm(list = ls())
load("updated.RData")

complete$MinorityPercent <- complete$MinorityPercent.y
complete$MinorityPercent.x <- complete$MinorityPercent.y <- NULL
complete$AgencyAverageAge <- complete$AgencyAverageAge.y
complete$AgencyAverageAge.x <- complete$AgencyAverageAge.y <- NULL
complete$AgencyAverageLOS <- complete$AgencyAverageLOS.y
complete$AgencyAverageLOS.x <- complete$AgencyAverageLOS.y <- NULL
complete$AgencyFemalePercent <- complete$AgencyFemalePercent.y
complete$AgencyFemalePercent.x <- complete$AgencyFemalePercent.y <- NULL

save(complete, df.5, file = "updated.RData")
rm(list = ls())
load("updated.RData")

AgencyLevel <- complete[!duplicated(complete$AGENCY_ID),]

save(AgencyLevel, file = "AgencyLevel.RData")
load("AgencyLevel.RData")

AgencyLevel <- AgencyLevel[!is.na(AgencyLevel$AGENCY_NAME),]

AgencyLevel <- subset(AgencyLevel, substr(AGENCY_NAME, nchar(AGENCY_NAME)-14, nchar(AGENCY_NAME)) != " Juvenile Court")

save(AgencyLevel, file = "AgencyLevel.RData")
