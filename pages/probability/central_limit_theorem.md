# Central Limit Theorem (CLT)

## Definition

When the number of draws is large, the sum of the independent draws is approximately normal.

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
