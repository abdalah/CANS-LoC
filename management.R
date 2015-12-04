load("V:/secure_data/CANS LoC Pilot/Working/updated.RData")

library(plyr)
library(magrittr)
library(dplyr)

complete3$CHILD_ID = factor(complete3$CHILD_ID)
test <- subset(complete3, table(CHILD_ID)[CHILD_ID] == 2)

test2<- test[,c(1,2,8,3,14,12,13,4,6,7,17,18,19,21,22,61)]

test3 <- ddply(test2, "CHILD_ID", transform, number_placements = length(unique(END_DATE)))

complete4 <- ddply(complete3, "CHILD_ID", transform, number_placements = length(unique(END_DATE)))

df1 <- subset(head(complete3))
df2<- ddply(df1, "CHILD_ID", transform, number_placements = length(unique(END_DATE)))

complete4 <- complete3 %>%
  group_by(CHILD_ID) %>%
  mutate(number_placements = length(unique(END_DATE)))

test2$county <- lapply(strsplit(as.character(test2$AGENCY_NAME), "\\ "), "[", 1)


## 
athens <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Athens Sanitized.csv")
clark <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Clark Sanitized.csv")
frank1 <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Franklin 1 Sanitized.csv")
frank2 <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Franklin 2 Sanitized.csv")
greene <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Greene Sanitized.csv")
guernsey <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Guernsey Sanitized.csv")
knox <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Knox Sanitized.csv")
mad <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Madison Sanitized.csv")
mont <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Montgomery Sanitized.csv")
morrow <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Morrow Sanitized.csv")
stark <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Stark Sanitized.csv") #NO DATES BRO
summit <- read.csv("V:/secure_data/CANS LoC Pilot/working/Foster Report CSVs/Summit Sanitized.csv")

athens$Referral.worker = NULL
athens$LOC.worker = NULL
frank1$Date.of.intial..15..Completion = NULL

athens$County <- "Athens"
clark$County <- "Clark"
frank1$County <- "Franklin"
frank2$County <- "Franklin"
greene$County <- "Greene"
guernsey$County <- "Guernsey"
knox$County <- "Knox"
mad$County <- "Madison"
mont$County <- "Montgomery"
morrow$County <- "Morrow"
stark$County <- "Stark"
summit$County <- "Summit"


colnames(frank1)[1] = "Date.of.initial..15..Completion"
frank1$Date.of.Placement <- NA
frank1 <- frank1[,c(1,16,2,3,4,5,6,7,8,9,10,11,12,13,14,15)]

colnames(frank2)[1] = "Date.of.initial..15..Completion"
colnames(frank2)[3] = "Date.of.final..30.Completion"
colnames(mont)[3] = "Date.of.final..30.Completion"

stark$Date.of.initial..15..Completion <- NA
stark$Date.of.Placement <- NA
stark$Date.of.final..30.Completion <- NA
stark <- stark[,c(14,15,16,1,2,3,4,5,6,7,8,9,10,11,12,13)]

colnames(summit)[1] = ""
summit$Date.of.Placement <- NA

colnames(clark)[10] = "Network.Provider"
clark$X15.question.score <- NA
clark <- clark[,c(1,2,3,4,5,6,7,8,9,10,16,11,12,13,14,15)]

frank1$X = NULL

guernsey$Network.Provider <- NA
guernsey <- guernsey[,c(1,2,3,4,5,6,7,8,9,16,10,11,12,13,14,15)]

pilot <- rbind(athens, clark, frank1, frank2, greene, guernsey, knox, mad, mont, morrow, stark)

save(pilot, file = "V:/secure_data/CANS LoC Pilot/working/pilot_data.rdata")

#NEXT, need to subset complete3 frame to only counties that show up in the pilot, creating PILOT_SACWIS

load("V:/secure_data/CANS LoC Pilot/working/updated.RData")
load("V:/secure_data/CANS LoC Pilot/working/pilot_data.rdata")

pilot <- subset(pilot, !is.na(Person.ID))

sacwis_pilot <- subset(complete, county == "Athens " | county == "Clark " | county == "Franklin " | county == "Greene " | county == "Guernsey " | county == "Knox " | county == "Madison " | county == "Montgomery " | county == "Morrow " | county == "Stark " | county == "Summit ")

save(sacwis_pilot, file = "V:/secure_data/CANS LoC Pilot/working/sacwis_pilot.rdata")

colnames(pilot)[5] = "CHILD_ID"

pilot_test <- merge(sacwis_pilot, pilot, by = "CHILD_ID", all.x = T)


# 12/3

load("V:/secure_data/CANS LoC Pilot/working/pilot_data.rdata")
pilot_kids <- subset(pilot, !duplicated(Person.ID, fromLast = T))
colnames(pilot_kids)[5] = "CHILD_ID"

sacwis_kids <- merge(sacwis_pilot, pilot_kids, by = "CHILD_ID", all.x = T)

save(sacwis_kids, file = "V:/secure_data/CANS LoC Pilot/working/sacwis_kids.rdata") #with pilot excel data added


### subset to agency level

