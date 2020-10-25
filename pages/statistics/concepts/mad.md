# Median Absolute Deviation

> A.K.A. MAD

* Robust, no affected to ourliers
* Formula <!-- $MedianAbsoluteDeviation=Median(|x_1-m|,|x_2-m|,...,|x_N-m|)$ --> <img style="transform: translateY(0.25em);background:white;" src="../../../svg/XJzrNkbI1q.svg"/>
  * m :  median

R
``` r
mad(state[['Population']])
```

Python
``` python
#robust.scale.mad from the statsmodels
robust.scale.mad(state['Population'])
```
