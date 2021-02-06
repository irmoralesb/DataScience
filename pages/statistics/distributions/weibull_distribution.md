# Weibull Distribution

In many cases, the event rate does not remain constant over time. If the period over which it changes is much longer than the typical interval between events, there is no problem; you just subdivide the analysis into the segments where rates are relatively constant, as mentioned before. If, however, the event rate changes over the time of the interval, the exponential (or Poisson) distributions are no longer useful. This is likely to be the case in mechanical failure—the risk of failure increases as time goes by. The Weibull  distribution is an extension of the exponential distribution in which the event rate is allowed to change, as specified by a  shape parameter, <img style="transform: translateY(0.1em); background: white;" src="../../../svg/0vI5qDmuES.svg"> of an event increases over time; if β . If <img style="transform: translateY(0.1em); background: white;" src="../../../svg/0vI5qDmuES.svg"> > 1, the probability  < 1, the probability decreases. Because the Weibull distribution is used with time-to-failure analysis instead of event rate, the second parameter is expressed in terms of characteristic life, rather than in terms of the rate of events per interval. The symbol used is <!-- $\eta$ --> <img style="transform: translateY(0.1em); background: white;" src="../../../svg/cgPegWtv3s.svg">, its' the scale parameter.

## Code Example

The code to generate random numbers from a Weibull distribution takes three arguments:  n  (the quantity of numbers to be generated),  shape, and  scale. For example, the following code would generate 100 random numbers (lifetimes) from a Weibull distribution with shape of 1.5 and characteristic life of 5,000:

R Code

```r
rweibull(100,  1.5,  5000)
```

Python Code

```python
stats.weibull_min.rvs(1.5,  scale=5000,  size=100)
```
