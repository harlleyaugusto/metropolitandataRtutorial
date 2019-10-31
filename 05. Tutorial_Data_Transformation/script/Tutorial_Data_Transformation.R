library(tidyverse)
library(dplyr)
library(nycflights13)

#PIPES

# x %>% f is equivalent to f(x)
pi %>% sin 
sin(pi)

# x %>% f(y) is equivalent to f(x,y)
"Hello" %>% cat(", world!")
cat("Hello", ", world!")

#x %>% f %>% g %>% h is equivalent to h(g(f(x)))
x <- sin(pi)
cos(x)

cos(sin(pi))

pi %>% sin %>% cos %>% tan

#Using the diamonds dataset, calculate the average price for each cut of "I" colored diamonds
diamonds

#Intermediate steps
diamonds_1 <- filter(diamonds, color == "I")
diamonds_2 <- group_by(diamonds_1, cut)
diamonds_3 <- summarize(diamonds_2, price = mean(price))
diamonds_3

#Pipe
diamonds %>%
  filter(color == "I") %>%
  group_by(cut) %>%
  summarize(price = mean(price))


#SELECT
flights

# Select columns by name
select(flights, year, month, day)
## the same as

flights %>%
  select(year, month, day)

# Select all columns except those from year to day (inclusive)
select(flights, -(year:day))

# We can also apply some of the special functions within select()
## we can select all variables that start with ‘d’:

flights %>%
  select(starts_with("d"))

## we select all variables that contain "dep":
flights %>%
  select(contains("dep"))


#FILTER

## to subset observations based on their values: filter()
filter(flights, month == 1, day == 1)

# to save the result in df
df <- filter(flights, month == 1, day == 1)

df <- flights %>%
  filter(month == 1, day == 1)

## finds all flights that departed in November or December:
filter(flights, month == 11 | month == 12)

## additional subsetting functions
# remove duplicate rows
flights %>%
  distinct()

# select rows by position
flights %>%
  slice(3:5)

#GROUP_BY

# group observations by year, month and day
flights %>%
  group_by(year, month, day)

df1 <- flights %>%
  group_by(year, month, day)

ungroup(flights)

# SUMMARISE

flights %>% summarise(Min = min(distance),
                      Max = max(distance),
                      Mean = mean(distance),
                      SD = sd(distance),
                      N = n())


flights %>% group_by(carrier) %>%
  summarize(Min = min(distance),
            Max = max(distance),
            Mean = mean(distance),
            SD = sd(distance),
            N = n())

flights
airlines

flights %>% group_by(carrier) %>%
  summarise(Min = min(distance), 
            Max = max(distance),
            Mean = mean(distance),
            SD = sd(distance),
            N = n()) %>%
  inner_join(airlines, by = "carrier")  


#ARRANGE 

## arrange() works similarly to filter() except that instead of 
## selecting rows, it changes their order.
arrange(flights, year, month, day)

# Use desc() to re-order by a column in descending order:
arrange(flights, desc(dep_delay))


#MUTATE


## add new variables with mutate()
# 1- create a dataframe
flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
flights_sml

## 2- mutate()
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)


mutate(flights_sml,
       gain = dep_delay - arr_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
)

# If you only want to keep the new variables, use transmute():
transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)
