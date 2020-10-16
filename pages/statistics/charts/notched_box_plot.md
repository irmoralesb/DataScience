# Notched Box Plot

The main difference with the previous is that the box is notches around the median value of each box plot, that is the confidence values.

## It Measures

* Notches
* Confidence interval


## Environment Setup


``` r
movies <- read.csv("../data/Movies.csv")
main_label <- "Average Box-Office Revenue by Rating"
rating_label <- "Rating"
box_office_label <- "Box Office ($M)"
```


## Core R Library

``` r
plot(
  x = movies$Rating,
  y = movies$Box.Office,
  notch = TRUE,
  main = main_label,
  xlab = rating_label,
  ylab = box_office_label)
```

![](../../images/statistics/notched_plot_1.png)

## Lattice Library

``` r
bwplot(
  x = Box.Office ~ Rating,
  data = movies,
  notch = TRUE,
  main = main_label,
  xlab = rating_label,
  ylab = box_office_label)
```

![](../../images/statistics/notched_plot_2.png)

## GGPlot Library
``` r
main_label <- "Box Office Revenue by Rating"
ggplot(
  data = movies,
  aes(x = Rating, y = Box.Office)) +
  geom_boxplot(notch = TRUE) +
  ggtitle(main_label) + 
  xlab(rating_label) +
  ylab(box_office_label)
```

![](../../images/statistics/notched_plot_3.png)