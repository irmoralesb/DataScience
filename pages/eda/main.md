# Exploratory Data Analysis (EDA)

* The process of organizing, plotting, and summarizing a data set

## Graphical EDA 

### Histogram and Binning Bias

One of the most common graph is the Histogram, when the Histogram is used the same data may be interpreted differently depending of the number of bins... which ends up in **Binning Bias**. Also note we are not displaying the data but it is grouped in the bins.

![Histogram Comparison](../images/Courses/histogram_comparison.png)

### Bee Swarm Plot

In contrast, this chart displays every single data as a point.

![Bee Swarm Plot](../images/Courses/bee_swarm_plot.png)

But it is not the best option when we have a lot of data that is overlapping.

![Bee Swarm Plot](../images/Courses/bee_swarm_full.png)

### Empirical Cumulative Distribution Function (ECDF)

This chart let us easily compare the percentage vs the feature we are measuring.

![ECDF](../images/Courses/ecdf_single.png)

For instance we can see:
* 80% of the versicolor petals are 4.7 cm length or more
* 20% of the versicolor petals are below 4.0 cm length 

Highlights

* X must be sorted
* Y is the corresponding percentage

It can be used to compare

![ECDF](../images/Courses/ecdf_comparison.png)
