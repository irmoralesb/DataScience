# Percentiles And Quartiles

> Percentiles are based on percents and Quantiles on fractions, so 80% = .8 respectively

To avoid the sensitivity to outliers, we can look at the range of the data after dropping values from each end. Formally, these types of estimates are based on differences between percentile.

In a data set, the **Pth** percentile is a value such that at least P percent of the values take on this value or less and at least (100 – P) percent of the values take on this value or more

## Highlights

* 80th percentile: 80% of the values
* 50th : is the Median
* 75th - 25th : IQR - Interquartile Range, it's a common measurement of variability  

R - IQR

```r
IQR(state[['Population']])
```

Python - IQR
``` python
state['Population'].quantile(0.75) - state['Population'].quantile(0.25)
```

Machine learning and statistical software use special algorithms, such as  **[Zhang-Wang-2007]**, to get an approximate percentile that can be calculated very quickly and is guaranteed to have a certain accuracy.

## Precise Definition

If we can't choose a specific element as a percentile due to the number of elements, we can use:

<!-- $$
100 * \frac{j}{n}\leq P \lt 100*\frac{j+1}{n}
$$ --> 

<div align="center" style="background:white;"><img src="../../../svg/XWmFqPfJsg.svg"/></div>

So this is a weighted average

<!-- $$
Percentile(P) = (1 - w)x_{(j)}+wx_{(j+1)}
$$ --> 

<div align="center" style="background:white;"><img src="../../../svg/5N3HHvC6jH.svg"/></div>

* w : between 0 and 1
