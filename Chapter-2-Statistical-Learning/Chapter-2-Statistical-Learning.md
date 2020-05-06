## 2.1 What is Statistical Learning

$$Y = f(X) + \epsilon$$

$\epsilon$ represents the unreducible errors since it contains parameters about $Y$ that cannot be measured


$$
\begin{align}
E(Y-\hat{Y})^2 &= E[f(X)+\epsilon-\hat{f}(X)]^2 \\
&= [f(X) - \hat{f}(X)]^2 + Var(\epsilon)
\end{align}
$$
$[f(X) - \hat{f}(X)]^2$ is reducible, while $Var(\epsilon)$ is not. $\epsilon$ will always provide an upper bound in practice.

**Inference: **Understanding how the parameters affect $Y$ and finding $f$

### Parametric Methods

Two-step model-based approach

1. Make an assumption about the functional form of $f$, ex. that $f$ is linear
2. Fit or train the model based on the training data, ex. using Ordinary Least Squares to estimate $\beta$ 

Reduces the problem of estimating a set of parameters. Choosing more flexible models requires estimating more parameters and can lead to overfitting.

### Non-Parametric Methods

* Do not make explicit assumptions about the form of $f$

* Able to fit a larger range of possible shapes for $f$

* A very large number of observations are needed


### Prediction Accuracy vs Model Interpretability

Restrictive models are easier to understand. In linear models (restrictive), it's easy to understand the relationship between the parameters and the output, but it would be harder in a flexible model like in generalized additive models. 

When inference is the goal, there are advantages to using a restrictive model. Even when focusing on prediction, more restrictive models can be favored because flexible models have a higher chance of overfitting.

### Supervised vs Unsupervised

Supervised learning has a response variable $y_i$ to check the accuracy of the model, but unsupervised does not. Unsupervised analysis includes clustering, which performing analysis by grouping together observations. 

### Regression vs Classification

Regression deals with estimating quantitative variables, such as the value of a house. Classification deals with qualitative or categorical variables, like gender.

## Assessing Model Accuracy

### Measuring the Quality of Fit

$$
MSE = \frac{1}{n}\sum^n_{i=1}(y_i - \hat{f}(x_i))^2
$$

The model needs to be flexible enough to model the structure of $f$, but not to overfit and model the noise of the data set. A low training $MSE$ and a high test $MSE$​ indicates overfitting.

### Bias-Variance Trade-Off

$$
E(y_0-\hat{f(x_0)})^2 = Var(\hat{f(x_0)}) + [Bias(\hat{f(x_0)})]^2 + var(\epsilon)
$$

The expected test $MSE$ can be broken down to the variance of $\hat{f}(x_0)$, the squared bias of $\hat{f(x_0)}$ and the variance of $\epsilon$. 

*Variance* refers to the amount $\hat{f}(x)$ would change if we estimated it using a different training data set. More flexible models have a higher variance.

*Bias* refers to the error from approximating other data sets.

As the flexibility of the model increases, the bias decreases faster than the variance increases, causing the $MSE$​ to decline. However, at some point, increasing flexibility significantly increases the variance, causing the $MSE$ to increase.

### The Bayes Classifier

$$
Pr(Y=j|X=x_0)
$$

Represents the conditional probability: the probability of $Y = j$ given the observed predictor $x_0$. Assign to the class where $j$ is maximized. 

If there are 2 classes, an instance is assigned to class $1$ if $Pr(Y=1|X=x_0) > 0.5$.

It will produce the lowest possible test error rate (equivalent to the irreducible error $\epsilon$) since it will maximize the conditional probability. Bayes error rate is given by, 
$$
1 - E(max_jPr(Y=j|X))
$$
Impossible for real data because we do not know the conditional distribution.

### K-Nearest Neighbors

$$
Pr(Y=j|X=x_0) = \frac{1}{k}\sum_{i\in N_0}I(y_i=j)
$$

Identifies $K$ points in the training data that are closest to $x_0$ and estimates the conditional probability for class $j$ as a fraction of points in $N_0$ whose response values equal $j$. Then applies Bayes rule and classifies the test observation based on the largest probability.

Produces very accurate results that are close to Bayes Classifier. 

A low value of $K$ responds to low bias and high variance. High $K$ responds to low variance and high bias.
