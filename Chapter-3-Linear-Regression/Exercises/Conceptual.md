## Conceptual

1.

​	Null hypotheses state that predictor variables TV, radio, and newspaper have no effect on the response variable Sales. The p values correspond to the probability of getting values in the t distribution with $n-2$ degrees of freedom that are as extreme or more extreme than the t statistic from these variables. The t distribution describes how the mean of a sample with $n$ observations is expected to behave, so the p value is the probability of seeing a number as extreme or more than the t statistic in a collection of random data where the variable has no effect.

Where the t value is
$$
t = \frac{\hat\beta_1 - 0}{SE(\hat\beta_1)}
$$
TV and radio have a small p-value of 0.0001, which means there are only 0.01% values in the t distribution that are more extreme than this t statistic. This allows us to confidently reject the null hypothesis. However, newspaper has a p value of 0.8599, so there are 85.99% values that are as or more extreme than the t-statistic for newspaper, which allows us to confirm the null hypothesis that newspaper has little affect on the response variable, sales. 

2.

​	KNN, or $K$ nearest neighbors, is a non-parametric method that observes the $K$ nearest data points in the training data to return a response variable. The response or output variable depends on whether it is used for classification or regression. In KNN classification, the quantitative output is a discrete value assigned to the majority of the $K$ nearest points. While in regression, the qualitative output is assigned to the average of the $K$ nearest points in the training data. 

3.
$$
\hat{Y} = 50 + 20(GPA) + 0.07(IQ) + 35(Gender) + 0.01(GPA\times IQ) - 10(GPA\times Gender)
$$
a. 
$$
Males : \hat{Y} = 50 + 20(GPA) + 0.07(IQ) + 0.01(GPA\times IQ)\\
Females : \hat{Y} = 50 + 20(GPA) + 0.07(IQ) + 35 + 0.01(GPA\times IQ) - 10(GPA\times 1)
$$
The interaction variable accounts for situations where increasing one variable increases the effect of another. In this regression, the gender male is the baseline. The interaction variable of GPA and gender shows that the effect of gender on salary decreases with an higher GPA. Males will have a higher salary assuming their GPA is greater than a certain threshold.

b.
$$
\begin{align}
\hat{Y} &= 50 + 20(GPA) + 0.07(IQ) + 35 + 0.01(GPA\times IQ) - 10(GPA\times 1) \\
&= 50 + 20(4) + 0.07(110) + 35 + 0.01(4\times 110) - 10(4\times 1) \\
&= 137.1
\end{align}
$$
The starting salary with those parameters will be $\$137, 100$.

c. Though this may seem like the case, the null hypothesis where the GPA/IQ interaction predictor has no impact on the response cannot be formally accepted without observing it's p value.

4.

a. The polynomial model would have a lower RSS than the linear model. Since there are more parameters, the model will be able to fit the training data better than the linear model, though the difference would be slight.

b. The test RSS would be greater on the polynomial model and lower on the linear model. The polynomial model would overfit the relationships in the training data and model the noise. While the linear model would only observe the true structure of the data.

c. The polynomial model would have a lower RSS since it can capture the true structure of the data, while the linear model cannot. Linear regression can only model the data assuming it has a linear structure. The cubic model can fit the polynomial structure better.

d. The polynomial model will again have a lower RSS because it models the structure better and provides a tighter fit. Since the model is polynomial in nature, it is modelling structure not the noise.
