# Exponential Distributions

* The waiting time between arrivals of a Poisson distribution process is exponentially distributed.
* Timing of one is independent of all others

> A key assumption in any simulation study for either the Poisson or exponential distribution is that the rate, lambda , remains constant over the period being considered. This is rarely reasonable in a global sense; for example, traffic on roads or data networks varies by time of day and day of week. However, the time periods, or areas of space, can usually be divided into segments that are sufficiently homogeneous so that analysis or simulation within those periods is valid.

![Exponential distribution](../../images/Courses/exponential_distribution.png)

```python
mean = np.mean(data)
sample = np.random.exponential(mean, size=10000)
x_theor, y_theor = ecdf(sample)
x, y = ecdf(data)
plt.plot(x_theor, y_theor)
plt.plot(x, y, marker=".", linestyle="none")
plt.xlabel("time (days)")
plt.ylabel("CDF")
plt.show()
```

![Exponential CDF vs data](../../images/Courses/exponential_distribution_cdf.png)

We can observe the distribution is close to exponential distribution

## Code Example

This code would generate 100 random numbers from an exponential distribution where the mean number of events per time period is 0.2. So you could use it to simulate 100 intervals, in minutes, between service calls, where the average rate of incoming calls is 0.2 per minute.

R code

```r
rexp(n=100,  rate=0.2)
```

Python code

```python
stats.expon.rvs(0.2,  size=100)
```
