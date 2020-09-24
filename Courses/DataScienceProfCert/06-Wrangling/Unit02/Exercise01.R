library(dslabs)
library(tidyverse)
library(ggrepel)
data("gapminder")

################## TIDY DATA ##################

tidy_data <- gapminder %>%
  filter(country %in% c("South Korea", "Germany")) %>%
  select(country, year, fertility)

head(tidy_data)

tidy_data %>%
  ggplot(aes(year, fertility, color=country)) +
  geom_point()

################## WIDE FORMAT ##################
path <- system.file("extdata",package="dslabs")
filename <- file.path(path, "fertility-two-countries-example.csv")
wide_data <- read_csv(filename)
#head(wide_data)
select(wide_data, country, '1960':'1967')

################## CHANGING WIDE TO TIDY ##################

new_tidy_data <- wide_data %>%
  gather(year, fertility, '1960':'2015')

head(new_tidy_data)


#### No specifying what columns are going to be gather (since we are gathering all of them already)
new_tidy_data <- wide_data %>%
  gather(year, fertility, -country)

head(new_tidy_data)


#### Classes
class(tidy_data$year)

class(new_tidy_data$year)


#### converting year to numbers

new_tidy_data <- wide_data %>%
  gather(year, fertility, -country, convert = TRUE)
class(new_tidy_data$year)


new_tidy_data %>%
  ggplot(aes(year, fertility, color=country)) +
  geom_point()

##### Spread to move from tidy to wide data

new_wide_data <- new_tidy_data %>% spread(year, fertility)
select(new_wide_data, country, '1960':'1967')


################ SEPARATE AND UNITE ################

path <- system.file("extdata", package = "dslabs")
filename <- file.path(path, "life-expectancy-and-fertility-two-countries-example.csv")

raw_data <- read_csv(filename)
select(raw_data, 1:5)


dat <- raw_data %>% gather(key, value, -country)
head(dat)


# In this scenario we have an issue with "life_expectancy" column name, extra separation
dat %>% separate(key, c("year","variable_name"), "_")

# In this example we handle the error but not the best approach
dat %>% separate(key, c("year", "first_variable_name", "second_variable_name"), fill = "right")

# In this we merge the extra column
dat %>% separate(key,c("year","variable_name"), "_", extra = "merge")

# Now moving the new columns
dat %>% separate(key,c("year","variable_name"), "_", extra = "merge") %>%
  spread("variable_name",value)


#### Unite - not recommended for this scenario
dat %>% separate(key, c("year","first_variable_name","second_variable_name"), fill = "right") %>%
  unite(variable_name, first_variable_name, second_variable_name, sep="_") %>%
  spread(variable_name, value) %>%
  rename(fertility = fertility_NA)


################ Combining tables  ################
# Two tables, 
# table 1, population
data(murders)
head(murders)

# table 2, electoral votes
data("polls_us_election_2016")
head(results_us_election_2016)

# columns names for the state names are not the same
identical(results_us_election_2016$state, murders$state)
head(results_us_election_2016$state, n = 20)
head(murders$state, n= 20)


# using left_join
tab <- left_join(murders, results_us_election_2016, by = "state")
head(tab)

# now we can use it
tab %>% ggplot(aes(population/10^6, electoral_votes, label=abb)) +
  geom_point() +
  geom_text_repel() +
  scale_x_continuous(trans="log2") +
  scale_y_continuous(trans = "log2") +
  geom_smooth(method = "lm", se= FALSE)


# Exploring cases when the data does not exist in both tables.

tab1 <- slice(murders, 1:6) %>% select(state, population)
tab1

tab2 <- slice(results_us_election_2016, c(1:3, 5, 7:8)) %>%
  select(state, electoral_votes)
tab2

# LEFT JOIN
left_join(tab1, tab2)  #NAs added

#also
tab1 %>% left_join(tab2)

# RIGHT JOIN
right_join(tab1, tab2)


# INNER JOIN
inner_join(tab1, tab2)

# FULL JOIN
full_join(tab1, tab2)

# SEMI_JOIN (this does not join the tables, but let us keep the part of the first table for which we have information in the second)
semi_join(tab1, tab2)

# ANTI JOIN, the opposite of semi_join
anti_join(tab1, tab2)


########## BINDING ##########
# This just binds the tables, not matching by any column value.
bind_cols(a=1:3, b=4:6)

# cbind is almost the same, but does not creates tibbles

# BIND_COLS
tab1 <- tab[,1:3]
tab2 <- tab[,4:6]
tab3 <- tab[,7:9]
new_tab <- bind_cols(tab1, tab2, tab3)
head(new_tab)

# BIND_ROWS (based on rbind function)
tab1 <- tab[1:2,]
tab2 <- tab[3:4,]
bind_rows(tab1, tab2)

########## SET OPERTATORS ##########
# r by default only apply this over vectors, with dplyr it can be applied for tables
tab1 <- tab[1:5,]
tab2 <- tab[3:7,]
intersect(tab1, tab2)
union(tab1, tab2)
setdiff(tab1, tab2)
setdiff(tab2, tab1)
setequal(tab1, tab2) #regardless the order


################ WEB SCRAPING ################
library(rvest)
url <- "https://en.wikipedia.org/wiki/Murder_in_the_United_States_by_state"
h <- read_html(url)

class(h)
h
tab <- h %>% html_nodes("table")
tab <- tab[[2]]
tab

tab <- tab %>% html_table()
class(tab)

head(tab)
tab <-tab %>% setNames(c("state","population","total","murders","gun_murders", "gun_ownership", "total_rate", "murder_rate","gun_murder_rate"))
head(tab)

## Example from web page reading css selectors
h <- read_html("http://www.foodnetwork.com/recipes/alton-brown/guacamole-recipe-1940609")
recipe <- h %>% html_node(".o-AssetTitle__a-HeadlineText") %>% html_text()
prep_time <- h %>% html_node(".m-RecipeInfo__a-Description--Total") %>% html_text()
ingredients <- h %>% html_nodes(".o-Ingredients__a-Ingredient") %>% html_text()
guacamole <- list(recipe, prep_time, ingredients)
guacamole


get_recipe <- function(url){
  h <- read_html(url)
  recipe <- h %>% html_node(".o-AssetTitle__a-HeadlineText") %>% html_text()
  prep_time <- h %>% html_node(".m-RecipeInfo__a-Description--Total") %>% html_text()
  ingredients <- h %>% html_nodes(".o-Ingredients__a-Ingredient") %>% html_text()
  return(list(recipe = recipe, prep_time = prep_time, ingredients = ingredients))
} 

get_recipe("http://www.foodnetwork.com/recipes/food-network-kitchen/pancakes-recipe-1913844")
