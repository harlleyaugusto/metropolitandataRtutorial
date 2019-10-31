### Package

#install.packages("name_package")
#library("name_package")

### Tibbles
#install.packages("tidyverse")
library(tidyverse)

a <- tibble(
  x = 1:5,
  y = 1,
  z = x ^ 2 + y
)
a
# A tibble: 5 x 3
#x     y     z
#<int> <dbl> <dbl>
#  1     1     1     2
#2     2     1     5
#3     3     1    10
#4     4     1    17
#5     5     1    26

# iris Data.frame
View(iris)

#You might want to coerce a data frame to a tibble.  You can do that withastibble():
as_tibble(iris)

#Printing
a <- tibble(
  #now = the current time
  #today = the current data
  #runif = uniform distribution
  
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d =  runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)
a

#You can explicitlyprint()the data frame and control:
# the number of rows (n)
# the width of the display.  width = Inf will display all columns
print(a, n = 40, width = Inf)

#Some older functions don’t work with tibbles.  
#If you encounter one of thesefunctions, use:as.data.frame()

b <- as.data.frame(a)
class(b) #[1] "data.frame"

### Data import
# Let's create a inputfile 
#x y z
#10 2 3
#4 12 6
#13 14 65

# You have to update the path of the input file of the following command. 
# You have to put the file path stored your computer
data1 <- read.table("data/inputfile", header = TRUE, sep =" ")

print(data1)
class(data1)
str(data1)

#CSV file example tree.csv 
#"Index", "Girth (in)", "Height (ft)", "Volume(ft^3)"
#1,   8.3,     70,   10.3
#2,   8.6,     65,   10.3
#3,   8.8,     63,   10.2
#4,  10.5,     72,   16.4

# You have to update the path of the input file of the following command. 
# You have to put the file path stored your computer
tree <- read_csv("data/trees.csv")

#CSV file example tree2.csv 
#The first line of metadata
#The second line of metadata
#"Index", "Girth (in)", "Height (ft)", "Volume(ft^3)"
#1,   8.3,     70,   10.3
#2,   8.6,     65,   10.3
#3,   8.8,     63,   10.2
#4,  10.5,     72,   16.4

# You have to update the path of the input file of the following command. 
# You have to put the file path stored your computer
tree2 <- read_csv("data/trees2.csv", skip = 2)

#CSV file example tree2.csv 
##The first line of metadata
#"Index", "Girth (in)", "Height (ft)", "Volume(ft^3)"
#1,   8.3,     70,   10.3
#2,   8.6,     65,   10.3
#3,   8.8,     63,   10.2
#4,  10.5,     72,   16.4

# You have to update the path of the input file of the following command. 
# You have to put the file path stored your computer
tree3 <- read_csv("data/trees3.csv",comment = "#")

tree4 <- read_csv("data/trees4.csv", comment = "#", col_names = FALSE)

# Exporting data

# You have to update the path of the input file of the following command. 
# You have to put the file path stored your computer
write.csv(tree, file ="data/treesOut.csv")


### https://r4ds.had.co.nz/tidy-data.html
## Tidy Data

table1 <- tibble (
  country = c('Afghanistan', 'Afghanistan', 'Brazil', 'Brazil', 'China', 'China'),
  year = c(1999, 2000, 1999, 2000, 1999, 2000),
  cases = c(745, 2666, 37737, 80488, 212258, 213766),
  population = c(19987071, 20595360, 172006362, 174504898, 1272915272, 1280428583)

)
table1
# Compute rate per 10,000
mutate(table1, rate = cases / population * 10000)


table4a <- tibble (
  country = c('Afghanistan', 'Brazil', 'China'),
  `1999` = c(745, 37737, 212258),
  `2000` = c(2666, 80488, 213766)
  
)

# Spread across two tibbles
table4a  # cases
#> # A tibble: 3 x 3
#>   country     `1999` `2000`
#> * <chr>        <int>  <int>
#> 1 Afghanistan    745   2666
#> 2 Brazil       37737  80488
#> 3 China       212258 213766


table4b <- tibble (
  country = c('Afghanistan', 'Brazil', 'China'),
  `1999` = c(19987071, 172006362, 1272915272),
  `2000` = c(20595360, 174504898, 1280428583)
  
)
table4b  # population
#> # A tibble: 3 x 3
#>   country         `1999`     `2000`
#> * <chr>            <int>      <int>
#> 1 Afghanistan   19987071   20595360
#> 2 Brazil       172006362  174504898
#> 3 China       1272915272 1280428583

# Together those parameters generate the call to gather():
gather(table4a, `1999`, `2000`, key = "year", value = "cases")

## the same for the variable population
gather(table4b, `1999`, `2000`, key = "year", value = "population")

## To combine the tidied versions of table4a and table4b into a single tibble,
#we need to use dplyr::left_join(), which you’ll learn about in relational data.
tidy4a <- gather(table4a, `1999`, `2000`, key = "year", value = "cases")
tidy4b <- gather(table4b, `1999`, `2000`, key = "year", value = "population")

left_join(tidy4a, tidy4b)

#> # A tibble: 6 x 4
#>   country      year  cases population
#>   <chr>       <int>  <int>      <int>
#> 1 Afghanistan  1999    745   19987071
#> 2 Afghanistan  2000   2666   20595360
#> 3 Brazil       1999  37737  172006362
#> 4 Brazil       2000  80488  174504898
#> 5 China        1999 212258 1272915272
#> 6 China        2000 213766 1280428583

table2 <- tibble(
  country = c('Afghanistan', 'Afghanistan', 'Afghanistan', 'Afghanistan', 'Brazil', 'Brazil'),
  year = c(1999, 1999, 2000, 2000, 1999, 1999),
  type = c('cases', 'population', 'cases', 'population', 'cases', 'population'),
  count = c(745, 19987071, 2666, 20595360, 37737, 172006362)

)
table2

#> # A tibble: 12 x 4
#>   country      year type           count
#>   <chr>       <int> <chr>          <int>
#> 1 Afghanistan  1999 cases            745
#> 2 Afghanistan  1999 population  19987071
#> 3 Afghanistan  2000 cases           2666
#> 4 Afghanistan  2000 population  20595360
#> 5 Brazil       1999 cases          37737
#> 6 Brazil       1999 population 172006362
#> # ... with 6 more rows


### ---------- Spreading
spread(table2, key = type, value = count)

table3 <- tibble(
  country = c('Afghanistan', 'Afghanistan', 'Brazil', 'Brazil', 'China', 'China'),
  year = c(1999, 2000, 1999, 2000, 1999, 2000),
  rate = c('745/19987071', '2666/20595360', '37737/172006362', '80488/174504898', '212258/1272915272', '213766/1280428583')
)
table3
#> # A tibble: 6 x 3
#>   country      year rate
#> * <chr>       <int> <chr>
#> 1 Afghanistan  1999 745/19987071
#> 2 Afghanistan  2000 2666/20595360
#> 3 Brazil       1999 37737/172006362
#> 4 Brazil       2000 80488/174504898
#> 5 China        1999 212258/1272915272
#> 6 China        2000 213766/1280428583

### ------- Separate ----------
separate(table3, rate, into = c("cases", "population"))


### --------------- Uniting
# We can use unite() to rejoin the century and year columns that we created in the
#last example. That data is saved as tidyr::table5. unite() takes
#a data frame, the name of the new variable to create, and a set of columns to combine,
#Create tibble called table6
table6 <- tibble(
  country = c('Afghanistan', 'Afghanistan', 'Brazil', 'Brazil', 'China', 'China'),
  century = c(19, 20, 19, 20, 19, 20),
  year = c(99, 0, 99, 0, 99, 0),
  rate = c('745/19987071', '2666/20595360', '37737/172006362', '80488/174504898', '212258/1272915272', '213766/1280428583')
)
table6
unite(table6, new, century, year)
unite(table6, new, century, year, sep = " ")


##### ----- missing values --------
stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)
stocks
spread(stocks, year, return)

### Because these explicit missing values may not be important in other representations of
#the data, you can set na.rm = TRUE in gather() to turn explicit missing values implicit:
spread(stocks, year, return)

stocks %>%
  spread(year, return) %>%
  gather(year, return, `2015`:`2016`, na.rm = TRUE)

## Another important tool for making missing values explicit in tidy data is complete():
complete(stocks, year, qtr)

### You can fill in these missing values with fill(). It takes a set of
#columns where you want missing values to be replaced by the most recent non-missing value
treatment <- tribble(
  ~ person,           ~ treatment, ~response,
  "Derrick Whitmore", 1,           7,
  NA,                 2,           10,
  NA,                 3,           9,
  "Katherine Burke",  1,           4
)
treatment
fill(treatment, person)


########
##------------- Relational data
#install.packages("nycflights13")
library(nycflights13)
#install.pa ckages("dplyr")
library(dplyr)
planes

weather

#install.packages("tidyverse")
#library(tidyverse)
## ---- Tibbles in the package
flights

## ------ Keys ------
planes %>%
  count( tailnum) %>%
  filter(n > 1)


weather %>%
  count(year, month, day, hour, origin) %>%
  filter(n > 1)

### -------- Join ------
flights

# ---
# -- select columns from flights to create flights2
flights2 <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)
flights2



# -- select all the columns from flights2 excluding origin, dest
# then join the tibble airlines to flights2 by the common column carrier
flights2 %>%
  select(-origin, -dest)  %>%
  left_join(airlines, by = "carrier")
## The result of joining airlines to flights2 is an additional variable: name

flights2 %>%
  select(-origin, -dest) %>%
  mutate(name = airlines$name[match(carrier, airlines$carrier)])

# Understanding join
# let's create two tibbles x and y

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
x
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)
y

## Inner join
# An inner join matches pairs of observations whenever their keys are equal.
# The output of an inner join is a new data frame that contains the key,
#the x values, and the y values.
x %>%
  inner_join(y, by = "key")
