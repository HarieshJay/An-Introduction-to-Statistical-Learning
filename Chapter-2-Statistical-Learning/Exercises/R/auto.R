# Simple functions applied on an Auto dataset found at http://faculty.marshall.usc.edu/gareth-james/ISL/Auto.csv

init_auto_dataframe <- function(){

    # Reads CSV from a given URL
    auto <- read.csv(url("http://faculty.marshall.usc.edu/gareth-james/ISL/Auto.csv")) 
    
    # Omit missing rows
    auto = na.omit(auto)
}

analyze_range <- function(auto_data_frame){

    #Find range of quanititative predictors

    displacement_range = range(auto_data_frame$displacement)
    weight_range = range(auto_data_frame$weight)
    acceleration_range = range(auto_data_frame$acceleration)
    year_range = range(auto_data_frame$year)

    parameters = c("Displacement", "Weight", "Acceleration", "Year")
    ranges = c(displacement_range, weight_range, acceleration_range, year_range )
    
    # Print out the quantitative parameters and their ranges
    column = 1
    for ( r in 1:4 ){

        cat("range of ", parameters[column], ": ", ranges[r], " -> ", 
            ranges[r+1], "\n")
        column = column + 1
   }
}

analyze_mean_sd <- function(auto_data_frame){

    # find the mean using the mean function
    weight.mean = mean(auto_data_frame$weight)

    # find the standard deviation with the sd function
    weight.sd = sd(auto_data_frame$weight)
    
    # Save and print those results
    cat("Mean and Standard Deviation for Weight: ", weight.mean
        , ", ", weight.sd, "\n")

    displacement.mean = mean(auto_data_frame$displacement)
    displacement.sd = sd(auto_data_frame$displacement)
    cat("Mean and Standard Deviation for Displacement: ", displacement.mean
        , ", ", displacement.sd, "\n")

    acceleration.mean = mean(auto_data_frame$acceleration)
    acceleration.sd = sd(auto_data_frame$acceleration)
    cat("Mean and Standard Deviation for Acceleration: ", acceleration.mean
        , ", ", acceleration.sd, "\n")

    year.mean = mean(auto_data_frame$year)
    year.sd = sd(auto_data_frame$year)
    cat("Mean and Standard Deviation for Year: ", year.mean
        , ", ", year.sd, "\n")

}


analyze_subset <- function(auto_data_frame){

    # Keeps the complement of 
    subset = auto_data_frame[-(10:85),]

    # Find the ranges of the subset
    analyze_range(subset)

    # Find the mean and standard deviation of the solution
    analyze_mean_sd(subset)

}