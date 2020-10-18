# Shape Coded Scatter Plot

## Highlights

* Scatterplot
* Shape-coded categories
* Palette of shapes
* Small number of shapes (2 - 4)

## Environment Setup


``` r
library(RColorBrewer)
```

    ## Warning: package 'RColorBrewer' was built under R version 3.5.2

``` r
movies2014 <- read.csv("../data/movies.csv")
movies2014 <- movies2014[movies2014$Year == 2014,]

colors <- brewer.pal(4, "Set1")
```

## Core R Library

Creating a shape palette

``` r
shapes <- c(1,4,2,0)
```

``` r
plot(
  x = movies2014$Critic.Score,
  y = movies2014$Box.Office,
  pch = shapes[as.integer(movies2014$Rating)],
  main = "Critic Score vs Box Office Revenue by Rating",
  xlab ="Critic Score (%)",
  ylab = "Box Office Revenue ($M)")

# Add a legend
legend(x = "topleft",
       legend = levels(movies2014$Rating),
       pch = shapes)
```

![](../../images/statistics/shaped_coded_scatter_plot_1.png)

## Lattice Library

``` r
movies2014 %>%
xyplot(
  x = Box.Office ~ Critic.Score,
  key = list(
    text = list(
      levels(movies2014$Rating)),
    points = list(
      pch = shapes),
    columns = 4),
  pch = shapes[as.integer(movies2014$Rating)],
  main = "Critic Score vs Box Office Revenue by Rating",
  xlab = "Critic Score (%)",
  ylab = "Box Office Revenue ($M)")
```

![](../../images/statistics/shaped_coded_scatter_plot_2.png)

## GGPlot Library

``` r
movies2014 %>%
  ggplot(
    aes(x = Critic.Score, 
        y = Box.Office,
        shape = Rating)) +
  scale_shape_manual(
    name = "Rating",
    labels = levels(movies2014$Rating),
    values = shapes) +
  geom_point() +
  ggtitle("Critic Score vs Box Office Revenue by Rating") +
  xlab("Critic Score") +
  ylab("Box Office Revenue ($M)")
```

![](../../images/statistics/shaped_coded_scatter_plot_3.png)