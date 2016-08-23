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

titanic_mean_age <- titanic_1 %>% summarise(mean_age = mean(age, na.rm = TRUE))

titanic_2 <- titanic_1 %>% mutate(age =ifelse(is.na(age), titanic_mean_age , age))




