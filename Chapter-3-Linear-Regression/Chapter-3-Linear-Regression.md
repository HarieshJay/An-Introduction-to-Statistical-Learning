## 3.1 Simple Linear Regression

$$
Y = \beta_0 + \beta_1X
$$

where $X$ is a single predictor
$$
RSS = (y_1-\hat{\beta}_0-\hat{\beta_1}x_1)^2+...+(y_1-\hat{\beta}_0-\hat{\beta_n}x_n)^2\\
RSS = \sum^n_{i=1}(y_i - \hat{y}_i)^2
$$
to minimize the Residual Sum of Squares
$$
\hat{\beta_1} =\frac{\sum^n_{i=1}(x_i-\bar{x})(y_i-\bar{y})}{\sum^n_{i=1}(x_i-\bar{x})^2}\\
\hat{\beta_0} = \bar{y}-\hat{\beta_1}\bar{x}
$$
where $\bar{y} \approx \frac{1}{n}\sum^n_{i=1} y_i $ and $\bar{x} \approx \frac{1}{n}\sum^n_{i=1} x_i $ are the sample means.

Computing the standard error of a predicted variable, given $\sigma$ is the standard deviation of the realizations of $y_i$. This shows how far an estimate of $\mu$ will be.
$$
Var(\hat\mu) = SE(\hat\mu)^2 = \frac{\sigma^2}{n}
$$
To compute the Standard Errors of $\beta_0$ and $\beta_1$
$$
SE(\hat\beta_0)^2 = \sigma^2[\frac{1}{n}+\frac{\bar{x}^2}{\sum^n_{i=1}(x_i-\bar{x})^2}]\\
SE(\hat\beta_1)^2 = \frac{\sigma^2}{\sum^n_{i=1}(x_i-\bar{x})^2}
$$
$\sigma$ can be estimated with the Residual Standard Error
$$
RSE = \sqrt{(RSS/(n-2))}
$$
Confidence intervals defines intervals where there is a $c$ probability that the true value is in that interval. For linear regression, the $95\%$ confidence interval for $\beta_1$ takes the form.
$$
\hat{\beta_1} \pm 2 \cdot SE(\hat{\beta_1})
$$
Which means there is a $95\%$ chance that the interval 
$$
[ \hat{\beta_1} - 2 \cdot SE(\hat{\beta_1}), \hat{\beta_1} + 2 \cdot SE(\hat{\beta_1})]
$$
contains the true value of $\beta_1$. 

The confidence interval describes how well the mean is determined assuming a Gaussian distribution, and tells you about the likely location of the true value. Prediction intervals describe where the next data point will be. It tells you about the distribution of values, not the uncertainty in determining the mean. The standard error in the prediction interval accounts for uncertainty due to sampling, like the confidence interval, and the variability of the individuals around the predicted mean.

Null Hypothesis tests tries to prove that there is no relation between $X$ and $Y$ by showing $\beta_1 = 0$. 

**T-Statistic**

This can be done using the t statistic. This measures the number of standard deviations $\hat\beta_1$ is from $0$, based on its standard error. $n-2$ degrees of freedom in the t distribution proves the null hypothesis.
$$
t = \frac{\hat\beta_1 - 0}{SE(\hat\beta_1)}
$$
Cannot do a z test since there is no standard deviation, so it is predicted with the standard error using a t test. The p value would be the likelihood of getting that t score in a t distribution.

After finding a t statistic, graph a t distribution assuming it's normally distributed. And find where the t statistic (From the formula) lays in the distribution. If it is near the ends of the distribution, it is extreme. Find a critical t value, given a percentage, and see if the t statistic is more extreme than that value.

Using the t statistic you can find the p value, or probability value, which is the percentage probability of how extreme the t statistic is.

**P-Value**

p value or probability value is the measure of the strength of the evidence against the null hypothesis. How likely it is to get a result like this if the Null Hypothesis is true. Probability of getting the observed value of the test statistic, or a value with even greater evidence against the null hypothesis.

If the p value is small, there is a relation between the predictor and the response.

**Residual Standard Error**

Residual Standard Error is the average amount that the response will deviate from the true regression line.
$$
RSE = \sqrt{\frac{1}{n-2}RSS} = \sqrt{\frac{1}{n-2}\sum^n_{i=1}(y_i-\hat{y_1})^2}
$$
Measure of the lack of fit. Even if the correct $\beta_0$ and $\beta_1$ were found, any prediction of sales would still be off by the RSE on average.

**$R^2$ Statistic**

Residual Standard Error is measured in units of $Y$, so it's harder to interpret what is a good RSE.
$$
R^2 = \frac{Explained Error}{Total Difference}=\frac{TSS-RSS}{TSS} = 1 - \frac{RSS}{TSS}
$$
The total sum of squares is $TSS = \sum(y_i-\bar{y})^2$ measures the total variance in the response $Y$, or the amount of variability in the response before the regression. $RSS$ measures the amount of variability that is unexplained after performing the regression. 

$TSS-RSS$ measures the amount of variability that is explained or removed by the regression. $R^2$ that is close to $0$, represents that regression did not explain the variability in the response.

Adding more parameters, no matter how insignificant, will increase the $RSS$ slightly. If a parameter increases the $RSS$ greatly when added, that provides evidence that it's significant.

## 3.2 Multiple Linear Regression

**F-Statistic**
$$
F = \frac{(TSS-RSS)/p}{RSS/(n-p-1)} = \frac{Explained Error}{Unexplained Error}
$$

The f statistic is used to check the null hypothesis of multiple predictors. 

If the assumptions of the linear model are correct, then the denominator of the f statistic $E\{RSS/(n-p-1)\} = \sigma^2$. If the null hypothesis is true, the numerator,  $E\{(TSS-RSS)/p\} = \sigma^2$. So, if there is no relationship between the response and the predictors, the f statistic would be close to 1, otherwise it would be greater. 

If there is a relationship between the predictors and the response,  $E\{(TSS-RSS)/p\} > \sigma^2$ since there will be more explained error. 

Larger $n$ values would require a f statistic slightly larger than 1 to disprove the null hypothesis, but a smaller $n$ would require a higher one.

When verifying the null hypothesis for a subset of predictors. Use a modified f statistic.
$$
F = \frac{(RSS_0 -RSS)/q}{RSS/(n-p-1)}
$$
Where $RSS_0$ uses the same predictors except for the ones tested for the null hypothesis.

When the quantity of $p$ is high, there is a possibility there is a high t statistic solely on chance. This will not happen with f statistics since it takes into account the quantity of $p$.

f statistic fails if there is a very large $p$, or when $p > n$.

**Variable Selection: Deciding Important Predictors**

Using p values on each predictor will cause false positives when p is large.

Trying a combination of each subset of p values is infeasible since there are $2^p$ models.

3 Classical Methods of Choosing Predictors

*Forward Selection*

1. Begin with a model with an intercept but no predictors.
2. Fit p simple regressions (one variable regressions) and add the predictor with the lowest $RSS$.
3. Add the variable that results in the lowest $RSS$ for the new two-variable model

Greedy algorithm that includes variables that become redundant.

*Backward Selection*

1. Start will all variables in the model.
2. Remove the variable with the largest p value
3. Fit the new model and remove the variables with the largest p values

p cannot be greater than $n$ for Backward Selection, but Forward Selection can always be used.

*Mixed Selection*

1. Start with no variables
2. Add a variable, but remove any variables when it's p value passes a threshold.
3. Continue until all variables in the model have a low p value and variables outside the model would have a large p value when added

**Model Fit**

In linear regression $R^2$ is the square of the correlation of the response and the variable. In multiple regression it represents $Cor(Y,\hat{Y})^2$, the square of the correlation between the response and the fitted linear model. 

$R^2$ close to 1 indicated that the model explains a large portion of the variance. $R^2$ will always increase when adding more variables. 
$$
RSE = \sqrt{\frac{1}{n-p-1}RSS}
$$
Adding a insignificant predictor will increase the $RSE$ because despite always increasing the $RSS$ it reduces the fraction.

## 3.3 Other Considerations in the Regression Model

For qualitative variables, create a dummy variable for that factor. 

Dummy variables can take values $\{0,1\}$ for two level predictors, like male or female. This way $\beta_0$ represents the value of one of the classes since the coefficient will be reduced to $0$, while $\beta_1$ represents the difference from that class. Values of $\{1,-1\}$ can also be used where $\beta_0$ is the average and the coefficients are how much the factors are greater or less than the average.

For multiple levels, create multiple variables, for example, $1$ if a person is African, but $0$ for every other ethnicity. Here $\beta_0$ represents the baseline, and every other coefficient is how much that ethnicity differs from that baseline, above or below. 

Linear regression assumes that the relationship between the predictor and the response is additive and linear. Additive where the effect of changes in a predictor $X_j$ on the response is independent of the values of other predictors. And linear where a one-unit change in $X_j$ is constant regardless of the value of $X_j$.

**Removing the Additive Assumption**

Adding a interaction term can account for an interaction effect, where increasing one variable increases the effect of another.
$$
Y = \beta_0 + \beta_1X_1 + \beta_2 X_2 + \beta_3 X_1 X_2 + \epsilon
$$
$\beta_3$ can be seen as the in increase in effectiveness of $X_1$ for one unit increase of $X_2$, or the other way around.

Hierarchical principle states that if the interaction between two variables are significant, both variables should also be included in the model, even if they have large p values.

When the interaction between variables is not modelled, it makes it difficult to predict the consequences of changing the value of a variable.

**Non-linear Relationships**

Polynomial regression can be used to accommodate non-linear relationships. 

For example, $mpg = \beta_0 + \beta_1 \times horsepower + \beta_s \times horsepower^2 + \epsilon$. This can be formatted into a linear model where $X_2 = horsepower^2$. 

### Potential Problems with Linear Regression

1. Non-linearity of the Data

   If the true relationship is far from linear, than all conclusions from the fit are suspect and will reduce the prediction accuracy. Residual plots graph the residuals $y_i - \hat{y}_i$ versus the predictor $x_i$. The presence of a pattern may indicate a problem with the linear model.

2. Correlation of the Error Terms

   Standard errors are computed assuming that the error terms $\epsilon_1,...,\epsilon_n$ are unrelated. If there is a relationship in the error terms, then the estimated standard errors will underestimate the true standard errors, and impact the p values and confidence intervals.

   Occurs in time series data, when measurements are obtained at adjacent points in time they will have positively correlated errors. This can be determined by plotting the residuals as a function of time. If they are uncorrelated, there will be no pattern. If they are correlated, adjacent residuals will have similar values. 

3. Non-constant Variance of Error Terms

   Error terms should have a constant variance $Var(\epsilon_i) = \sigma^2$. Often the variances of the error terms are non-constant. A funnel shape in the residual plot indicates non-constant variances in the errors (Heteroscedasticity). Here the variances increases with the value of the response. One solution could be to transform the response variable using a concave function ( $log(Y)$ or $\sqrt{Y}$ ) which will reduce the Heteroscedasticity. 

4. Outliers

   Points where the predicted response value is far from the actual value. Even if an outlier has little impact on the slope and intercepts of the regression, it can have a big impact on the $RSE$, $R^2$ and p values. Rather than plotting the residuals, plot the studentized residuals, dividing each residual $\epsilon_i$ by its estimated standard error. Studentized residuals of greater than 3 may indicate an outlier.

5. High Leverage Points

   Unusual for the predictor values, rather than the response value. They do not go along with the general trend in the majority of cases. Removing the high leverage point has a larger impact than removing the outlier. In simple linear regression, simply check if the predictor is outside the normal range. Harder to identify high leverage points in multiple linear regression because each of the observations predictors could be in normal range of its own predictor value, but unusual in terms of the full set of predictors. 

   A leverage statistic quantifies an observations leverage for simple linear regression.

$$
h_i = \frac{1}{n} + \frac{(x_i - \bar{x})^2}{\sum^n_{i'=1}(x_i-\bar{x})^2}
$$

​		Large leverage statistics indicates an observation with high leverage. 

6. Collinearity

   Two or more predictors are closely related to each other and measure the same thing. It becomes difficult to separate individual effects of collinear variables on the response. Due to collinearity there are many pairs of coefficients for those values that result in a minimum $RSS$ which causes uncertainty. It causes the standard error for $\hat{\beta_j}$ to grow, which results in a decline in the t statistic and the probability of correctly detecting a non-zero coefficient is reduced. 
   
   Large absolute values in the correlation matrix of predictors indicates a pair of highly correlated variables. This will not detect collinearity between 3 or more variables, multicollinearity. 
   
   Variance inflation factor (VIF) can be used to assess multicollinearity. It is the ratio of the variance of $\hat{\beta}_j$ when fitting the full model divided by the variance of $\hat{\beta_j}$ if it's fit on its own. VIF has a minimum of 1, which represents no collinearity, while 5 or 10 shows a great amount of collinearity. 
   $$
   VIF(\hat{\beta}_j) = \frac{1}{1-R^2_{X_j|X_{-j}}}
   $$
   Where $R^2_{X_j|X_{-j}}$ is the $R^2$ from a regression of $X_j$ onto all of the other predictors, using the other predictors to calculate the response variable $X_j$. If $R^2_{X_j|X_{-j}}$ is close to one, then the collinearity is present, and will have a large $VIF$.
   
   After finding the collinear variables, one can be removed since they provide redundant significance, or combined into one variable, for instance, combining the average of the standardized versions of two variables. 

## 3.5 Comparison of Linear Regression with K-Nearest Neighbors

Linear regression is a parametric approach because it assumes a linear functional form for $f(X)$. Parametric methods are easy to fit and tests of statistical significance can easily be performed. They make strong assumptions about the form of $f(X)$, which may be incorrect and lead to poor fits. 

Non-parametric methods do not assume a parametric form for $f(X)$ and provide a more flexible method for regression. 

KNN identifies the $K$ training observations that are closest to $x_0$ then estimates $f(x_0)$ using the average of those training responses.  
$$
\hat{f}(x_0) = \frac{1}{K}\sum_{x_i\in N_0}y_i
$$
A small value for $K$ provides the most flexible fit, which has a low bias, but high variance. Large $K$ values have low variance, but high bias. 

The parametric approach is chosen over the non-parametric approach if the parametric form that has been selected is close to the true form of $f$.

Linear regression performs worse than KNN when the data is not explicitly linear, however, with higher dimensions, KNN often performs worse than linear regression, due to the curse of dimensionality. This is because with an increase in dimensions, there is a decrease in sample size. The $K$ observations that are nearest when p is large could really be far away, leading to a poor fit. Parametric methods will outperform non-parametric approaches when there is a small number of observations per predictor.

## Other Notes

**Diagnostic Plots for Linear Regression**

1. Residuals vs Fitted

   This is used to indicate a non-linear pattern. If there is a non-linear relationship between the predictor variables and the outcome variable, there will be a pattern in the plot. However, if the spread is even along the horizontal line, the relationship is likely linear.

2. Normal Q-Q

   Shows if the residuals are normally distributed. It is a scatter plot created by plotting two sets of quantiles (percentiles) against each other. If they both come from the same distribution there should exist a 45 degree line. Non-normal residuals indicates that there is not structure that is not being accounted for.

3. Scale-Location / Spread-Location

   Tests if the residuals are spread equally along the ranges of predictors. Used to check the assumption of equal variance (homoscedasticity) of the residuals. A horizontal line with equally spread points implies homoscedasticity, if the residuals spread wider as the fitted values increase, it is a sign of heteroscedasticity.

4. Residuals vs Leverage

   Helps find influential/ high leverage cases. Find points that do not follow the general trend of the regression and influences the regression line greatly. Points in the upper right or lower right corners separate from the rest of the fitted values, or are outside of the cooks distance (dashed line) are influential.

