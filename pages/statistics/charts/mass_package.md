# MASS Package

For the following plots we need to create a 2D kernel density estimate using MASS

* Countour Plot
* Level Plot
* Mesh Plot
* Surface Plot
* Step Chart
* Line Chart
* Area chart

## Process

To install it we execute 

`install.packages("MASS")`

Now we load the library

``` r
library(MASS)
```


Now create a 2D kernel density estimation

``` r
density2d <- kde2d(
  x = movies$Runtime,
  y = movies$Box.Office,
  n = 50)
```


Create a grid from our 2D kernel density estimate, the data structure is a *data frame*

``` r
grid <- expand.grid(
  x = density2d$x,
  y = density2d$y)

grid$z <- as.vector(density2d$z)
```

Display the data frame

``` r
head(grid)
```

    ##          x        y            z
    ## 1 38.00000 0.000181 4.450259e-06
    ## 2 41.69388 0.000181 4.664723e-06
    ## 3 45.38776 0.000181 2.351411e-06
    ## 4 49.08163 0.000181 6.875285e-07
    ## 5 52.77551 0.000181 1.030530e-07
    ## 6 56.46939 0.000181 1.752748e-07
