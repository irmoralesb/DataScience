# Correlogram

## Highlights

* Visual correlation matrix
* Columns and rows
* Divergent color palette


## Environment Setup

``` r
library(corrgram)

movies <- read.csv("../data/movies.csv")

# Creates a correlation matrix
correlations <- cor(movies[,c(2,4,5,6)])

round(correlations,2)
```

    ##               Year Runtime Critic.Score Box.Office
    ## Year          1.00   -0.04         0.04      -0.01
    ## Runtime      -0.04    1.00         0.19       0.35
    ## Critic.Score  0.04    0.19         1.00       0.16
    ## Box.Office   -0.01    0.35         0.16       1.00

## Core R Library


``` r
corrgram(movies)
```

![](../../images/statistics/correlogram_1.png)

## Lattice Library


``` r
library(corrgram)
library(lattice)

movies <- read.csv("../data/movies.csv")
top100 <- read.csv("../data/Top 100.csv")
# Creates a correlation matrix
correlations <- cor(movies[,c(2,4,5,6)])

round(correlations,2)
```

    ##               Year Runtime Critic.Score Box.Office
    ## Year          1.00   -0.04         0.04      -0.01
    ## Runtime      -0.04    1.00         0.19       0.35
    ## Critic.Score  0.04    0.19         1.00       0.16
    ## Box.Office   -0.01    0.35         0.16       1.00


``` r
levelplot(
  x = correlations,
  at = seq(-1,1,0.1))
```

![](../../images/statistics/correlogram_2.png)

## GGPlot Library


``` r
library(corrgram)
library(ggplot2)
library(reshape2)

movies <- read.csv("../data/movies.csv")
top100 <- read.csv("../data/Top 100.csv")

# Creates a correlation matrix
correlations <- cor(movies[,c(2,4,5,6)])
melted <- melt(correlations) # Convert it to DF
round(correlations,2)
```

    ##               Year Runtime Critic.Score Box.Office
    ## Year          1.00   -0.04         0.04      -0.01
    ## Runtime      -0.04    1.00         0.19       0.35
    ## Critic.Score  0.04    0.19         1.00       0.16
    ## Box.Office   -0.01    0.35         0.16       1.00

``` r
head(melted)
```

    ##           Var1    Var2        value
    ## 1         Year    Year  1.000000000
    ## 2      Runtime    Year -0.037811720
    ## 3 Critic.Score    Year  0.044763131
    ## 4   Box.Office    Year -0.009573985
    ## 5         Year Runtime -0.037811720
    ## 6      Runtime Runtime  1.000000000

``` r
ggplot(
  data = melted,
  aes(
    x = Var1,
    y = Var2,
    fill = value)) +
  geom_tile() +
  scale_fill_gradient2(
    low = "red",
    mid = "white",
    high = "blue",
    limit = c(-1,1),
    midpoint = 0)
```

![](../../images/statistics/correlogram_3.png)