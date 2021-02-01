# Expected Value

When the categories can be associated with a numeric value, this gives an average value based on a category's probability of occurence.

A special type of categorical data is data in which the categories represent or canmapped to discrete values on the same scale.

## Formula

1. Multiply each outcome by its probability of occurrence.
2. Sum these values.


<!-- $EV = (v1 * p1) + (v2 * p2) + ... + (vn * pn)$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/Ijp4FL2vf7.svg">

## Standard Error

 It's a single metric that sums up the variability in the sampling distribution for a statistic. The standard error can be estimated using a statistic based on the standard deviation  s  of the sample values, and the sample size  n:

<!-- $StandardError = SE = \frac{s}{\sqrt{n}}$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/Wo4sA5Bx7u.svg">

> As the sample size increases, the standard error decreases

The relationship between standard error and sample size is sometimes referred to as the **square root of n rule**: to reduce the standard error by a factor of 2, the sample size must be increased by a factor of 4.

> Do not confuse standard deviation (which measures the variability of individual data points) with standard error (which measures the variability of a sample metric).

## Properties

### Property 1

The expected value of the sum of random variables is the sum of the expected values of the individuals random variables.

<!-- $E[X_1 + X_2 + ... + X_n] = E[X_1] + E[X_2] + ... + E[X_n]$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/ayQlePd2qh.svg">

And then the result is n times mu

<!-- $E[X_1 + X_2 + ... + X_n] = n\mu$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/B27dTDNzbd.svg">

### Property 2

The expected value of a random variable times a non-random constant is the expected value times that non-random constant.

<!-- $E[aX] = a * E[X]$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/djcBmPB6Rp.svg">

So the expected value is mu

<!-- $E[(X_1 + X_2 + ... + X_n)/n] = E[X_1 + X_2 + ... +X_n]/n = n\mu /n = \mu $ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/yEwy1KVoAg.svg">

### Property 3

The square of the standard error of the sum of **independent** random variables is the sum of the square of the standard error of *each* random variable.

 <!-- $SE[X_1 + X_2 + ... + X_n] = \sqrt{SE[X_1]^2 + SE[X_2]^2 + ... + SE[X_n]^2 } $ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/S8fOXL5akR.svg"> 

Note that *variance* is

<!-- $Variance[X_1] = SE[X_1]^2$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/LbHNd5Eccx.svg">

### Property 4

The standard error of a random variable times a non-random constan is the standard error times the non-random constant.

<!-- $SE[aX] = a * SE[X]$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/kvZv7d6tXL.svg">

#### Concecuence of properties 3 & 4

The standard error of the average of independent draws form the same urn is the standard deviation of the urn <!-- $\sigma$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/FkxPkd2mK0.svg">, divided by the square root of n.

<!-- $SE[(X_1 + X_2 + ... + X_n)/n] = SE[X_1 + X_2 + ... X_n]/n$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/LFnCoj6eke.svg">
<br>
<!-- $= \sqrt{SE[X_1]^2+SE[X_2]^2+...+SE[X_n]^2}$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/MGktSWyuwl.svg">
<br>
<!-- $= \sqrt{\sigma^2 + \sigma^2 + ... + \sigma^2}/n$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/hvXgq3QnB4.svg">
<br>
<!-- $\sqrt{n\sigma^2} / n$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/KGKFXjUngV.svg">

<!-- $=\frac{\sigma}{\sqrt{n}}\$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/Cy1btuCGjv.svg">

### Property 5

If *X* is a normal distributed random variable, then if *a* and *b* are non-random constants, *aX + b* is also a normally distributed random variable.
