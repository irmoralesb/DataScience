library(tidyverse)
library(dslabs)
data(reported_heights)
length(reported_heights$height)
class(reported_heights$height)
# this returns a character vector

#and cannot be converted to a warning
x <- as.numeric(reported_heights$height)

head(reported_heights)
head(x)
summary(is.na(x))
sum(is.na(x))

# we can filter so we can see the invalid entries
reported_heights %>% mutate(new_height = as.numeric(height)) %>%
  filter(is.na(new_height)) %>%
  head(n=10)

# So we create a funcion to check invalid entries
not_inches <- function(x, smallest=50, tallest=84){
  inches <- suppressWarnings(as.numeric(x))
  ind <- is.na(inches) | inches < smallest | inches > tallest
  ind
}

problems <- reported_heights %>%
  filter(not_inches(height)) %>%
  .$height

length(problems)

# pattern detected: x' y or x' y" or x' y\"
pattern <- "^\\d\\s*'\\s*\\d{1,2}\\.*\\d*'*\"*$"
str_subset(problems, pattern = pattern) %>% head(n=10) %>% cat()


#patter detected: x.y or x,y
pattern <- "^[4-6]\\s*[\\.|,]\\s*([0-9]|10|11)$"
str_subset(problems, pattern) %>% head(n=10) %>% cat()


# amount in cm
ind <- which(between(suppressWarnings(as.numeric(problems))/2.54,54,81))
ind <- ind[!is.na(ind)]
problems[ind %>% head(n=10)] %>% cat()


################### Regex ###################
# Any text works as a pattern for the str_ functions
str_subset(problems, "'")
#works the same for
pattern <- "'"
str_subset(problems, pattern)


yes <- c("180 cm", "70 inches")
no <- c("180", "70''")
s <- c(yes,no)

# to detect which detects cm or inches
str_detect(s,"cm") | str_detect(s, "inches")

# | => or
str_detect(s,"cm|inches")

# \d => any digit 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
# in R we need to use \\d

yes <- c("5","6","5'10","5'10","5 feet", "4'11")
no <- c("", ".","Five","six")
s <- c(yes, no)
pattern <- "\\d"
str_detect(s, pattern)

# str_view function good for troubleshooting

str_view(s, pattern)

# it shows all the matches
str_view_all(s, pattern)

#################### Characters classes, anchors, and qualifiers ####################
# to match only 5 or 6
# [56]
str_view(s,"[56]")

# range 4 - 7 - all is a string, not numbers
yes <- as.character(4:7)
no <- as.character(1:3)
s <- c(yes,no)
str_detect(s,"[4-7]")

# for characters [a-zA-Z]


# Anchors delimits the start and end ^ $
# ^\\d$  means start of the string, followed by 1 digit followed by the end
pattern <- "^\\d$"
yes <- c("1","5", "9")
no <- c("12","123"," 1", "a4", "b")
s <- c(yes,no)
str_view(s,pattern = pattern)


# Quantifiers, how many times the character repeats
# \\d{1,2}  for one or two digits
pattern <- "^\\d{1,2}$"
yes <- c("1", "5", "9", "12")
no <- c("123", "a4", "b")
str_view(c(yes,no),pattern)

# Creating the pattern what is going to match #' ##"
pattern <- "^[4-7]'\\d{1,2}\"$"

yes <- c("5'7\"", "6'2\"", "5'12\"")
no <- c("6,2\"","6.2\"", "I am 5'11\"", "3'2\"", "64")
str_detect(yes,pattern)
str_detect(no, pattern)


################### Search  and Replace ###################
pattern <- "^[4-7]'\\d{1,2}\"$"
sum(str_detect(problems,pattern))

problems[c(2,10,11,12,15)] %>% str_view(pattern)

str_subset(problems, "inches")

str_subset(problems, "''")

# sometimes the text we are looking for is not ending with "
pattern <- "[4-7]'\\d{1,2}$"

problems %>%
  str_replace("feet|ft|foot", "'") %>%
  str_replace("inches|in|''|\"", "") %>%
  str_detect(pattern) %>%
  sum
  
# \s  means space

pattern_2 <- "^[4-7]'\\s\\d{1,2}\"$"
str_subset(problems, pattern_2)


# * means 0 or more instances of the previous character
yes <- c("AB", "A1B","A11B","A111B", "A1111B")
no <- c("A2B", "A21B")
str_detect(yes, "A1*B")
str_detect(no, "A1*B")

#  ? => none or once
#  + => one or more

data.frame(string = c("AB","A1B","A11B","A111B", "A1111B"),
           none_or_more = str_detect(yes,"A1*B"),
           none_or_once = str_detect(yes, "A1?B"),
           once_or_more = str_detect(yes, "A1+B"))

pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"
problems %>% 
  str_replace("feet|ft|foot", "'") %>% 
  str_replace("inches|in|''|\"","") %>%
  str_detect(pattern) %>%
  sum

######### Groups with regex #########
# for instance we want to change "5.6"  to "5'6"
# groups does not affect the matching per se... 
# groups allows detect specific section of the string

pattern_without_groups <- "^[4-7],\\d*$"
pattern_with_groups <- "^([4-7]),(\\d*)$"


yes <- c("5,9", "5,11", "6,", "6,1")
no <- c("5'9", ",","2,8","6.1.1")
s <- c(yes,no)
str_detect(s, pattern_without_groups)
str_detect(s, pattern_with_groups)

str_match(s, pattern_with_groups)

str_extract(s, pattern_with_groups)

# this refers to the group
# \\i
# this is the i-th group

pattern_with_groups <- "^([4-7]),(\\d*)$"
yes <- c("5,9","5,11","6,","6,1")
no <- c("5'9",",","2,8","6.1.1")
s <- c(yes,no)
str_replace(s,pattern_with_groups, "\\1'\\2")

#### So now we have the pattern like this
pattern_with_groups <- "^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$"
str_subset(problems, pattern_with_groups) %>% 
  str_replace(pattern_with_groups, "\\1'\\2") %>%
  head

# Q1
problems <- c("5.3", "5,5", "6 1", "5 .11", "5, 12")
pattern_with_groups <- "^([4-7])[,\\.](\\d*)$"
str_replace(problems, pattern_with_groups, "\\1'\\2")

# Q2
problems <- c("5.3", "5,5", "6 1", "5 .11", "5, 12")
pattern_with_groups <- "^([4-7])[,\\.\\s](\\d*)$"
str_replace(problems, pattern_with_groups, "\\1'\\2")


############### Testing ###############

not_inches_or_cm <- function(x, smallest = 50, tallest= 84){
  inches <- suppressWarnings(as.numeric(x))
  ind <- !is.na(inches) &
    ((inches >= smallest & inches <= tallest) |
       (inches/2.54 >= smallest & inches/2.54 <= tallest))
  !ind
  
}

problems <- reported_heights %>%
  filter(not_inches_or_cm(height)) %>%
  .$height
length(problems)


converted <- problems %>%
  str_replace("feet|ft|foot", "'") %>% 
  str_replace("inches|in|''|\"", "") %>%
  str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2") 

pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"
index <- str_detect(converted, pattern)
mean(index)


# to check the remaining cases
converted[!index]

# the issue is that some students height exactly 5' or 6" , 
# so there are no additional numbers

#################### Using Groups and Quantifiers ####################

#   Four clear patterns of entries have arisen along with some other minor problems:
#  
#  1) Many students measuring exactly 5 or 6 feet did not enter any inches. 
#     For example, 6' - our pattern requires that inches be included.
#  2) Some students measuring exactly 5 or 6 feet entered just that number.
#  3) Some of the inches were entered with decimal points. For example 5'7.5''. Our pattern only looks for two digits.
#  4) Some entires have spaces at the end, for example 5 ' 9.
#  5) Some entries are in meters and some of these use European decimals: 1.6, 1,7.
#  6) Two students added cm.
#  7) One student spelled out the numbers: Five foot eight inches.
#
# It is not necessarily clear that it is worth writing code to handle all these cases since they might be rare enough. 
# However, some give us an opportunity to learn some more regex techniques so we will build a fix.

#### Case 1 ####
# For case 1, if we add a '0 to, for example, convert all 6 to 6'0, then our pattern will match. 
# This can be done using groups using the following code:

yes <- c("5","6","5")
no <- c("5'","5''","5'4")
s <-c(yes, no)
str_replace(s, "^([4-7])$","\\1'0")

# The pattern says it has to start (^), be followed with a digit between 4 and 7, and then end there ($). 
# The parenthesis defines the group that we pass as \\1 to the replace regex.


#### Cases 2 and 4 ####
# We can adapt this code slightly to handle case 2 as well which covers the entry 5'.
# Note that the 5' is left untouched by the code above. This is because the extra ' makes the pattern not match 
# since we have to end with a 5 or 6. To handle case 2, we want to permit the 5 or 6 to be followed by no or 
# one symbol for feet. So we can simply add '{0,1} after the ' to do this. We can also use the none or once 
# special character ?. As we saw previously, this is different from * which is none or more. We now see that
# this code also handles the fourth case as well:

str_replace(s, "^([4-7])'{0,1}$", "\\1'0")
# or also as pointed in the exercise 
str_replace(s, "^([56])'?$", "\\1'0")


# Note that here we only permit 5 and 6 but not 4 and 7. This is because heights of exactly 5 and exactly 6 feet tall 
# are quite common, so we assume those that typed 5 or 6 really meant either 60 or 72 inches. 
# However, heights of exactly 4 or exactly 7 feet tall are so rare that, although we accept 84 as a valid entry, 
# we assume that a 7 was entered in error.

#### Case 3 ####
# We can use quantifiers to deal with case 3. These entries are not matched because the inches include decimals and
# our pattern does not permit this. We need allow the second group to include decimals and not just digits. 
# This means we must permit zero or one period . followed by zero or more digits. So we will use both ? and *.
# Also remember that for this particular case, the period needs to be escaped since it is a special character 
# (it means any character except a line break).

# So we can adapt our pattern, currently ^[4-7]\\s*'\\s*\\d{1,2}$ to permit a decimal at the end:
pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"

#### Case 5 ####
# Case 5, meters using commas, we can approach similarly to how we converted the x.y to x'y. A difference is 
# that we require that the first digit is 1 or 2:

yes <- c("1,7", "1,8", "2, ")
no <- c("5,8", "5,3,2", "1.7")
s <- c(yes,no)
str_replace(s, "^([12])\\s*,\\s*(\\d*)$", "\\1\\.\\2")

# We will later check if the entries are meters using their numeric values.

#### Trimming ####

# In general, spaces at the start or end of the string are uninformative. These can be particularly deceptive 
# because sometimes they can be hard to see:

s <- "Hi "
cat(s)
identical(s,"Hi")

# This is a general enough problem that there is a function dedicated to removing them: str_trim.
str_trim("5 ' 9 ")

#### To upper and to lower case ####
# One of the entries writes out numbers as words: Five foot eight inches. Although not efficient, 
# we could add 12 extra str_replace to convert zero to 0, one to 1, and so on. To avoid having to write 
# two separate operations for Zero and zero, One and one, etc., we can use the str_to_lower 
# function to make all words lower case first:

s <- c("Five feet eight inches")
str_to_lower(s)

# Putting it into a function
# We are now ready to define a procedure that handles converting all the problematic cases.

# We can now put all this together into a function that takes a string vector and tries to convert as many 
# strings as possible to a single format. Below is a function that puts together the previous code replacements:

convert_format <- function(s){
  s %>%
    str_replace("feet|foot|ft", "'") %>% #convert feet symbols to '
    str_replace_all("inches|in|''|\"|cm|and", "") %>%  #remove inches and other symbols
    str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2") %>% #change x.y, x,y x y
    str_replace("^([56])'?$", "\\1'0") %>% #add 0 when to 5 or 6
    str_replace("^([12])\\s*,\\s*(\\d*)$", "\\1\\.\\2") %>% #change european decimal
    str_trim() #remove extra space
}

# We can also write a function that converts words to numbers:
words_to_numbers <- function(s){
  str_to_lower(s) %>%  
    str_replace_all("zero", "0") %>%
    str_replace_all("one", "1") %>%
    str_replace_all("two", "2") %>%
    str_replace_all("three", "3") %>%
    str_replace_all("four", "4") %>%
    str_replace_all("five", "5") %>%
    str_replace_all("six", "6") %>%
    str_replace_all("seven", "7") %>%
    str_replace_all("eight", "8") %>%
    str_replace_all("nine", "9") %>%
    str_replace_all("ten", "10") %>%
    str_replace_all("eleven", "11")
}

# Now we can see which problematic entries remain:
converted <- problems %>% words_to_numbers %>% convert_format
remaining_problems <- converted[not_inches_or_cm(converted)]
pattern <- str_detect(remaining_problems, pattern)
remaining_problems[!index]

################## Separate with regex ##################
s <- c("5'10", "6'1")
tab <- data.frame(x=s)

tab %>% separate(x, c("feet", "inches"), sep = "'")

# or
tab %>% extract(x, c("feet", "inches"), regex="(\\d)'(\\d{1,2})")


# but using the option with regex is more flexible
s <- c("5'10", "6'1","5'8inches")
tab <- data.frame(x=s)

# this fails... "8inches"
tab %>% separate(x, c("Feet", "inches"), sep="'", fill="right")

# but it works with extract
tab %>% extract(x, c("feet","inches"), regex = "(\\d)'(\\d{1,2})")


######################### Putting all together #########################
# We are now ready to put everything we've done so far together and wrangle our reported heights data as we try to
# recover as many heights as possible. The code is complex but we will break it down into parts.

# We start by cleaning up the height column so that the heights are closer to a feet'inches format. 
# We added an original heights column so we can compare before and after.

# Let's start by writing a function that cleans up strings so that all the feet and inches formats use 
# the same x'y format when appropriate.

pattern <- "^([4-7])\\s*'\\s*(\\d+\\.?\\d*)$"
smallest <- 50
tallest <- 84

new_heights <- reported_heights %>% 
  mutate(original = height, 
         height = words_to_numbers(height) %>% convert_format()) %>%
  extract(height, c("feet", "inches"), regex = pattern, remove = FALSE) %>% 
  mutate_at(c("height", "feet", "inches"), as.numeric) %>%
  mutate(guess = 12*feet + inches) %>%
  mutate(height = case_when(
    !is.na(height) & between(height, smallest, tallest) ~ height, #inches 
    !is.na(height) & between(height/2.54, smallest, tallest) ~ height/2.54, #centimeters
    !is.na(height) & between(height*100/2.54, smallest, tallest) ~ height*100/2.54, #meters
    !is.na(guess) & inches < 12 & between(guess, smallest, tallest) ~ guess, #feet'inches
    TRUE ~ as.numeric(NA))) %>%
  select(-guess)
  
# We can check all the entries we converted using the following code:
new_heights %>%
  filter(not_inches(original)) %>%
  select(original, height) %>% 
  arrange(height) %>%
  View()

# Let's take a look at the shortest students in our dataset using the following code:
new_heights %>% arrange(height) %>% head(n=7)


######### String splitting #########
filename <- system.file("extdata/murders.csv",package = "dslabs")
lines <- readLines(filename)
lines %>% head()

x <- str_split(lines, ",")
x %>% head()

col_names <- x[[1]]
x <- x[-1]

# We can convert it to a list, using map function from purrr package
library(purrr)
map(x, function(y) y[1]) %>% head()

# but there is a shortcut, so we can do this
map(x,1) %>% head()



map_chr(x,1) # to retain character vector
map_int(x,4) # to retain integer vector


# To create a Dataframe we can use:
dat <- data.frame(map_chr(x,1),
                  map_chr(x,2),
                  map_chr(x,3),
                  map_chr(x,4),
                  map_chr(x,5)) %>%
  mutate_all(parse_guess) %>%
  setNames(col_names)
dat %>% head


# there are other functions on purrr package that can do this simpler
dat <- x %>%
  transpose() %>%
  map( ~ parse_guess(unlist(.))) %>%
  setNames(col_names) %>%
  as.data.frame()
dat %>% head

#### BUT there is an option on str_split that force to return a matrix instead of a list
x <- str(lines, ",",simplify = TRUE)
col_names <- x[1,]
x <- x[-1,]
x %>% as_data_frame() %>%
  setNames(col_names) %>%
  mutate_all(parse_guess)

#######################  Recoding #######################

library(dslabs)
library(ggplot2)
data("gapminder")

gapminder %>%
  filter (region == 'Caribbean') %>%
  ggplot(aes(year, life_expectancy, color=country)) +
  geom_line()


# changing the country names to set max length 12 char
gapminder %>% filter(region == "Caribbean") %>%
  mutate(country = recode(country,
                          'Antigua and Barbuda' = "Barbuda",
                          'Dominican Republic' = "DR",
                          'St. Vincent and the Grenadines' = "St. Vincient",
                          'Trinidad and Tobago' = "Trinidad")) %>%
  ggplot(aes(year, life_expectancy, color=country)) +
  geom_line()

# similar functions from tidyverse package
# recode_factor() and fct_recoder()