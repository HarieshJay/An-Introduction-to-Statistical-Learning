## Conceptual

1.
$$
\begin{align}
\frac{p(X)}{1-p(X)} &= e^{\beta_0 + \beta_1X} \\\\
\frac{  \frac{e^{\beta_0 + \beta_1X}}{1 + e^{\beta_0 + \beta_1X}}  } {1 - \frac{e^{\beta_0 + \beta_1X}}{1 + e^{\beta_0 + \beta_1X}} } &= e^{\beta_0 + \beta_1X} \\ \\
\frac{  \frac{e^{\beta_0 + \beta_1X}}{1 + e^{\beta_0 + \beta_1X}}  } {\frac{1}{1 + e^{\beta_0 + \beta_1X}} } &= e^{\beta_0 + \beta_1X} \\ \\
e^{\beta_0 + \beta_1X} &= e^{\beta_0 + \beta_1X}
\end{align}
$$
4.

a. $10\%$, ignoring cases on the edge of the interval.

b. $1\%$

c. $(10^{-p})\times 100 = 10^{-98}\%$

d. Since there are less observations near $X$, the nearest observations may still have $p$-values that are completely different to the test observation.



5.

a. Quadratic Discriminant Analysis will have better results in the training data because it is more flexible and fit the noise that a linear model cannot. However, Linear Discriminant Analysis will perform better with the test data since QDA will overfit the training set.

b. With a linear Bayes decision boundary, Quadratic Discriminant Analysis will perform better on the training and test sets, LDA will not model the structure well.

c. The prediction accuracy of QDA should improve since it will have more data to model, so it will not overfit the data and will understand the structure of the data better, even if it is more linear. The variance can be offset by the larger sample size.

d. False. If $n$ is too low, QDA will overfit the data and model the noise leading to a higher test rate.



6.

a. 
$$
\begin{align}
p(X) &= \frac{e^{\beta_0 + \beta_1X_1 + \beta_2X_2}}{1+e^{\beta_0 + \beta_1X_1 + \beta_2X_2}} \\
&= \frac{e^{(-6)+(0.05)*40+(1)*3.5}}{1 + e^{(-6)+(0.05)*40+(1)*3.5}} \\
&= 0.37754066879
\end{align}
$$
There is a probability of 38% that a student that studied 40 hours and has to 3.5 GPA to get an A in the class.

b.
$$
\begin{align}
log(\frac{p(X)}{1-p(X)}) &= \beta_0 + \beta_1X_1 + \beta_2X_2 \\
 X_1 &= \frac{log(\frac{p(X)}{1-p(X)}) - \beta_0 - \beta_2X_2}{\beta_1} \\
 X_1 &= \frac{log(\frac{0.5}{1-0.5}) - (-6) - 1*(3.5)}{0.05} \\
 X_1 &= 50
\end{align}
$$
50 hours of studying is required to have a 50% chance of getting an A in the course.



7.
$$
\begin{align}
Pr(Y=k|X=x) &= \frac{\pi_kf_k(x)}{\sum^K_{l=1}\pi_lf_l(x)} \\
&= \frac{\pi_k \frac{1}{\sqrt{2\pi\sigma_k^2}}e^{-(x-\mu_k)/2\sigma_k^2} }{\sum^K_{l=1}\pi_lf_l(x)} \\
&= \frac{\pi_k \frac{1}{\sqrt{2\pi\sigma_k^2}}e^{-(x-\mu_k)/2\sigma_k^2} }{\pi_k \frac{1}{\sqrt{2\pi\sigma_k^2}}e^{-(x-\mu_k)/2\sigma_k^2} + \pi_u \frac{1}{\sqrt{2\pi\sigma_u^2}}e^{-(x-\mu_u)/2\sigma_u^2} } \\
&= \frac{0.8 e^{-(4-10)/2(36)} }{0.8 e^{-(4-10)/2(36)} + 0.2 e^{-(4-0)/2(36)} }\\\\
&= 75.2\%
\end{align}
$$
8.

If $k=1$ for the K nearest neighbor method, it will always choose the correct answer for the training data, since that is the data is using. So an averaged error rate of $18\%$ is actually a $0\%$ error rate on the training data and a $36\%$ error rate on the test data. This would mean that the logistic regression approach has better results.

9.

a.
$$
\begin{align}
odds &= \frac{p(X)}{1-p(X)}\\
0.37&= \frac{p(X)}{1-p(X)}\\
p(X) &= 0.27
\end{align}
$$
27% of people will default.

b.
$$
\begin{align}
odds &= \frac{p(X)}{1-p(X)}\\
odds&= \frac{0.16}{1-0.16}\\
p(X) &= 0.19
\end{align}
$$
There is an odds of 0.19 that people will default.