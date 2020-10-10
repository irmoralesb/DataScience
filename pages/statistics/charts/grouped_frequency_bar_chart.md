# Grouped Frequency Bar Chart


> Aka: Cluster or dodged frequency bar chart)

It allows us to compare two variables, for instance we can see on X-axis the ratings, on Y-axis count of movies, but splitting the count on movies with awards. so you can compare one bar against the other easily.

## It Measures

  * Marginal frequency
  * Joint frequency
  * Part of whole


## We Can Answer Questions Like

  1. How many award-winning movies are in each rating category?
  2. What proportion of movies in each category have won awards?

## Environment Setup

Load data and create a contingency table

``` r
movies <- read.csv("../data/Movies.csv")
awards <- table(movies$Awards,
                movies$Rating)
main_title <- "Count of Movies by Rating and Awards"
rating_title <- "Rating"
movies_title <- "Count of Movies"
print(awards)
```

    ##        
    ##           G  PG PG-13   R
    ##   FALSE  34 203   502 574
    ##   TRUE   59 294   723 849

## Core R Library


``` r
barplot(
  height = awards,
  beside = TRUE,
  main = main_title,
  xlab = rating_title,
  ylab = movies_title,
  legend = c("No","Yes"),
  args.legend = list(
    x = "topleft",
    title = "Awards"))
```

![](../../images/statistics/grouped_bar_chart_1.png)


## Lattice Library


``` r
barchart(
  x = awards,
  stack = FALSE,
  horizontal = FALSE,
  main = main_title,
  xlab = rating_title,
  ylab = movies_title,
  auto.key = list(
    x = 0.05,
    y = 0.95,
    title = "Awards",
    text = c("No","Yes")))
```

![](../../images/statistics/grouped_bar_chart_2.png)

## GGPlot Library


``` r
ggplot(
  data = movies,
  aes(x = Rating, fill= Awards)) +
  geom_bar(position = "dodge") +
  ggtitle(main_title) +
  scale_fill_discrete(labels = c("No", "Yes"))
```

![](../../images/statistics/grouped_bar_chart_3.png)