# Random Sampling And Sample Bias

* **Sample** is a subset of data from a larger data set (Population).

* **Random Sampling** is a process in which each available member of the population being sampled has an equal chance of being chosen for the sample at each draw. The sample that results is called *simple random sample*.

* **Sample with replacement** is where the observations are put back in the population.

* **Sample without replacement** is where the observations are not put back in the population.

> Data quality often matters more than data quantity, that is, completeness, consistency of format, cleanliness, and accuracy of individual data points.

* **Bias**, systematic error.

* **Sample bias**, a sample that misrepresents the population.

* **Stratified sampling** is when the population is diveded into strata and randomly sampling from each strata.

* **Statum** (pl. strata) is a homogeneous subgroup of a population with common characteristics.


## Bias

Statistical bias refers to measurement or sampling errors that are systematic and produced by the measurement or sampling process. *An important distinction should be made between errors due to random chance and errors due to bias*.

## Example

Consider the physical process of a gun shooting at a target.

**Unbiased process**

An unbiased process will produce error, but it is random and does not tend strongly in any direction.

![Unbias](../images/Courses/unbias_process.png)

A bias process will produce error too, but there will be a tendency as shown below

![Bias](../images/Courses/bias_process.png)

## Random Selection

> Proper definition of an accessible population is key.


### Stratified sampling

In  stratified  sampling, the population is divided up into  strata, and random samples are taken from each stratum. Political pollsters might seek to learn the electoral preferences of whites, blacks, and Hispanics. A simple random sample taken from the population would yield too few blacks and Hispanics, so those strata could be overweighted in stratified sampling to yield equivalent sample sizes.

### Size vs Quality

In the era of big data, it is sometimes surprising that smaller is better.  Time and effort spent on random sampling not only reduces bias but also allows greater attention to data exploration and data quality. For example, missing data and outliers may contain useful information. It might be prohibitively expensive to track down missing values or evaluate outliers in millions of records, but doing so in a sample of several thousand records may be feasible. Data plotting and manual inspection bog down if there is too much data.

When  are  massive amounts of data needed?

The classic scenario for the value of big data is when the data is not only big but sparse as well. Consider the search queries received by Google, where columns are terms, rows are individual search queries, and cell values are either 0 or 1, depending on whether a query contains a term. The goal is to determine the best predicted search destination for a given query. There are over 150,000 words in the English language, and Google processes over one trillion queries per year. This yields a huge matrix, the vast majority of whose entries are “0.”

This is a true big data problem—only when such enormous quantities of data are accumulated can effective search results be returned for most queries. And the more data accumulates, the better the results. For popular search terms this is not such a problem—effective data can be found fairly quickly for the handful of extremely popular topics trending at a particular time. The real value of modern search technology lies in the ability to return detailed and useful results for a huge variety of search queries, including those that occur with a frequency, say, of only one in a million.

Keep in mind that the number of actual  pertinent  records—ones in which this exact search query, or something very similar, appears (together with information on what link people ultimately clicked on)—might need only be in the thousands to be effective. However, many trillions of data points are needed to obtain these pertinent records (and random sampling, of course, will not help).

## Selection Bias

It refers to the practice of selective choosing data.

* **Selection Bias**, bias resulting from the way in which observations are selected.

* **Data Snooping**, extensive hunting through data in search of something interested.

* **Vast search effect**, bias or nonreproducibility resulting from repeated data modeling,or modeling data with large numbers of preditctor variables.

If you specify a hypothesis and conduct a well-designed experiment to test it, you can have high confidence in the conclusion. This is frequently not what occurs, however. Often, one looks at available data and tries to discern patterns. But are the patterns real? Or are they just the product of  data snooping

The difference between a phenomenon that you verify when you test a hypothesis using an experiment and a phenomenon that you discover by perusing available data can be illuminated with the following thought experiment.

Imagine that someone tells you they can flip a coin and have it land heads on the next 10 tosses. You challenge them, and they proceed to toss the coin 10 times, with all flips landing heads. **Clearly you ascribe some special talent to this person**—the probability that 10 coin tosses will land heads just by chance is 1 in 1,000. Now imagine that the announcer at a sports stadium asks the 20,000 people in attendance each to toss a coin 10 times, and to report to an usher if they get 10 heads in a row. The chance that  somebody  in the stadium will get 10 heads is extremely high (more than 99%—it’s 1 minus the probability that nobody gets 10 heads). **Clearly, selecting after the fact the person (or persons) who gets 10 heads at the stadium does not indicate they have any special talent—it’s most likely luck**. Since repeated review of large data sets is a key value proposition in data science, **selection bias is something to worry about**. A form of selection bias of particular concern to data scientists is what John Elder calls the  vast search  effect.

If you repeatedly run different models and ask different questions with a large data set, you are bound to find something interesting. But **is the result you found truly something interesting, or is it the chance outlier**? We can guard against this by using a **holdout set**, and sometimes more than one holdout set, against which to validate performance. Elder also advocates the use of what he calls  **target  shuffling**  (a permutation test, in essence) to test the validity of predictive associations that a data mining model suggests.

### Regresion to the mean

**Regression to the mean** refers to a phenomenon involving successive measurements on a given variable: extreme observations tend to be followed by more central ones. *Attaching special focus and meaning to the extreme value can lead to a form of selection bias*.

#### Examples

* A player may perform great when he has luck and skill, but then the luck may go away, even the skill remains, so the performance is not longer a outlier, instead it regress to the mean.

* The tallest man don't have sons as tall as they are, and the same happens to smallest ones, their sons are taller than they, the heights regress to the mean.
