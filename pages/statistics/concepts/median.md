# Median

> It's is the middle number on a sorted list of the data.

 * If there is an even number of data values, the middle value is one that is not actually in the data set, but rather the average of the two values that divide the sorted data into upper and lower halves.
* Robust estimate, not affected by [outliers](outliers.md)

R
```r
median(state[['Population']])
[1] 4436370
```
Python
``` python
# Using pandas lib
state['Population'].median()
```


 ## Weighted Median 

As with the median, we first sort the data, although each data value has an associated weight. Instead of the middle number, the weighted  median is a value such that the sum of the weights is equal for the lower and upper halves of the sorted list. Like the median, the weighted median is robust to outliers.

R
```r
library('matrixStats')
weightedMedian(state[['Murder.Rate']], w=state[['Population']])
[1] 4.4
```

Python
``` python
wquantiles.median(state['Murder.Rate'], weights=state['Population'])
```
