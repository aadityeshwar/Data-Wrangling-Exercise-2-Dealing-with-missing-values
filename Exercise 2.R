# Assignment 2

#Installing the required packages

install.packages("dplyr")
suppressMessages( library(dplyr) )

install.packages("tidyr")
suppressMessages( library(tidyr) )

# Task 0: Loading Data into RStudio
titanic_org<- read.csv("~/Desktop/Data Science/3 Data Wranging/Exercise 2/Data-Wrangling-Exercise-2-Dealing-with-missing-values/titanic_original.csv")

# #Looking at the structure of the data set
glimpse(titanic_org)
View(titanic_org)

# Task 1: Port of embarkation - Replace Blank cells with "S"

titanic_1 <- titanic_org %>% mutate(embarked = gsub("^$|^ $", "S", embarked))

# Task 2: Age - Populate missing values with mean of age column.

titanic_2 <- titanic_1 %>% mutate(age =ifelse(is.na(age), mean(age, na.rm = TRUE) , age))

# A better way to fill in the N/A values would be to group by embarked and sex and then use the
# median value of each group to fill in the N/A value.

# Task 3: Lifeboat - Replace missing values with "none"

titanic_3 <- titanic_2 %>% mutate(boat = gsub("^$|^ $", "none", boat))

# check if you managed to remove all missing values
unique(titanic_3$boat)

# Task 4: Cabin - The missing values could indicate that these passengers were CREW members.

titanic_4 <- titanic_3 %>% mutate(cabin = gsub("^$|^ $", "Crew", cabin))

# Task 5: New Colomn - has_cabin_number : 0 -> Crew , 1 -> Any other

titanic_5 <- titanic_4 %>% mutate(has_cabin_number = ifelse( cabin == "Crew", 0 , 1))

# Final Data Frame saved as titanic_clean and arranged by group for "company" variable.
titanic_clean <- titanic_5

# Saving the final data frame
write.csv(titanic_clean, file="~/Desktop/Data Science/3 Data Wranging/Exercise 2/Data-Wrangling-Exercise-2-Dealing-with-missing-values/titanic_clean.csv")
