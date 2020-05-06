question_8 <- function(){

    # install the ISLR package
    install.packages("ISLR")

    # load the ISLR library
    library(ISLR)

    # attach the Auto dataset
    attach(Auto)

    # Omit missing rows
    Auto = na.omit(Auto)
    
    # simple linear regression of horsepower onto mpg
    lm_mpg_horsepower <- lm(mpg~horsepower)

    # prints the results of the regression
    summary(lm_mpg_horsepower)

    # calculate the confidence interval of 95% when horsepower = 98
    predict(lm_mpg_horsepower, data.frame(horsepower=c(98)), interval="confidence")

    # calculate the prediction interval of 95% when horsepower = 98
    predict(lm_mpg_horsepower, data.frame(horsepower=c(98)), interval="prediction")

    # creates a graph of horsepower against mpg
    plot(mpg,horsepower)

    # plots the least squares regression line onto the exisiting plot
    abline(lm_mpg_horsepower)

    # allows for 4 seperate graphs to be seen simulateneously
    par(mfrow=c(2,2))

    # plots the 4 diagnostic graphs
    plot(lm_mpg_horsepower)

    "

    a)

    i. Is there a relationship between the predictor and the response?

    Yes, there is a relationship between the predictor, horsepower, and the response, mpg. This can be recognized
    by the low p-value and the high R-squared value.

    ii. How strong is the relationship between the predictor and
    the response?

    The relationship is strong, the p-value from the t-statistic is 2e-16 and 2.2e-16 from the f-test. This shows that the f-value and the t-value are statistically significant, because 
    the probability of seeing a value as extreme or more extreme in the f-distribution and t-distribution are low. The RSS is near 1 as well, which means that
    a great deal of the variance is explained.   

    iii. Is the relationship between the predictor and the response
    positive or negative?

    The relationship is negative since the coefficients are primarily negative. This implies that as horsepower increases, the mpg
    tends to decrease.

    iv. What is the predicted mpg associated with a horsepower of
    98? What are the associated 95 % confidence and prediction
    intervals?

    = \beta_0 + \beta_1 * x_1
    = 39.935861 + -0.157845 * 98
    = 24.467051

    The confidence interval of 95% for a horsepower of 98 is

           fit      lwr      upr
    1 24.46708 23.97308 24.96108

    The prediction interval of 95% for a horsepower of 98 is 

           fit     lwr      upr
    1 24.46708 14.8094 34.12476

    c)

    Residuals vs Fitted: The points seem to be equally distributed around the horizontal sign, means the
    linear assumption of the data is correct.

    Normal Q-Q: Majority of the trend is linear, showing that residuals are normally distributed.

    Scale-Location: The residuals seem to be increasing as the fitted value increase. This may be an indicator of
    heteroscedasticity, or non-constant variance in the residuals.

    Residuals vs Leverage: There seems to be one cook on the cooks distance line, this means that it has a high leverage
    and does not follow the general trend.

    "
}

question_9 <- function(){

    # install the ISLR package
    install.packages("ISLR")

    # load the ISLR library
    library(ISLR)

    # omit missing rows
    Auto = na.omit(Auto)

    # attach the Auto dataset
    attach(Auto)

    # produces a scatterplot matrix of all of the variables compared to themselves
    pairs(Auto)

    # calculate the correlation of the variables, excluding the name column since it is not numerical
    cor(Auto[,-9])

    # perform multiple regression with mpg as the response and the other variables, besides name, as the predictors
    lm.fit <- lm(formula = mpg ~ . - name, data=Auto)

    # print the results of the regression
    summary(lm.fit)

    "
    i. Is there a relationship between the predictors and the response?

    Yes, the p-value for the f-statistic is small, 2.2e-16 , this shows that the relationship between the response and the predictors
    is statistically significant. The R^2 value is near 1 as well, showing that a lot of the variance in the response is explained using the
    predictors.
    
    ii. Which predictors appear to have a statistically significant relationship to the response?
    
    Weight, year, and origin seem to have the highest statistical significance to the response. The p-value from their t-statistic
    show that there are very few values as extreme or more in the t-distribution. So it is very unlikely this is due to random chance.
    
    iii. What does the coefficient for the year variable suggest?

    This suggests that newer cars are more fuel efficient since they are capable of achieving higher miles per gallon.
    
    "

    # allows for 4 seperate graphs to be seen simulateneously
    par(mfrow=c(2,2))

    # plots the 4 diagnostic graphs
    plot(lm.fit)

    "
    Residuals vs Fitted: There seems to be a pattern in the plot, which indicates that the relationship may not be linear.

    Normal Q-Q: The residuals seem to be normally distributed since the line is primarily linear.

    Scale-Location: Heteroscedasticity may be present since the variation in the error terms increase, as the response increases.
    This can be fixed by applying a concave function to the te repsonse such as log or sqrt.

    Residuals vs Leverage: Some points do not seem to conform to the general trend. It may be best to remove data point 14 since
    it has a very high leverage meaning it has a unusual predictor value.

    "

    # adding several interaction variables to see their significance 
    lm.fit <- lm(formula = mpg ~ . - name + horsepower*weight + acceleration*cylinders 
        + weight*acceleration + horsepower*year + acceleration*year, data=Auto)

    "
    Use the correlation matrix and add interaction variables with the highest correlation. The correlation between cylinders and displacement and
    displacement and weight seemed to be the highest. The interaction variables have a low p-value for their t-statstic, showing that they are 
    statistically significant.
    "
    
    lm.fit1 <- lm(formula = log(mpg) ~ . - name, data=Auto)

    "
    Due to the heteroscedasticity observed in the scale location graph, applying a concave or sqrt function will reduce the non-constant variance in
    error terms. The normal model has a R^2 value of  0.8762, model where the response is logged has a R^2 value of 0.8795, and when the response is 
    square rooted has a value of 0.8561. So the logged explains the variation in the model the best. It may be beneficial to try operations on the 
    other parameters as well.
    "

}

question_10 -> function(){

    # install the ISLR package
    install.packages("ISLR")

    # load the ISLR library
    library(ISLR)

    # use the Carseats dataset
    attach(Carseats)

    # predict Sales using Price, Urban and US
    lm.fit1 <- lm(Sales ~ Price + Urban + US, data=Carseats)

    # displays the dummy variables used for qualitative variables
    contrasts (US )
    contrasts (Urban )

    "
    The predictor price has a negative impact on the sales of a carseat. For the qualitative values, the baseline takes the value of them
    being no, where the yes instances show the differences in the average from the no instances. Meaning if the area is in the US, the price will increase
    and if the area is urban, the price will be less.
    "

    # print the results of the regression
    summary(lm.fit1)

    "
    The null hypothesis can be rejected for Price and US due to their low p-values from their t-statistics, but not for Urban since it's p-value is very high.

    \hat{y} = 13.043469 + -0.054459*x_1 + -0.021916*x_2 + 1.200573*x_3

    "

    # model only using statisically significant predictors
    lm.fit2 <- lm(Sales ~ Price + US, data=Carseats)

    "
    The R^2 value of the original model is 0.2335, and the R^2 value of the model without Urban is 0.2354. Since the R^2 value is greater, though only slightly, 
    it is evidence that there is a stronger relationship between the new model. A change in the f-statistic would also be evidence of a better model, but the change was
    not big enough to have a statistical impact.  
    "

    # confidence interval of 95% for different values of sales
    predict(lm.fit2, interval="confidence")

    # allows for 4 seperate graphs to be seen simulateneously
    par(mfrow=c(2,2))

    # plots the 4 diagnostic graphs
    plot(lm.fit2)

    "
    There is evidence of high leverage points in the Residuals vs Leverage plot because of the points that distant from the general trend.
    "
    
    # plot the studentized residuals
    plot(predict(lm.fit2), rstudent(lm.fit2))
    
    "
    To find outliers, plot the studentized residuals, which means dividing the residuals by its estimated standard error. Points greater than 3 signify outliers. There are no such points. 
    "


}

question_11 <- function(){

    # a seed is a starting point in generating random numbers. You will always get the same random numbers from the same seed
    set.seed(1)

    # generates normal random numbers
    x = rnorm(100)

    # creates normal random numbers in relation to x
    y = 2*x+rnorm(100)

    # simple linear regression with no intercept
    lm.fit1 <- lm(y~x+0)

    # display the results
    summary(lm.fit1)

    "
    
      Estimate Std. Error t value Pr(>|t|)    
    x   1.9939     0.1065   18.73   <2e-16

    The p-value of the t-statistic is very low, which allows us to reject the null hypothesis.

    "

    # simple regression reversed
    lm.fit2 <- lm(x~y+0)

    "
      Estimate Std. Error t value Pr(>|t|)    
    y  0.39111    0.02089   18.73   <2e-16 ***

    The p-value and the t-statistic are the same, though the coefficient is different.

    "
}

question_13 <- function(){

    # sets starting point for random numbers
    set.seed(1)

    # normally distributed random variables with a mean of 0 and a variance of 1
    x1 <- rnorm(100, 0, 1)

    # normally distributed with a mean of 0 and a varaince of 0.25
    eps1 <- rnorm(100, 0, 0.25)

    # create a vector y in relation to x and eps
    y1 <- (-1 + 0.5*x1 + eps1)

    "
    The length of y will be the same as eps and x, 100. \beta_0 is -1, \beta_1 is 0.5 and the irreducible error is the mean of eps.
    "

    # scatterplot of x and y
    plot(x1,y1)

    "
    There seems to be an positive, linear relationship between x and y.
    "

    # linear regression model to predict y using x
    lm.fit1 <- lm(y1~x1)

    "
    The results were similar to the predicted values.

                Estimate Std. Error t value Pr(>|t|)    
    (Intercept) -1.00942    0.02425  -41.63   <2e-16 ***
    x            0.49973    0.02693   18.56   <2e-16 ***

    "

    plot(x1,y1)

    # add the least squares linear model to the scatterplot
    abline(lm.fit1, col=2, lwd=3)

    # add the population regression line of intercept -1 and slope of 0.5
    abline(-1, 0.5, col=3, lwd=3)

    # create a legend
    legend(y=0.5,x=-2, legend = c("Least Squares", "pop. regression"), col=3:2, lwd=3)

    # use a polynomial model
    lm.fit2 <- lm(y1~ I(x1^2))

    # display the results of the regression
    summary(lm.fit2)

    "
    The polynomial model fits the data much worse. As seen by its low R^2 value, high p-values, and high RSE.
    "

    # sets starting point for random numbers
    set.seed(1)

    # normally distributed random variables with a mean of 0 and a variance of 1
    x2 <- rnorm(100, 0, 1)

    # lower the variance of epsilon to decrease the noise
    eps2 <- rnorm(100, 0, 0.01)

    # create a vector y in relation to x and eps that has reduced variance
    y2 <- (-1 + 0.5*x2 + eps2)

    # linear regression model to predict y2 using x2
    lm.fit2 <- lm(y2~x2)

    # sets starting point for random numbers
    set.seed(1)

    # normally distributed random variables with a mean of 0 and a variance of 1
    x3 <- rnorm(100, 0, 1)

    # increase the variance of epsilon to increase the noise
    eps3 <- rnorm(100, 0, 1)

    # create a vector y in relation to x and eps that has increased variance
    y3 <- (-1 + 0.5*x3 + eps3)

    # linear regression model to predict y2 using x2
    lm.fit3 <- lm(y3~x3)

    # the confidence interval of model with less noise
    confint(lm.fit2)

    # the confidence interval of the model with more noise
    confint(lm.fit3)

    "
    The confidence interval of the model with increased noise, more varaince in epsilon, is much wider than the one with reduced noise.
    "

}

question_14 -> function(){

    # Sets starting point for random numbers
    set.seed(1)

    # generate 100 uniform random numbers
    x1=runif(100)

    # x2 is created as a function of x1
    x2=0.5*x1+rnorm(100)/10

    # y is a linear model with relation to x1 and x2
    y=2+2*x1+0.3*x2+rnorm (100)

    "
    The linear model can be seen as
    y = \beta_0 + \beta_1 * x_1 + \beta_2 * x_2 + \epsilon
    y = 2 + 2 * x_1 + 0.3 *x_2 + rnorm(100)
    "

    # there is a linear relationship between x_1 and x_2
    plot(x1, x2)

    # least squares regression of y using x_1 and x_2
    lm.fit1 = lm(y~x1 + x2)

    summary(lm.fit1)

    "
    Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
    (Intercept)   2.1305     0.2319   9.188 7.61e-15 ***
    x1            1.4396     0.7212   1.996   0.0487 *  
    x2            1.0097     1.1337   0.891   0.3754    
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    Residual standard error: 1.056 on 97 degrees of freedom
    Multiple R-squared:  0.2088,    Adjusted R-squared:  0.1925 
    F-statistic:  12.8 on 2 and 97 DF,  p-value: 1.164e-05

    \beta_0 is 2.1305, \beta_1 is 1.4396, and \beta_2 is 1.0097. The intercept is somewhat close, but the coefficients are incorrect. The R^2 value is low, showing that the
    relationship between the predictors and response is low. The p-value for the f-statistic is high, showing that the parameters are statistically significiant. The null
    hypothesis for x2 cannot be rejected, since the p-value associated with the t-statistic is quite high. But the p-value of x1 is fairly low, and the null hypothesis can be rejected.
    
    "

    # least squares regression of y using x_1
    lm.fit2 = lm(y~x1)

    summary(lm.fit2)

    # least squares regression of y using x_2
    lm.fit3 = lm(y~x2)

    summary(lm.fit3)

    "The null hypothesis in both models can be rejected due to the low p-values in the t-statistic. This is contradictory to the model in (c) since then it was not possible to reject the
    null hypothesis due to x_2's high p-value."

    # add a new point to the data
    x1=c(x1, 0.1)
    
    x2=c(x2, 0.8)
    
    y=c(y,6)

    # linear regression with added point
    lm.fit4 <- lm(y ~ x1 + x2)

    # allows for 4 seperate graphs to be seen simulateneously
    par(mfrow=c(2,2))

    # plots the 4 diagnostic graphs
    plot(lm.fit4)

    # plots the studentized residuals
    plot(predict(lm.fit4), rstudent(lm.fit4))

    "
    The added point is a high leverage point, but not an outlier. In the Residuals vs Leverage graph, this point
    is clearly unusual and is on the cooks distance line, displaying that it has high leverage. To check for outliers,
    check if the studentized residual is greater than 3, since there are no such points, this is not an outlier.
    "

}


question_15 <- function(){

    # install the MASS package
    install.packages("MASS")

    # load the MASS library
    library(MASS)

    # attach the Boston dataset
    attach(Boston)

    # simple linear models of crime rate regressed on different predictors
    lm.crim_zn <- lm(crim ~ zn, data=Boston)

    summary(lm.crim_zn)

    # zn          -0.07393    0.01609  -4.594 5.51e-06 ***


    lm.crim_dis <- lm(crim ~ dis, data=Boston)
    
    summary(lm.crim_dis)

    # dis          -1.5509     0.1683  -9.213   <2e-16 ***


    lm.crim_rad <- lm(crim ~ rad, data=Boston)
    
    summary(lm.crim_rad)

    # rad          0.61791    0.03433  17.998  < 2e-16 ***


    lm.crim_indus <- lm(crim ~ indus, data=Boston)
    
    summary(lm.crim_indus)

    # indus        0.50978    0.05102   9.991  < 2e-16 ***

    
    lm.crim_tax <- lm(crim ~ tax, data=Boston)
    
    summary(lm.crim_tax)

    # tax          0.029742   0.001847   16.10   <2e-16 ***


    lm.crim_ptratio <- lm(crim ~ ptratio, data=Boston)
    
    summary(lm.crim_ptratio)

    # ptratio       1.1520     0.1694   6.801 2.94e-11 ***


    lm.crim_chas <- lm(crim ~ chas, data=Boston)
    
    summary(lm.crim_chas)

    # chas         -1.8928     1.5061  -1.257    0.209  


    lm.crim_nox <- lm(crim ~ nox, data=Boston)
    
    summary(lm.crim_nox)

    # nox           31.249      2.999  10.419  < 2e-16 ***


    lm.crim_black <- lm(crim ~ black, data=Boston)
    
    summary(lm.crim_black)

    # black       -0.036280   0.003873  -9.367   <2e-16 ***


    lm.crim_rm <- lm(crim ~ rm, data=Boston)
    
    summary(lm.crim_rm)

    # rm            -2.684      0.532  -5.045 6.35e-07 ***


    lm.crim_lstat <- lm(crim ~ lstat, data=Boston)
    
    summary(lm.crim_lstat)

    # lstat        0.54880    0.04776  11.491  < 2e-16 ***


    lm.crim_age <- lm(crim ~ age, data=Boston)
    
    summary(lm.crim_age)

    # age          0.10779    0.01274   8.463 2.85e-16 ***


    lm.crim_medv <- lm(crim ~ medv, data=Boston)
    
    summary(lm.crim_medv)

    # medv        -0.36316    0.03839   -9.46   <2e-16 ***



    # multiple regression model with all predictors
    lm.fit1 <- lm(crim~., data=Boston)

    summary(lm.fit1)

    "
    Using a threshold of a p-value of 0.05 or 5% the most statistically significant predictors are zn, nox, dis, rad, black and medv.
    "


    # polynomial regression model to observe existence of polynomial relationships

    lm.crim_zn_poly <- lm(crim ~ poly(zn,3) , data=Boston)

    summary(lm.crim_zn_poly)


    lm.crim_dis_poly <- lm(crim ~ poly(dis,3) , data=Boston)
    
    summary(lm.crim_dis_poly)


    lm.crim_rad_poly <- lm(crim ~ poly(rad,3) , data=Boston)
    
    summary(lm.crim_rad_poly)


    lm.crim_indus_poly <- lm(crim ~ poly(indus,3) , data=Boston)
    
    summary(lm.crim_indus_poly)

    
    lm.crim_tax_poly <- lm(crim ~ poly(tax,3) , data=Boston)
    
    summary(lm.crim_tax_poly)


    lm.crim_ptratio_poly <- lm(crim ~ poly(ptratio,3) , data=Boston)
    
    summary(lm.crim_ptratio_poly)


    lm.crim_chas_poly <- lm(crim ~ poly(chas,3) , data=Boston)
    
    summary(lm.crim_chas_poly)


    lm.crim_nox_poly <- lm(crim ~ poly(nox,3) , data=Boston)
    
    summary(lm.crim_nox_poly)


    lm.crim_black_poly <- lm(crim ~ poly(black,3), data=Boston)
    
    summary(lm.crim_black_poly)


    lm.crim_rm_poly <- lm(crim ~ poly(rm,3), data=Boston)
    
    summary(lm.crim_rm_poly)


    lm.crim_lstat_poly <- lm(crim ~ poly(lstat,3), data=Boston)
    
    summary(lm.crim_lstat_poly)


    lm.crim_age_poly <- lm(crim ~ poly(age,3), data=Boston)
    
    summary(lm.crim_age_poly)


    lm.crim_medv_poly <- lm(crim ~ poly(medv,3), data=Boston)
    
    summary(lm.crim_medv_poly)

}
