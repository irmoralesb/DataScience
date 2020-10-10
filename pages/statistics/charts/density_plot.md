# Density Plot


## Highlights

* Shape
* Location
* Spread
* Smooth


## We Can Answer Questions Like:

  1. What is the average movie runtime?
  2. Are there any outliers?
  3. How spread out are the movie runtimes?
  4. What is the shape of the runtime distribution?


## R Environment Setup


```r
movies = read.csv("../data/Movies.csv")
```

## Core R Library


Creating a density plot of runtime

```r
plot(
  x = density(movies$Runtime),
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime in minutes"
)
```

![](../../images/statistics/density_plot_1.png)


## Lattice Library

```r
densityplot(
  x = ~Runtime,
  data = movies,
  main = main_title,
  xlab = x_lab)
```

![](../../images/statistics/density_plot_2.png)

## GGPlot Library


```r
ggplot(
  data = movies,
  aes(x=Runtime)) +
  geom_density() +
  ggtitle(main_title) +
  xlab(x_lab)
```

![](../../images/statistics/density_plot_3.png)
