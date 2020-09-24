library(tidyverse)
library(dslabs)
library(rvest)

url <- "https://en.wikipedia.org/wiki/Murder_in_the_United_States_by_state"
murders_raw <- read_html(url) %>%
  html_nodes("table") %>%
  html_table()
murders_raw <- murders_raw[[2]] %>%
  setNames(c("state","population", "total", "murders", "gun_murders", "gun_ownership", "total_rate", "murder_rate", "gun_murder_rate"))
head(murders_raw)

class(murders_raw$population)
class(murders_raw$total)

############# String functions #############
# prefix str_
library(stringr)
one_var <- "10\".0"
cat(one_var) # it displays its format

murders_raw$population[1:3]


# This fails, because of the comaes
as.numeric(murders_raw$population[1:3])
# Locate coma and replace it with empty space

commas <- function(x) any(str_detect(x, ","))
murders_raw %>% summarize_all(funs(commas))

# replacing the commas
test_1 <- str_replace_all(murders_raw$population, ",", "")
test_1 <- as.numeric(test_1)
test_1

# as it is so common, there is a current function
test_2 <- parse_number(murders_raw$population)
identical(test_1, test_2) # this is true

# so this is the code we need to the end 
murders_new <- murders_raw %>% mutate_at(2:3, parse_number)
murders_new %>% head()

