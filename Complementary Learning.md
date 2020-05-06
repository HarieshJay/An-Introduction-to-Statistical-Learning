## Complementary Learning

**Standard Deviation**

* measure of how spread out numbers are

$$
\sigma = \sqrt{{\frac{1}{N}}\sum^N_{i=1}(x_i - \mu)^2}
$$

* $\mu$ is the mean or average of the numbers
* subtract the mean from each number and square the result
* find the mean of those squared differences
* take the square root

**Z-Score / Z-Test**

* finds how far from the mean a data point is using population standard deviation
  $$
  Z = \frac{x-\mu}{\sigma}
  $$

  * where $x$ is the tested data point
  * $\sigma$ is the population standard deviation
  * $\mu$ is the population mean
  * $Z$ is the number of standard deviations the point is from the mean

* for example, a z-score of 1.6 means that the result is 1.6 standard deviations away from the mean

* use a z-score to calculate critical value. For an alpha level of 5% or more extreme, the z-score must be greater than 1.645 because the area on the left side of a standard distribution is 95% of the distribution.

* p-values and critical values of z can be used interchangeably 

**T-Statistic**

* Use the t-score when you don't know the population standard deviation or have a small sample size
  $$
  T = \frac{\bar{x}-\mu_0}{\sigma} =\frac{\bar{x}-\mu_0}{s/\sqrt{n}}
  $$

  * Where $\bar{x}$ is the sample mean
  * $\mu$ is the population mean
  * $n$ is the sample size
  * $s$ is the sample standard deviation

* can be used to find the difference between 2 means

* similar to the z-score
  * find a cut off point
  * find the t-Score and compare
  
* Has thicker tail because the standard deviation of the population is being tested
  $$
  t = \frac{\hat\beta_1 - 0}{SE(\hat\beta_1)}
  $$

In null hypothesis testing for coefficients, the standard error is a estimate of the standard deviation. This t-statistic is compared with values in the student's t-distribution to determine the p-value. Student's t-distribution describes how the mean of a sample with a $n$ number of observations is expected to behave. The p-value is the probability of seeing a number as extreme or more than the t-statistic in a collection of random data where the variable has no effect.

**P-Value**

* probability that a point is as extreme or more assuming the null hypothesis
* With a p-value of 0.05 or 5% there is only a 5% chance that this coefficient would have occurred in a random distribution
  * depending on the cutoff, might lead to rejecting the null hypothesis 

**F-Statistic**
$$
\begin{align}
F &= \frac{\text{explained variation}/(p-1)}{\text{unexaplained variation}/(n-p)}\\
F &= \frac{R^2/(p-1)}{(1-R^2)/(n-p)}
\end{align}
$$
$R^2$ measures the relationship between the predictors and response, not whether the relationship is statistically significant. The f-statistic judges whether the relationship between the predictors and the response is statistically significant.

**Confidence Intervals**
$$
\bar{x} \pm z\sigma_{\bar{X}}
$$

* $\bar{x}$ is the sample mean
* $z$ is the z-score or the number of standard deviations based on the confidence level
* $\sigma_{\bar{X}}$ is the standard error of the mean

$$
\hat{\beta_1} \pm 2 \cdot SE(\hat{\beta_1})
$$

represents the confidence interval of $\hat{\beta}$ to 95%.
