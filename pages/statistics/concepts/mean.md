# Mean

> aka Average

* It's affected by extreme values ([outliers](outliers.md))
* Symbol
  * Sample <!-- $\bar{x}$ --><img style="transform: translateY(0.25em);background:white" src="../../../svg/VNuZK2xJvO.svg"/>
  * Population <!-- $\sigma$ --> <img style="transform: translateY(0.25em);background:white;" src="../../../svg/MlOcPF2nTh.svg"/>
* Formula
  * Sample<!-- $\bar{x}=\frac{\sum_{i=0}^{n}x_i}{n}$ --> <img style="transform: translateY(0.25em);background:white" src="../../../svg/wHwzHmJopT.svg"/>
  * Population <!-- $\sigma=\frac{\sum_{i=0}^{n}x_i}{N}$ --> <img style="transform: translateY(0.25em);background:white;" src="../../../svg/omrToyxje8.svg"/>
* N = Population or n = sample

R
``` r
state <- read.csv('state.csv')
mean(state[['Population']])
[1] 6162876
```
Python
``` python
# Using pandas lib
state['Population'].mean()
```

## Trimmed Mean

> Variation of the Mean, it removes a fixed number of sorted values at each end, and then takes the average of the remaining elements

* **Robust**, eliminates influence of extreme values (outliers)
* Symbol <!-- $\bar{x}$ --><img style="transform: translateY(0.25em);background:white" src="../../../svg/VNuZK2xJvO.svg"/>
* Formula <!-- $\bar{x}=\frac{\sum_{i=p+1}^{n-p}x_i}{n-2p}$ --> <img style="transform: translateY(0.25em);background:white" src="../../../svg/DeOLnXelEs.svg"/>

R
```r
mean(state[['Population']], trim=0.1)
[1] 4783697
```

Python
``` python
# Using pandas lib
trim_mean(state['Population'], 0.1)
```

### Some Use Cases

* Contests, where the score may have influence by the extremes, lower or higher score than expected

## Weighted Mean

> It's calculated by multiplying each data value $x_i$ by a user-specified weight $w_i$ and dividing their sum by the sum of the weights. 

* Formula <!-- $\bar{x}_w=\frac{\sum_{i=1}^{n}w_ix_i}{\sum_{i=1}^{n}w_i}$ --> <img style="transform: translateY(0.25em);background:white" src="../../../svg/UpX4J7fpwh.svg"/>

R
```r
weighted.mean(state[['Murder.Rate']], w=state[['Population']])
[1] 4.445834
```

Python
``` python
np.average(state['Murder.Rate'], weights=state['Population'])
```

### Some Use Cases

* Some values are intrinsically more variable than others, and highly variable observations are given a lower weight. For example, if we are taking the average from multiple sensors and one of the sensors is less accurate, then we might downweight the data from that sensor.
* The data collected does not equally represent the different groups that we are interested in measuring. For example, because of the way an online experiment was conducted, we may not have a set of data that accurately reflects all groups in the user base. To correct that, we can give a higher weight to the values from the groups that were underrepresented.


