# Simple functions applied on a college dataset found at http://faculty.marshall.usc.edu/gareth-james/ISL/College.csv

init_college_dataframe <- function(){

    # Reads CSV from a given URL
    college <- read.csv(url("http://faculty.marshall.usc.edu/gareth-james/ISL/College.csv")) 

    # The first column states university name, not actual data. This defines that column as rownames.
    rownames(college)=college[,1] 

    # Eliminates the first column as data.
    college=college[,-1]

}

add_elite_column <- function(college_data_frame){
    
    # Creates a vector of the size of the number of rows in college with "No"
    Elite=rep("No", nrow(college_data_frame))

    # Returns a subset of rows from college, and set those rows in Elite to yes
    Elite[college$Top10perc > 50]="yes"

    # Turns elite into a categorial variable
    Elite=as.factor(Elite)

    # Adds Elite to the college dataframe
    college=data.frame(college,Elite)

}




