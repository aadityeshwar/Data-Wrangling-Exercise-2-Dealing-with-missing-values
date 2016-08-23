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
