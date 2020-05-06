# Exercises for Chapter 2: Statistical Learning

source("college.R")
source("auto.R")

Libary(MASS)

clean_work_space <- function(){
    # Deletes all objects in the workspace
    rm(list = ls(envir=.GlobalEnv), envir=.GlobalEnv)
}


# intialize the dataset to a variable
college = init_college_dataset()  

# Creates a summary of each variable in the dataset
summary(college) #

# Creates a scatter plot matrix for each pair in the first 10 columns
pairs(college[,1:10])

# Create a plot of Outstate vs Private
plot(college$Outstate, college$Private)

# Add a last categorical column based on elite schools
college = add_elite_column(college)

summary(college)

plot(college$Outstate, college$Elite)

hist(college$Outstate)

# Find rows based on a condition. Boston[,"chas"] == 1 returns the rows where the condition are met, and then are indexed.
cr <- Boston[Boston[,"chas"] == 1,]
