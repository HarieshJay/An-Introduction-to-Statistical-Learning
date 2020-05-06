## 4.2 Why Not Linear Regression

Given a scenario to classify a medical condition, create dummy variables for stroke(1) , drug overdose(2) and epileptic seizure(3). Least squares could be used to fit a model with this set of predictors. However, this coding of the dummy variables implies an ordering on the outcomes, and states that the difference between stroke and drug overdose is the same as drug overdose and epileptic seizure.

Different coding's would lead to different linear models and different predictions.

With an exception to variables with natural orderings, such as mild, moderate and severe, then a 1, 2, 3 coding would be appropriate.

Dummy variables would work with binary instances, where variables that have 2 levels, for example if there are only two possible conditions: stroke or drug overdose. A $0/1$ coding would work for this scenario and linear regression would have the same results as a linear discriminant analysis approach.

Cases where there isn't a natural order or the variable is not binary, linear regression will return incorrect results.

## 4.3 Logistic Regression

Models the probability that $Y$ belongs to a category, instead of modeling the response $Y$ directly.
$$
Pr(\text{default = Yes}|\text{balance})
$$
The probability of default given balance, where the probability will range between $0$ and $1$. For example, predict that default = yes, when $Pr(\text{default = Yes}|\text{balance}) > 0.5$.

Linear regression cannot be used to predict probability because the response value can be negative or above 1, which isn't sensible for prediction of range $0$ to $1$. Logistic regression always returns outputs between $0$ and $1$ for all values of $X$.
$$
p(X) = \frac{e^{\beta_0 + \beta_1X}}{1+e^{\beta_0 + \beta_1X}}
$$
To fit this model, find $\beta_0$ and $\beta_1$, use the maximum likelihood method.
$$
\frac{p(X)}{1-p(X)} = e^{\beta_0+\beta_1X}
$$
$\frac{p(X)}{1-p(X)}$ is called the odds and is the probability that an event will occur versus the probability that the event will not occur, which takes values in $(0,\inf)$. Values near $0$ and $\inf$ represent low and high probabilities. After applying log to both sides, $log(\frac{p(X)}{1-p(X)}) = \beta_0+\beta_1X$, the left side represents the log-odds or logit. In a logistic regression model, a one-unit increase in $X$, changes the log odds by $\beta_1$, or multiplies the odds by $e^{\beta_1}$.

The relationship between $p(X)$ and $X$ is not linear, so $\beta_1$ does not correspond to a change in $p(X)$ associated with a one-unit increase in $X$. The amount $p(X)$ changes in response to $X$ is dependent on the current value of $X$. $\beta$ will explain if the relationship is positive or negative.

**Estimating the Regression Coefficients**

$\beta$ values are estimated with the maximum likelihood approach.

*Maximum Likelihood:* Find estimates for $\hat{\beta_0}$ and $\hat{\beta_1}$ such that the predicted probability $\hat{p}(x_i)$ corresponds as closely to the observed status. Find $\hat{\beta_0}$ and $\hat{\beta_1}$ such that the model for $p(X)$ results in numbers close to 1 for individuals in the group, and close to zero for individuals not in the group.

The likelihood function is given by:
$$
l(\beta_0, \beta_1) = \prod_{i':y_i=1}p(x)i\prod_{i':y_i=0}p(x_{i'})
$$
Least squares approach is a special case of the likelihood function. To adjust for qualitative predictors, use $1$ for yes instances and $0$ for no instances as before.

To extend this to multiple regression
$$
log(\frac{p(X)}{1-p(X)}) = \beta_0 + \beta_1X_1 + ... + \beta_pX_p
$$
The then the probability estimate can be written as
$$
p(X) = \frac{e^{\beta_0+\beta_1X_1+...+\beta_pX_p}}{1+e^{\beta_0+\beta_1X_1+...+\beta_pX_p} }
$$
The affect of a variable in linear regression could be different from the affect it has in a multiple regression. This shows the dangers of missing factors.

**Logistic Regression for > 2 Response Classes**

Can be done with separate logistics regressions as
$$
Pr(Y=\text{stroke}|X)\\
Pr(Y=\text{drug overdose}|X)\\
Pr(Y=\text{epileptic seizure|X}) = 1 - Pr(Y=\text{stroke}|X) - Pr(Y=\text{drug overdose}|X)
$$
Logistic regression does not tend to be used on cases with $> 2$ response variables, though it is possible with R, this is usually handled with Discriminant Analysis.

## 4.4 Linear Discriminant Analysis

The parameter estimates for logistic regression when the classes are well-separated are unstable, but not with linear discriminant analysis. If $n$ is small and the distribution of the predictors $X$ is approximately normal in each of the classes, the linear discriminant model is more stable. Linear discriminant analysis is more popular for more than 2 response classes.

**Using Bayes' Theorem for Classification**

Let $K$ represent the number of classes, where $K\ge2$. $\pi_k$ is the prior probability that a randomly chosen observation comes from the $k$th class, it is the probability that a given observation is associated with the $k$th category of the response variable. 

$f_k(x) \equiv Pr(X=x|Y=k)$ is the density function of $X$ for an observation that comes from the $k$th class. $f_k(x)$ is large if there is a high probability that an observation in the $k$th class has $X \approx x$ and $f_k(x)$ is small if it is unlikely that an observation in the $k$th class has $X \approx x$.
$$
Pr(Y=k|X=x)= \frac{\pi_kf_k(x)}{\sum^K_{l=1}\pi_lf_l(x)}
$$
Rather than computing the probability, like in logistic regression, plug in estimates of $\pi_k$ and $f_k(X)$.

Estimating $\pi_k$ can be done by computing the fraction of the training observations that belong to the $k$th class. $p_k(X)$ or $Pr(Y=k|X=x)$ is the posterior probability than an observation $X=x$ belongs to the $k$th class, the probability that the observation belongs to the $k$th class, given the predictor value for that observation.

Bayes classifier where a class is chosen based on the highest $p_k(X)$ has the lowest error terms of all classifiers. 

**Linear Discriminant Analysis for p = 1**

Estimate $f_k(x)$ so that $X$ can be classified to the class with the highest $p_k(X)$.

Scenarios with 1 predictor:

Assume $f_k(x)$ is normal/Gaussian. Then $f_k(x)$ will take the form
$$
f_k(x) = \frac{1}{\sqrt{2\pi}\sigma_k}exp(-\frac{1}{2\sigma_k^2}(x-\mu_k)^2)
$$
where $\mu_k$ is the mean, $\pi$ is the constant, not the prior probability, and $\sigma^2_k$ is the variance parameters for the $k$th class. 

Assume the variance is constant along all $K$ classes.

Plugging the function for $f_k(x)$ in the function for $Pr(X=x|Y=k)$
$$
p_k(x) = \frac{\pi_k\frac{1}{\sqrt{2\pi\sigma}}exp(-\frac{1}{2\sigma^2}(x-\mu_k^2))}{\sum^K_{l=1}\pi_l\frac{1}{\sqrt{2\pi\sigma}}exp(-\frac{1}{2\sigma^2}(x-\mu_l)^2)}
$$
Take the log and rearrange the terms
$$
\delta_k(x) = x \cdot \frac{\mu_k}{\sigma^2} - \frac{\mu^2_k}{2\sigma^2} + log(\pi_k)
$$
Assign an observation $X=x$ to the class with the highest $p_k(x)$/$\delta_k(x)$. $\delta_k(x)$ is a linear function function of $x$.

In practice, we cannot be sure that the probability density function is gaussian, even if it is, we have to estimate the $\sigma^2$, $\mu_k$, and $\pi_k$.

Linear discriminant analysis method approximates the Bayes classifier by plugging estimates for $\sigma^2$, $\mu_k$, and $\pi_k$. They are estimated with
$$
\hat{\mu}_k = \frac{1}{n_k}\sum_{i:y_i=k}x_i \\
\hat{\sigma}^2 = \frac{1}{n-K}\sum^K_{k=1}\sum_{i:y_i=k}(x_i-\hat{\mu_k})^2
$$
Where $n$ is the total number of training observations, $n_k$ are the training observations in class $k$. $\mu_k$ is estimated by taking the average of the observations in that class. $\sigma^2$ is the weighted average of the sample variances for each of the $K$ classes.
$$
\hat{\pi}_k = n_k/n
$$
Class membership probabilities are estimated by taking the proportion of the training observations to each of the $k$ classes.

**Linear Discriminant Analysis for p > 1**

Assume $X = (X_1, X_2, ... , X_p)$ is from a multi-variate Gaussian distribution. Multivariate Gaussian distribution assumes each individual predictor follows a one-dimensional normal distribution. 

$X \sim N(\mu, \sum)$  indicates that a $p$-dimensional random variable $X$ has a multi-variate Gaussian distribution, with $E(X) = \mu$ representing the mean of $X$ (a vector with p components), and $Cov(X) = \sum$ is the $p \times p$ covariance matrix of $X$.

Multivariate Gaussian density is defined as
$$
f(x) = \frac{1}{(2\pi)^{p/2}|\sum|^{1/2}}exp(-\frac{1}{2}(x-\mu)^T(\sum)^{-1}(x-\mu))
$$
LDA classifier assumes the observations in the $k$th class from a multivariate Gaussian distribution $N(\mu_k, \sum)$, where $\mu_k$ is a class-specific mean vector, and $\sum$ is the covariance matrix that is common to all $K$ classes.

Bayes classifier assigns an observation $X=x$ to the class with the highest
$$
\delta_k(x) = x^T(\sum)^{-1}\mu_k-\frac{1}{2}\mu^T_k(\sum)^{-1}\mu_k+log(\pi_k)
$$
Confusion matrices, which map the real observations to the predicted values, are a way to analyze error rates in specific cases. They show class-specific performance and can measure sensitivity, positive cases that are correctly identified, and specificity, negative cases that are correctly identified. LDA approximates Bayes Classifier, which has the lowest total error rate, regardless of the class the errors come from. 

The threshold between classes for Bayes Classifier and LDA is 0.5 or 50% $Pr(\text{default=Yes}|X=x)>0.5)$. If there is a concern of incorrectly assigning observations to the yes class, the threshold can modified to $Pr(\text{default=Yes}|X=x)>0.2)$. 

The ROC curve, or receiver operating characteristic, displays the types of errors for all thresholds. The area under the ROC curve is the overall performance of a classifier.

**Quadratic Discriminant Analysis**

Like LDA, QDA assumes observations are from a Gaussian Distribution and plugs estimates for the parameters into Bayes Theorem to perform predictions. 

QDA assumes each class has its own covariance matrix, unlike LDA which assumes a covariance matrix $\sum$ which is common to all classes. QDA assumes each observation from the $k$th class has the form $X \sim N(\mu_k, \sum_k)$, where $\sum_k$. 
$$
\delta_k(x) = -\frac{1}{2}x^T (\sum)^{-1}_kx+x^T(\sum)^{-1}_k\mu_k - \frac{1}{2}\mu^T_k (\sum)_k^{-1}\mu_k - \frac{1}{2}log|(\sum)_k| + log(\pi_k)
$$
$x$ is a quadratic function here. The values needed to be estimated here are ${\sum}_k, \mu_k, \pi_k$

Choosing between LDA and QDA is a matter of the bias-variance tradeoff. LDA is less flexible than QDA, since it estimates $p(p+1)/2$ parameters for its covariance matrix, while QDA estimates $Kp(p+1)/2$ parameters since there are class specific covariance matrices.

If the assumption that the classes share the same covariance matrix is wrong, this will lead to high bias. LDA is better when $n$ is low, so that variance is reduced. QDA is preferred when $n$ is large, or a common covariance matrix is not suitable. LDA is appropriate when the Bayes decision boundary is linear, and QDA is appropriate when it is more quadratic.

**A Comparison of Classification Methods**

Both logistic regression and LDA produce linear decision boundaries since they are linear in terms of $X$. However, their coefficients are predicted differently, maximum likelihood for logistic regression and by estimating the mean and variance for LDA. 

LDA assumes a Gaussian Distribution with a common covariance matrix for each class. If the Gaussian assumption is correct, it is stronger than logistic regression, but if the Gaussian assumption is wrong, then logistic regression provides a better fit.

KNN does not have a linear decision boundary, so is a better model when the decision boundary is highly non-linear, but does not show the significance of the coefficients which makes it hard to infer relationships.

QDA is the middle ground between the non-parametric KNN and the linear methods. It can fit a wider range of decision boundaries, but not as flexible as KNN. QDA performs better than KNN when $n$ is smaller, because it does make assumptions about the decision boundary. KNN could still give poor results in a highly unilinear model if the level of smoothness, or the $k$ value, is not chosen correctly.