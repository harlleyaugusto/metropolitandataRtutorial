### If Else ####
####### Simple condition #######
x <- 10

if (x > 0 ) {
  print('This is Positive number') 
}

## output: [1] "This is Positive number"
### ----------------
x <- c(2, 1, 3)
if(sqrt(9) > 2) {
  mean(x)
} else {
  sum(x)
}  ## [1] 2

if(sqrt(9) > 4) {mean(x)} else {sum(x)}  ##[1] 6


## ---------------------
x <-  10
if (x > 0) {
  print('This is a positive number') 
}
####### Multiple condition #########

x <- -5
if(x > 0){
  print("Non-negative number")
} else {
  print("Negative number")
}

###### Multiple condition ########

k <- 110
if(k > 100){
  print('Greater than 100')
} else if (k < 100){
  print('Less than 100')
} else {
  print ('Equal to 100')
}

## ifelse
x <- 1 : 10
ifelse(x<5 | x>8,x,0)

### 2eme example
x <- c(2, 1, 3, 6, 8, 1)
y <- ifelse(x > 4, x, sum(x)) ### ifelse (test, true value, false value)
y

#### 

a <- c(5, 7, 2, 9)

ifelse(a / 2 == 0, "even", "odd")

#######  Loops For --------------------

for (i in 1:100) {
  print(i)
}

#####
i <- 1
for (i in seq(5, 10, by = 2)) {
  print(i)
}

i

#### 
##  Repetitive execution: for loops, repeat and while
## Remember that you can often avoid looping by using 
#vectorized operations. For example, suppose that 
##we want to form row sums for a matrix.

a <- matrix(10:15, 2, 3)
a
nr<-nrow(a) # number of rows is a
nr ## [1] 2
sumr<-numeric(nr) # initialize a vector of length nr
sumr # [1] 0 0
for (i in 1:nr) {
  sumr[i] <- sum(a[i,])
}

sumr # [1] 36 39
## This is equivalent to:
rowSums(a) # [1] 36 39


## ------- Another looping structure is repeat, ------
x <- 7
repeat {print(x); x <- x+ 2; if(x > 10) {break} }
# [1] 7
##[1] 9

## -------- while ----------
# The while structure evaluates a expression as long as a stated 
#condition is TRUE
x <- 0
while(x < 10) {
  print(x); 
  x <- x + 5
}

### --------------Loop functions --------------
## lapply
## To apply the mean() function to all elements of a list.
## The Normal Distribution: Density, distribution function, 
#quantile function and random generation for the normal distribution 
#with mean equal to mean and standard deviation equal to sd.

x <- list(a = 1:5, b = 10:20)
lapply(x, mean)
#$a
#
#$b
#[1] 

# Functions

x <- 1:15
mean(x) #[1] 8
median(x) #[1] 8
var(x) #[1] 20
sd(x) #[1] 4.472136
range(x) # [1]  1 15

#User-defined functions

f <- function(num){
  for(i in seq_len(num)){
    print("Hello, world!")
  }
}
f(3) 

#[1] "Hello, world!"
#[1] "Hello, world!"
#[1] "Hello, world!"

f <- function(num){
  hello <- "Hello, world!"
  for(i in seq_len(num)){
    print(hello)
  }
  chars <- nchar(hello) * num
  chars
}
f(3)

f <- function(num = 1){
  hello <- "Hello, world!"
  for(i in seq_len(num)){
    print(hello)
  }
  chars <- nchar(hello) * num
  chars
}
f()
f(2)

g <- function(n, mean = 0, sd = 1){
  print(n)
  print(mean)
  print(sd)
  n*mean*sd
}

mydata <- g(100, 2, 1)

mysum <- function(vec, neg = TRUE){
  print(vec)
  print(neg)
}
v <- c(1,2,3,4)
mysum(v)
mysum(vec = v)
mysum(vec = v, neg = FALSE)

# The ... argument: the...argument is necessary when the number 
#of argumentspassed to the function cannot be known in advance

i01 <- function(...){
  x <- list(...)
  x
}

y <- i01(1,2,3)
y
x <- i01(1,2,3,4,5)
x

#Loop functions

## 2eme exemple
x <- 1:4 
lapply(x, runif)

x <- list(a = 1:4, b = 10:20, c = 30:40, d = 50:60)
lapply(x, mean)
#$a
#[1] 2.5

#$b
#[1] 0.2589507

#$c
#[1] 1.174567

#$d
#[1] 4.939826

### sapply


# Notice that \texttt{lapply} returns a list, but each 
#element of the list has length 1.  
sapply(x, mean) 
#a         b         c         d 
#2.5000000 0.2589507 1.1745667 4.9398260 

## the apply function
a <- matrix(1:10, nrow = 2, ncol = 5)
apply(a, 1, sum) # Apply sum to rows
# [1] 36 39
apply(a, 2, mean) # # Apply mean to columns
# [1] 10.5 12.5 14.5

##  The result is equivalent to:
rowSums(a) # form row sums
## [1] 36 39

colMeans(a) # # Apply mean to columns
# [1] 10.5 12.5 14.5