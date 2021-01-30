# Poisson distribution

* The timing of the next event is completly independent of when the previous event happend.
* Poisson distribution looks like Binomial distribution
* Poisson distribution is the limit of Binomial distribution for **low probability of success and a large number of Bernoulli trials** (rare events)


## Description

* The number of r arrivals of a **Poisson process** in **a given time interval** with average rate of **? arrivals** per interval is Poisson distributed.

### Example

* The number of r arrivals of **hits in a website** in **one hour** with average hit rate of **6 hits per hour** is Poisson distributed.

## Poisson PMF

![Poisson PMF](../../images/Courses/poisson_pmf.png)

## Poisson CDF

```python
samples = np.random.poisson(6, size=10000)
x, y = ecdf(samples)
plt.plot(x, y, marker=".", linestyle="none")
plt.margins(0.02)
plt.xlabel("number of success")
plt.ylabel("CDF")
plt.show()
```

![Poisson CDF](../../images/Courses/poisson_cdf.png)


## Code

np.random.poisson(<!-- $\lambda$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/xsJkkEYA41.svg">, size='None')

Where
* <img style="transform: translateY(0.1em); background: white;" src="../../../svg/xsJkkEYA41.svg"> is the Expectation of interval, must be >= 0. A sequence of expectation intervals must be broadcastable over the requested size.
* size: Number of samples

```python
samples = np.random.poisson(6, size=10000)
```
