# Binomial distribution

## Description

The number of **r** successes in **n** Bernoulli trials with probability **p** of success, is Binomially distributed.

### Example

The number **r** of heads in **4 coin flips** with probability **0.5** of heads, is Binomially distributed.

## Code

np.random.binomial(n, p, size=None)

Where

* n = number of trials
* p = probability of success
* size = number of samples

```python
' Example of binomial sample '
np.random.binomial(4, 0.5)

' Example of serie of binomial samples '
np.random.binomial(4, 0.5, size=10)
```

## Binomial PMF

```python
samples = np.random.binomial(60, 0.1, size=10000)
```

![Binomial PMF](../../images/Courses/binomial_pmf.png)


## Cumulative distribution function (CDF)

We can get the same information from CDF than using the PMF, but simpler to plot in python

```python
x, y = ecdf(samples)
plt.plot(x, y, marker=".", linestyle="none")
plt.margins(0.02)
plt.xlabel("number of success")
plt.ylabel("CDF")
```

![Binomial CDF](../../images/Courses/binomial_cdf.png)
