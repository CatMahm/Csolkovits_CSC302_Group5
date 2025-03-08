getwd()
setwd("C:/Users/Ari/Desktop/Rscripts")
getwd()
read.csv("WorldCupMatches.csv", header = T)
dfWCM <- read.csv("WorldCupMatches.csv",)

# (a) Size of Data Frame: 852 Rows x 20 Columns
rows = nrow(dfWCM)
cols = ncol(dfWCM)
print(rows)
print(cols)

# (b) Statistical Summary of Data with Summary Function
# Provided columns with Mean and Median data
#Mean: Year, Home.Team.Goals, Away.Team.Goals, Attendance, Half.time.Home.Goals, Half.time.Away.Goals, RoundID, MatchID
#Median: Year, Home.Team.Goals, Away.Team.Goals, Attendance, Half.time.Home.Goals, Half.time.Away.Goals, RoundID, MatchID
summary(dfWCM)

# (c) Unique Locations Olympics Were Held At: 151
# Length() function counts the number of elements after the unique() function removes any duplicates
locations = length(unique(dfWCM$City))
print(locations)

# (d) Average Attendance. This data can be seen in the Attendance column after summary(dfWCM)
# Average Attendance (Mean): 45165
# Verify this with excluded NA : This is 45164.8
mean(dfWCM$Attendance, na.rm = T)

# (e) Total Goals Scored for ALL Home Teams: 1,543
# Load Library
library(dplyr)
goals <- dfWCM %>%
group_by(Home.Team.Name) %>%
summarise(goals = sum(Home.Team.Goals, na.rm = T))
print(goals)
total_goals <- sum(goals$goals)
print(total_goals)

# (f) Average Attendees/year: Attendance dipped in the 1930s. Started increasing in the mid 1960s.
attendance_year = dfWCM %>%
group_by(Year) %>%
summarise(avg.Attendance = mean(Attendance, na.rm = T))
print(attendance_year)
