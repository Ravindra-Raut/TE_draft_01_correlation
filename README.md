# TE_draft_01_correlation

1. Correlation analyses of  the Assemblies and Transposable Elements
Correlation analysis is used to determine whether the values of two variables are associated. There are different methods to perform correlation analysis: Pearson correlation (r) (parametric), Kendall tau, and Spearman rho, which are rank-based correlation coefficients (non-parametric). The most commonly used method is the Pearson correlation method.
Pearson correlation (r), which measures a linear dependence between two variables (x and y). It’s also known as a parametric correlation test because it depends on the distribution of the data. It can be used only when x and y are from the normal distribution. The plot of y = f(x) is named the linear regression curve.
Pearson correlation formula: ![image](https://github.com/user-attachments/assets/fb57bc99-4898-4192-919a-9197d807ab0a)

In the formula, x and y are two vectors of length n, mx and my corresponds to the means of x and y, respectively.

The p-value (significance level) of the correlation can be determined: 
1. by using the correlation coefficient table for the degrees of freedom: df = n−2, where n is the number of observations in x and y variables. 
2. or by calculating the t value as follow: ![image](https://github.com/user-attachments/assets/8f236ee8-a5a5-4527-a1ae-54ddd389c601)

The corresponding p-value is determined using the t distribution table for df = n−2. If the p-value is < 5%, then the correlation between x and y is significant.

The Shapiro-Wilk test is a way to tell if a random sample comes from a normal distribution. The test gives a W value; small values indicate the sample is not normally distributed or we can reject the null hypothesis that the population is normally distributed if the values are under a certain threshold. 
Shapiro-Wilk formula: ![image](https://github.com/user-attachments/assets/8cfcc7a1-9465-45e7-933f-f1c7847b11c2)

Where xi is the ordered random sample values, ai are constants generated from the covariances, variances, and means of the sample (size n) from a normally distributed sample. The test has limitations, most importantly that the test has a bias by sample size. The larger the sample, the more likely to get a statistically significant result.

2. Compute correlation using R package
Correlation coefficient is computed in R software (ver. 4.1.0) using the functions cor() or cor.test() in the ggpubr package [https://github.com/kassambara/ggpubr]. The cor() computes the correlation coefficient. The cor. test() test for association/correlation between paired samples. It returns both the correlation coefficient and the significance level (or p-value) of the correlation. The R function shapiro.test() can be used to perform the Shapiro-Wilk (W) test of normality for one variable (univariate) to check data from each of the two variables (Assembly Size, TE length) follow a normal distribution or not. The normality plot is drawn using the R function: ggpubr::ggqqplot().

Results: 
Correlation analyses of Assemblies and Transposable Elements
A correlation test is used to evaluate the association between genome size of Oryza assemblies and percentage coverage of transposable elements. The correlation coefficient from the Pearson correlation formula is computed in R software (ver. 4.1.0) in the ggpubr package. Generally, the Pearson correlation coefficient (r) is a number between -1 and 1. The observed Pearson correlation coefficient (r) value is 0.6744457. In general, the correlation expresses the degree that, on average, two variables change correspondingly. From the output, it is observed the p-value is 4.37e-05 and is lower than the conventional 5% (P<0.05) the correlation coefficient is statistically significant. It represents that the genome size of Oryza assemblies and percentage coverage of transposable elements change correspondingly (Figure ). 

The statistical tests including correlation, regression, t-test, and analysis of variance (ANOVA) assume some certain characteristics about the data. They require the data to follow a normal distribution or Gaussian distribution. These tests are called parametric tests because their validity depends on the distribution of the data. Shapiro-Wilk’s method is widely recommended for normality tests.

From the output (Figure ), the p-value > 0.05 implies that the distribution of the data is not significantly different from a normal distribution. In other words, we can assume normality. The quantile-quantile plots (Q-Q plot) shows the correlation between a given sample and the normal distribution. From the normality plots, we conclude that both populations may come from normal distributions. It is based on the correlation between the data and the corresponding normal scores for Assembly Size, (W = 0.95327, p-value = 0.2067) and TE length, (W = 0.90029, p-value = 0.008536).




