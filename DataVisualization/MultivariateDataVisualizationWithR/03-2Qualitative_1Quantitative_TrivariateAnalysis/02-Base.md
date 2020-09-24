Trivariate Analysis for 2 Quantitative and 1 Qualitative variables
================

Charts
======

Function to create table rows

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
no_awards <- "No Awards"
won_awards <- "Won Awards"

getRow <- function(awards){
  
  subset <- movies[movies$Awards == awards,]
  
  tapply(
    subset$Box.Office,
    subset$Rating,
    mean)
}

# Combine the two rows to form a table

table <- rbind(
  getRow(no_awards),
  getRow(won_awards))

# Rename the rows
rownames(table) = c(no_awards, won_awards)

print(table)
```

    ##                   G       PG    PG-13        R
    ## No Awards  19.15958 22.41607 24.42359 11.82556
    ## Won Awards 76.40349 79.87252 75.48686 29.31659

Grouped Bar Chart
-----------------

``` r
  barplot(
    height = table,
    beside = TRUE,
    main = "Average Box Office Revenue by Rating and Award Status",
    xlab = "Rating",
    ylab = "Box Office Revenue ($M)",
    legend = rownames(table))
```

![](02-Base_files/figure-markdown_github/unnamed-chunk-2-1.png)

Stacked Bar Chart
-----------------

``` r
barplot(
  height = table,
  beside = FALSE,
  main = "Average Box Office Revenue by Rating and Award Status",
  xlab = "Rating",
  ylab = "Box Office Revenue ($M)",
  legend = rownames(table))
```

![](02-Base_files/figure-markdown_github/unnamed-chunk-3-1.png)

Faceted Bar Chart
-----------------

``` r
par(mfrow = c(1,2))
barplot(
  height = getRow(no_awards),
  ylim = c(0,100),
  main = no_awards,
  xlab = "Rating",
  ylab = "Box Office Revenue")

barplot(
  height = getRow(won_awards),
  ylim = c(0,100),
  main = won_awards,
  xlab = "Rating")
```

![](02-Base_files/figure-markdown_github/unnamed-chunk-4-1.png)

Heat Map
--------

``` r
heatmap(
  x = table,
  col = heat.colors(100),
  scale = "none",
  Colv = NA,
  Rowv = NA,
  margins = c(6,10),
  main = "Average Box Office Revenue",
  cexRow = 2)
```

![](02-Base_files/figure-markdown_github/unnamed-chunk-5-1.png)
