# Normal distribution

* Describes a continuous variable whose PDF has a single symetric peak.

![Normal distribution](../../images/Courses/normal_distribution_1.png)

There are two important parameters for the Normal distribution, **mean and standard deviation**, which are the top of the peak and how spread the data are.

The mean and standard deviation from the plot are not the same than the ones gotten from the data.

## Comparing Data vs PDF

![Normal vs Data](../../images/Courses/normal_comparing_vs_data.png)

So to execute the comparison

```python
mean = np.mean(data)
std = np.std(data)
sample = np.random.normal(mean, std, size = 10000)
x, y = ecdf(data)
x_theor, y_theor = ecdf(sample)

plt.plot(x_theor, y_theor)
plt.plot(x, y, marker=".", linestyle="none")
plt.xlabel("speed of light")
plt.ylabel("CDF")
plt.show()
```

![Normal ECDF vs speed of light](../../images/Courses/normal_ecdf_speedoflight.png)

## Warnings

### Distributions that look like normal, but they are not

This ditribution looks like normal distribution, but it's not.

![No Normal dist](../../images/Courses/length_of_ma_large_mouth.png)

Taking a look at CDF

![CDF](../../images/Courses/cdf_length_of_ma_large_mouth_bass.png)

It looks close normal distributed

![CDF](../../images/Courses/cdf_length_of_ma_large_mouth_bass_light_tail.png)

But the light tail is a sign this is not normal distributed, but it would not be a big error if we treat it like a normal distribution.

Anyway, this is not normaly distributed

![Not Normal](../../images/Courses/cdf_length_of_ma_large_mouth_bass_1.png)

We can see that the mass is not normal distributed, even the length is.

Another key point is the lightness of the tails

![Tail length](../../images/Courses/normal_tail_length.png)

> When modeling Normal distributions, outliers are extremely unlikely. So if there are outliers, normal distribution is not the best description for the data.
