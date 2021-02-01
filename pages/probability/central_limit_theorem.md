# Central Limit Theorem (CLT)

## Definition

When the number of draws is large, the sum of the independent draws is approximately normal.

Another description says that the means drawn from multiple samples will resemble the familiar bell-shaped normal curve, **even if the source population is not normally distributed**, provided that the sample size is large enough and the departure of the data from normality is not too great. The central limit theorem allows normal-approximation formulas like the t-distribution to be used in calculating sampling distributions for inference—that is, confidence intervals and hypothesis tests.

The central limit theorem receives a lot of attention in traditional statistics texts because *it underlies the machinery of hypothesis tests and confidence intervals*, which themselves consume half the space in such texts. Data scientists should be aware of this role; however, *since formal hypothesis tests and confidence intervals play a small role in data science, and the  bootstrap is available in any case, the central limit theorem is not so central in the practice of data science.*

We can see how this tendency works on the [sampling distribution](sampling_distribution.md), the more data we use for getting the mean, the more bell-shaped the chart is.

### Expected Value

<img style="transform: translateY(0.1em); background: white;" src="../../svg/GXHmVVTxHF.svg">

Where:

* E : Expected value
* X : Random variable
* mu: the mean

Taking an example of a rulette where there are 18 Red , 18 Black and 2 Green

<img style="transform: translateY(0.1em); background: white;" src="../../svg/VDxl4VCef8.svg"> 

Which is around 0.052

Validating the result with Monte Carlo Simulation

```r
B <- 10^6
X <- sample(c(-1,1), B, replace=TRUE, prob=c(9/19,10/19))
mean(X)
# 0.051
```

The average can also be described as:

<img style="transform: translateY(0.1em); background: white;" src="../../svg/cILMs7JKrE.svg">

reducing it:

<img style="transform: translateY(0.1em); background: white;" src="../../svg/Tl6DatYvab.svg">

Also note:

The expected value of the sum of draws is: (number of draws * average of the numbers in the urn)

So if 1000 people play roulette, casino wins $50 on average.

But we need to know what is the range of possibilty of lossing money, so we need to take a look at the **standard error**. This gives us the idea of the size of the variation around the **expected value**

**$SE[X]$**

If we have **independent** draws

squart_root (number of draws) * standard deviation of the number in the urn

The standard error is described as

<img style="transform: translateY(0.1em); background: white;" src="../../svg/L6IZsVvmK7.svg">


Following the example

<img style="transform: translateY(0.1em); background: white;" src="../../svg/Yo8Ekp29BA.svg">

Which is:

```r
2 * sqrt(90)/19
# 0.99
```

So

```r
n <- 1000
sqrt(n) * 2 * sqrt(90)/19
# 31.57
```

So the Casino expects to win $52 dollars with a standard error of $31.57

> How likely is the casino to lose money?

Using the **CTL**.

```r
mu <- n * (20-18)/38
se <- sqrt(n) * 2 * sqrt(90)/19
pnorm(0, mu, se)
#0.0477
```
