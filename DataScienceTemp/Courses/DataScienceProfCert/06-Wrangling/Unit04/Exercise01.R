# Epoch January 1st 1970
# Days since epoch date

library(dslabs)
library(tidyverse)
library(ggplot2)
data("polls_us_election_2016")
polls_us_election_2016$startdate %>% head
class(polls_us_election_2016$startdate)

# converting to numbers
as.numeric(polls_us_election_2016$startdate) %>% head()

# ggplot can handle it
polls_us_election_2016 %>% filter(pollster == "Ipsos" & state == "U.S.") %>%
  ggplot(aes(startdate, rawpoll_trump)) +
  geom_line()


# Package for dates (used by tidyverse)
library(lubridate)

set.seed(2)
dates <- sample(polls_us_election_2016$startdate, 10) %>% sort()
dates

# date functions 
data.frame(date = days(dates),
           month= month(dates),
           day=day(dates),
           year=year(dates))


month(dates, label = TRUE)

# Parsers 
x <- c(20090101, "2009-01-02", "2009 01 03", "2009-1-4", "2009-1, 5", "Created on 2009 1 6", "200901 !!! 07")
ymd(x)


x <- "09/01/02"
ymd(x)
mdy(x)
ydm(x)
myd(x)
dmy(x)
dym(x)



## Times
Sys.time() # current time
now()
now("GMT")

# Time zones
OlsonNames()


now() %>% hour()
now() %>% minute()
now() %>% second()


x <- c("12:34:56")
hms(x)


x <- "Nov/2/2012 12:34:56"
mdy_hms(x)
