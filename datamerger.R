load("df1.rdata")

df.1$tmp <- factor(df.1$DISCHARGE_REASON_CODE)
df.1$DischargeReason <- NA

names <- c("Adjudication Determination/Under 18", "Adoption Finalized", "Age", "Awol/Abducted by Family Member", "Awol/Non-Family Abduction", "Awol/Runaway Whereabouts Unkown Contact Case Worker", "Child Died", "Child to Remain W/ Current Provider", "Custody to Third Party", "Discharged to Another Agency", "Emancipation", "Guardian to Kinship Relaive", "Guardianship to Kinship Non-Relative", "Guardianship Permanent", "Guardianship to Third Party", "Independent Living", "Independent Living/18 Years Old", "Legal Custody to Kinship Non-Relative", "Legal Custody to Kinship", "Living With Non-Removal Father", "Living With Non-Removal Mother", "Living With Non-Removal Parent", "Living With Kinship Relative", "Living With Kinship Non-Relative", "Living With Removal Father", "Living With Removal Parent", "Living With Removal Mother", "Marriage", "Military", NA, "Return to Custodian", "Returned to Guardian", "Returned to Parent", "Runaway/Awol")

i=1
for (prog in levels(df.1$tmp)) {
  df.1$DischargeReason[df.1$DISCHARGE_REASON_CODE==prog] <- names[i]
  i=i+1
}

df.1$DISCHARGE_REASON_CODE <- NULL

df.1$tmp <- factor(df.1$PLACEMENT_TYPE_CODE)
df.1$PlacementType <- NA

names <- c("Adoptive Placement", "Certified Approved Non-Relative", "Certified/Approved Relative Care", "Certified Children's Residential Center", "Certified Emergency Shelter Care Facility", "Certified Foster Home", "Certified Group Home", "Detention Facility", "Independent Living", "LICENSEDMEF", "Own Home", "Residential Parenting Facility" )

i=1
for (prog in levels(df.1$tmp)) {
  df.1$PlacementType[df.1$PLACEMENT_TYPE_CODE==prog] <- names[i]
  i=i+1
}

df.1$PLACEMENT_TYPE_CODE <- NULL

df.1$tmp <- factor(df.1$END_REASON_CODE)
df.1$EndReason <- NA

names <- c("Abuse/Neglect Allegations", "Agency Transfer", "Age of Child", "Awol 30 Days", "Caregivers Request", "CTJRSDCTNTRNS", "Discharge", "Disruption From Adoptive Placement", "Disruption From Non-Adoptive Place", "Educational Setting", "Foster Adopt Same Place Setting", "Judicial Determination", "KINFOSSPS", "Move Closer to Parent/Relative", "Moved to Adoptive Home", "Move Emergency Too Long", "Move to Less Restrive Environment", "Move to More Restrictive Enviornment", NA, "Provider Closed", "Provider On Leave", "Treatment Needs")

i=1
for (prog in levels(df.1$tmp)) {
  df.1$EndReason[df.1$END_REASON_CODE==prog] <- names[i]
  i=i+1
}

df.1$END_REASON_CODE <- NULL


df.1$tmp <- factor(df.1$PROVIDER_RELATIONSHIP_CODE)
df.1$ProviderRelationship <- NA

names <- c("Aunt", "Brother", "Cousin", "Father", "Grandfather", "Grandmother", "Grandson", "Great-Aunt", "Great-Uncle", "Half-Brother", "Half-Sister", "Mother", "Mother-In-Law", "Non-Marital Adult Caretaker", "Non-Relative", NA, "Other", "Other Relative", "Sister", "Stepbrother", "Stepfather", "Stepmother", "Stepsister", "Uncle", "Unknown")

i=1
for (prog in levels(df.1$tmp)) {
  df.1$ProviderRelationship[df.1$PROVIDER_RELATIONSHIP_CODE==prog] <- names[i]
  i=i+1
}

df.1$PROVIDER_RELATIONSHIP_CODE <- NULL

df.1$tmp <- factor(df.1$PRIMARY_REMOVAL_REASON_CODE)
df.1$RemovalReason <- NA

names <- c("Abandonment", "Alcohol Abuse of Child", "Alcohol Abuse of Parent", "Caretaker's Inability to Cope", "Child Behavior Problems", "Child of Minor Parent", "Child Disability", "CONVERT**", "Death of Parents", "Delinquency", "Dependency", "Drug Abuse of Child", "Drug Abuse of Parent", "Deserted Child/Safe Haven Baby", "Emotional Maltreatment/Mental Injury", "ICPC", "Inadequate Housing", "Incarceration of Parents", "Neglect", NA, "Public Children Servies Agency Received Custody", "Physical Abuse", "Relinquishment", "Sexual Abuse", "Sibling Removal", "Unruly Status Offender", "Withholding Treatment From Disabled Infant")

i=1
for (prog in levels(df.1$tmp)) {
  df.1$RemovalReason[df.1$PRIMARY_REMOVAL_REASON_CODE==prog] <- names[i]
  i=i+1
}

df.1$PRIMARY_REMOVAL_REASON_CODE <-NULL

df.1$tmp <- factor(df.1$REMOVAL_REASON_CODE)
df.1$RemovalReason <- NA

names <- c("Abandonment", "Alcohol Abuse of Child", "Alcohol Abuse of Parent", "Caretaker's Inability to Cope", "Child Behavior Problems", "Child of Minor Parent", "Child Disability", "CONVERT**", "Death of Parents", "Delinquency", "Dependency", "Drug Abuse of Child", "Drug Abuse of Parent", "Deserted Child/Safe Haven Baby", "Emotional Maltreatment/Mental Injury", "ICPC", "Inadequate Housing", "Incarceration of Parents", "Neglect", NA, "Public Children Servies Agency Received Custody", "Physical Abuse", "Relinquishment", "Sexual Abuse", "Sibling Removal", "Unruly Status Offender", "Withholding Treatment From Disabled Infant")

i=1
for (prog in levels(df.1$tmp)) {
  df.1$RemovalReason[df.1$REMOVAL_REASON_CODE==prog] <- names[i]
  i=i+1
}

df.1$REMOVAL_REASON_CODE <- NULL

df.1$tmp <- factor(df.1$LEAVE_TYPE_CODE)
df.1$LeaveType <- NA

names <- c("Alternative Leave", "AWOL/Abducted by Family Member", "AWOL/Nonfamily Abduction", "AWOL/Runaway - Whereabouts Unknown Contacting Caseworker", "Camp", "Detention", "Hospital Admission", NA, "Parental/Relative/Non-relative Visit", "Pre-Placement Visit", "Respite", "Runaway/Awol", "Trial Home Visit", "Vacation")

i=1
for (prog in levels(df.1$tmp)) {
  df.1$LeaveType[df.1$LEAVE_TYPE_CODE==prog] <- names[i]
  i=i+1
}

df.1$LEAVE_TYPE_CODE <- NULL
df.1$tmp <- NULL
rm(i, names, prog)

load("df6.rdata")

# myvars <- c("AGENCY_ID", "AGENCY_NAME", "PROVIDER_ID")
# agencies <- df.6[myvars]
# agencies <- agencies[!duplicated(agencies$AGENCY_ID),]
# nice <- merge(df.1, agencies, by="AGENCY_ID")
# 
# 
# two <- unique(bigA$newvar)
# check <- df.6[!(df.6$newvar %in% two), ]
# unique(check$newvar)

small <- df.1

bigA <- subset(df.6, EXPIRATION_DATE > as.Date("2012-01-01") )
bigA$PROVIDER_ID[bigA$PROVIDER_ID=="null"] <- NA
bigA <- subset(bigA, !duplicated(bigA[c("AGENCY_ID", "PROVIDER_ID")]), )

agencyone <- bigA[!is.na(bigA$PROVIDER_ID),]
agencyone$agencyprovider <- paste(agencyone$AGENCY_ID, agencyone$PROVIDER_ID, sep = "-")
small$agencyprovider <- paste(small$AGENCY_ID, small$SERVICE_PROVIDER_ID, sep = "-")
two <- unique(agencyone$agencyprovider)
smallone <- small[small$agencyprovider %in% two, ]
one <- merge(smallone, agencyone, by="agencyprovider", all.x=T)

agencytwo <- bigA[is.na(bigA$PROVIDER_ID),]
smalltwo <- small[!(small$agencyprovider %in% two), ]
two <- merge(smalltwo, agencytwo, by="AGENCY_ID", all.x=T)

myvars <- c("AGENCY_ID", "PLACEMENT_EPISODE_ID", "PLACEMENT_SETTING_ID", "CHILD_ID", "BEGIN_DATE", "END_DATE", "SERVICE_ID", "GROUP_CAT_ID", "SERVICE_PROVIDER_ID", "LEGAL_STATUS_INFO_ID", "REMOVED_DATE", "DISCHARGE_DATE", "PLACEMENT_LEAVE_ID", "LEAVE_DATE", "RETURN_DATE", "SERVICE_TYPE", "DischargeReason", "PlacementType", "EndReason", "ProviderRelationship", "RemovalReason", "LeaveType", "agencyprovider", "AGENCY_CERTIFICATION_ID", "AGENCY_NAME", "EFFECTIVE_DATE", "EXPIRATION_DATE", "CERTIFYING_ENTITY_CODE", "PROVIDER_ID")

one$AGENCY_ID <- one$AGENCY_ID.x

one <- one[myvars]

two$agencyprovider <- paste(two$AGENCY_ID, two$SERVICE_PROVIDER_ID, sep = "-")
complete <- rbind(one, two)

save(complete, file="updated.RData")
rm(list = ls())
load("updated.RData")
load("df2.rdata")
load("df3.rdata")
load("df4.rdata")
load("df5.rdata")

df.2$CHILD_ID <- df.2$PERSON_ID
df.3$CHILD_ID <- df.3$PERSON_ID
df.3$END_DATE <- df.3$CUSTODY_END_DATE
df.5$SERVICE_PROVIDER_ID <- df.5$PROVIDER_ID
df.2$PERSON_ID <- NULL
df.3$PERSON_ID <- NULL
df.5$PROVIDER_ID <- NULL

df.5 <- subset(df.5, LICENSE_EXPIRATION_DATE > as.Date("2012-01-01") )

complete1 <- merge(complete, df.2, by=c("PLACEMENT_SETTING_ID", "SERVICE_ID", "CHILD_ID", "PLACEMENT_LEAVE_ID"), all.x = T)
complete2 <- merge(complete1, df.3, by=c("AGENCY_ID", "CHILD_ID", "END_DATE"), all.x = T)
complete2$AGENCY_NAME <- complete2$AGENCY_NAME.x
complete2$AGENCY_NAME.x <- complete2$AGENCY_NAME.y <- NULL
complete3 <- merge(complete2, df.4, by="CHILD_ID", all.x = T)

save(df.5, complete3, file = "updated.RData")
rm(list=ls())
load("updated.RData")
