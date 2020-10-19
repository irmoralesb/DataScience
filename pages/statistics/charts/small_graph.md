# Small Graph

## Highlights

* Relationships
* Labels
* Small number of vertices
* Additional variables

## Environment Setup 

### IGraph Library


``` r
library(igraph)

actors <- read.csv("../data/Actors.csv")
head(actors)
```

    ##     Actor                  Partner Count
    ## 1 50 Cent Adewale Akinnuoye-Agbaje     1
    ## 2 50 Cent                Al Pacino     1
    ## 3 50 Cent             Carla Gugino     1
    ## 4 50 Cent               Joy Bryant     1
    ## 5 50 Cent       Omar Benson Miller     1
    ## 6 50 Cent           Robert De Niro     1

``` r
actors5 <- actors[actors$Count >= 5,]

graph5 <- graph.data.frame(
  d = actors5,
  directed = FALSE)

plot(
  x = graph5,
  edge.curved = FALSE,
  main = "Five-time or More Acting Pairs")
```

![](../../images/statistics/small_graph.png)