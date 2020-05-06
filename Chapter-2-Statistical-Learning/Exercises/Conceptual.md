## Conceptual

1. 

   a.   Better. Since there is a larger sample size, a more flexible approach fits the data better, then with an inflexible approach.

   b.   Worse. If the sample size is small and the number of predictors is large, an inflexible model will be better suited since we do not have the data to confidently approximate the true relationships, which would cause overfitting with high variance and low bias. 

   c.    Better. If the relationship is highly non-linear, a flexible model is needed because an inflexible model will not be able to accurately represent the true relationship and will lead to underfitting where it has high bias and low variance.

   d.    Worse. Flexible models will fit the noise of the training set, so if the $Var(\epsilon)$ is high, the variance will increase.

2. 

   a. Regression and Inference problem. Factors of the company are used to understand what effects the salary of a CEO, where the $\hat{y}$ being produced is the salary (quantitative). The sample data has an $n$ of 500, and $p$ of 3.

   b. Predicative classification problem. The goal is to create a model that will predict whether the new product will be a success or failure. Here $n=20$ and $p=13$.

   c. Predictive regression problem. Model is used to predict the change in the exchange rate, using other stock markets. Here $n=52$ because it is recorded once a week for a year, and a $p=4$ for the different markets.

3. 

   Bias starts at some high value for an inflexible model because it cannot accurately model the structure of the training data (underfitting). As the model becomes more flexible, the bias decreases because it models the data set better.

   Variance is low for inflexible methods because it cannot truly model the flexibility in the training set, again due to underfitting. As flexibility increases, so does variance, until at some point it becomes too flexible and overfits the training set.

   Training error starts high when the model is too inflexible to accurately understand the structure of the data, and then decreases once it becomes flexible. It will continue to decrease until it approximates $\epsilon$. Models the trade-off of variance and bias.

   Bayes error rate $\epsilon$ will be constant and independent of any other factors, including the flexibility of the model.

   The test error will start high when there is underfitting, then decrease when the model understands the structure. However, it will reach a minimum and then begin to rise again when the model starts to overfit the training set.

4. 

   a. (Prediction) Diagnosing patients into various diseases based on test results.(Inference) Understanding what factors cause people to prefer one type of product over another for market research.(Prediction) Classifying which bird is in a region based on their calls.

   b. (Prediction) Estimating the cost of a house using the area and other properties of the house. (Inference) Finding trends in the lives and diets of children that correlate to having high cholesterol in older age. (Prediction) Stock market price based on recent trends.

   c. Grouping together products such as movies, and songs so that they can be recommended to a customer. Clustering customers into groups based on income and other features, so advertisements can be catered to individual groups. Cluster cancer types together when they have the same symptoms so they can be classified easier.

5. 

   Having a very flexible approach leads to risks of overfitting the training data, which will minimize the training error, but will have a large test error because the noise in the training set was modeled as part of the structure. Similarly, underfitting occurs when the approach is too inflexible where it cannot model the structure well enough. A more flexible model is needed when the data is non-linear and cannot be approximated by a linear method. If the data does have linear relationships, then a less flexible approach is necessary. Restrictive models are easier to understand, which may be favorable when the goal is to understand the relationships between the parameters and the result for inference. 

6. 

   Parametric models make assumptions about the general form of $f$, for example, linear regression assumes a linear relationship between $X$ and $Y$. This reduces the problem of estimating a set of parameters. Non-parametric methods do not make explicit assumptions about the form of $f$. So they can fit a larger range of possible shapes for $f$. However, a very large number of observations are needed and are computationally heavy.

   

7. 

   a.

   | Observation | Euclidean Distance to $[0,0,0]$             |
   | ----------- | ------------------------------------------- |
   | 1           | $\sqrt{((0-0)^2+(3-0)^2+(0-0)^2} = 3$       |
   | 2           | $\sqrt{((2-0)^2+(0-0)^2+(0-0)^2} = 2$       |
   | 3           | $\sqrt{((0-0)^2+(1-0)^2+(3-0)^2} = \sqrt10$ |
   | 4           | $\sqrt{((0-0)^2+(1-0)^2+(2-0)^2} = \sqrt5$  |
   | 5           | $\sqrt{((-1-0)^2+(0-0)^2+(1-0)^2} = \sqrt2$ |
   | 6           | $\sqrt{((1-0)^2+(1-0)^2+(1-0)^2} = \sqrt3$  |

   b. Green, since that is the average of the 1 nearest neighbors.

   c. Red, since that is the average of the 3 nearest neighbors.

   d. Bayes decision boundary is considered a perfect model, so to approximate this $K$ would have to be small. Large values for $K$ would create larger, more linear groups because a larger average is taken.