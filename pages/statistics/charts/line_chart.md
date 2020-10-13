# Line Chart

Similar to Step chart, rather than displays values as constants throughout each time period, they show the rate of change from one time period to the next.

## It Measures

* Change value over time
* Rate of change

## Environment Setup

### Load time series data

Load time series data

``` r
timeSeries <- read.csv("../data/Timeseries.csv")
```

Display the time series data

``` r
head(timeSeries)
```

    ##   Year Box.Office
    ## 1 2000   43.20957
    ## 2 2001   40.56887
    ## 3 2002   44.26228
    ## 4 2003   46.44941
    ## 5 2004   41.16540
    ## 6 2005   36.78063

## Core R Library


``` r
plot(
  x = timeSeries,
  type = "l",
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)")
```

![](../../images/statistics/line_chart_1.png)

## Lattice Library


``` r
 xyplot(
   x = Box.Office ~ Year,
   data = timeSeries,
   type = "l",
   ylim = c(0, max(timeSeries$Box.Office)),
   main = "Average Box Office Revenue by Year",
   xlab = "Year",
   ylab = box_office_label)
```

![](../../images/statistics/line_chart_2.png)

## GGPlot Library


``` r
ggplot(data = timeSeries,
       aes(x = Year, y = Box.Office)) +
  geom_line() +
  expand_limits(y = 0) + 
  ggtitle("Average box Office Revenue by Year") +
  xlab("Year") +
  ylab(box_office_label)
```

![](../../images/statistics/line_chart_3.png)