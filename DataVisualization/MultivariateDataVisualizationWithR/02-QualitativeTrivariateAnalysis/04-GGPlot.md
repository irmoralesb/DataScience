Qualitative Trivariate Analysis
================

Charts
======

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 3.5.2

    ## -- Attaching packages ------------------------------------------------------------------------ tidyverse 1.2.1 --

    ## v ggplot2 3.0.0     v purrr   0.2.5
    ## v tibble  1.4.2     v dplyr   0.7.6
    ## v tidyr   0.8.1     v stringr 1.3.1
    ## v readr   1.1.1     v forcats 0.3.0

    ## -- Conflicts --------------------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
movies <- read.csv("../data/movies.csv")
head(movies)
```

    ##                   Title Year Rating Runtime Critic.Score Box.Office
    ## 1  The Whole Nine Yards 2000      R      98           45       57.3
    ## 2      Cirque du Soleil 2000      G      39           45       13.4
    ## 3             Gladiator 2000      R     155           76      187.3
    ## 4              Dinosaur 2000     PG      82           65      135.6
    ## 5     Big Momma's House 2000  PG-13      99           30        0.5
    ## 6 Gone in Sixty Seconds 2000  PG-13     118           24      101.0
    ##       Awards  Distribution
    ## 1  No Awards      Domestic
    ## 2 Won Awards      Domestic
    ## 3 Won Awards International
    ## 4 Won Awards      Domestic
    ## 5 Won Awards International
    ## 6 Won Awards      Domestic

Faceted Grouped Frequency Bar Chart
-----------------------------------

``` r
movies %>%
  ggplot(
   aes(x=Rating, fill = Awards)) +
  geom_bar(
    position = "dodge") +
  facet_wrap(
    facets = ~Distribution) +
  ggtitle("Count of Movies by Rating, Awards, and Distribution")+
  xlab("Rating")+
  ylab("Count of Movies")
```

![](04-GGPlot_files/figure-markdown_github/unnamed-chunk-2-1.png)

Faceted Stacked Frequency Bar Chart
-----------------------------------

``` r
movies %>%
  ggplot(
    aes(x = Rating, fill = Awards)) +
  geom_bar() +
  facet_wrap(
    facets = ~Distribution) +
  ggtitle("Count of Movies by Rating, Awards, and Distribution")+
  xlab("Rating")+
  ylab("Count of Movies")
```

![](04-GGPlot_files/figure-markdown_github/unnamed-chunk-3-1.png)

Faceted Frequency Bar Chart
---------------------------

``` r
movies %>%
  ggplot(aes(x = Rating)) +
  geom_bar() +
  facet_grid(
    facets = Awards ~ Distribution) +
  ggtitle("Count of Movies by Rating, Awards, and Distribution")+
  xlab("Rating")+
  ylab("Count of Movies")
```

![](04-GGPlot_files/figure-markdown_github/unnamed-chunk-4-1.png)
