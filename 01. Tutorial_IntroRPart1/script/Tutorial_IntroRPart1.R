#Coding basics  
# R as a calculator
1 / 200 * 13
59 + 14 * 13
20 / 4 / 5

#Precende of operator 
(59 + 14) * 13

#Variable 
x <- 4 * 4
x
this_is_a_long_name <- 2.5
this_is_a_long_name
#Relational operator

x <- 10
y <- 5

x <= y #[1] FALSE
x >= y #[1] TRUE 
x == y #[1] FALSE
x != y # [1] TRUE

####### R Relational Operators ########
x <- 5
y <- 16

x < y #[1] TRUE
x > y #[1] FALSE
x <= 5 #[1] TRUE
y >= 20 #[1] FALSE
y == 16 #[1] TRUE
x != 5 #[1] FALSE

############# R Logical Operators ###############
x <- c(TRUE, FALSE, 0,6)
y <- c(FALSE, TRUE, FALSE, TRUE)

!x #[1] FALSE  TRUE  TRUE FALSE

x & y #[1] FALSE FALSE FALSE  TRUE

x && y #[1] FALSE

x | y #[1]  TRUE  TRUE FALSE  TRUE

x || y #[1] TRUE


## Using logical conditions to select subsets
x <- c(3, 5, 1, 2, 7, 6, 4)
x

(x>2) & (x<=6) # is x greater than 2 and less than or equal to 6
## [1]  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE

(x<2) | (x>5) # is x less than 2 or greater than 5
### [1] FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE

!(x>3) #not [x greater than 3]
# [1]  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE

# Using logical conditions to select subsets
y <- c(5, 3, 7, 2, 9)

#suppose that we want to extract the values of the vector 
#y which are greater than 5 (that is, the numbers 7 and 9). 
#To understand the details, we will divide the code the into smaller 
#steps. First, we create a logical vector ind

ind<- y> 5 #isygreaterthan5
ind ## [1] FALSE FALSE  TRUE FALSE  TRUE
y[ind] ## [1] 7 9
y[y > 5] ## [1] 7 9

#Basic data types

a <- 10
b <- 1.13
a <- "Hello"
a <- 1.3

#Exercise
x1 <- 5
x2 <- 1

y1 <- 1
y2 <- -2

d = sqrt((x2 - x1)^2 + (y2 - y1)^2)

#Built-in functions

sqrt(25) #[1] 5
sin(pi/2) #sin(pi/2)
help(sqrt)
seq(1, 10) #[1]  1  2  3  4  5  6  7  8  9 10
1:10 #[1]  1  2  3  4  5  6  7  8  9 10

#Data types

#Vector

#Creating a vector
x <- c(1, 5, 4, 9, 0)
x <- c(FALSE, TRUE, FALSE)
x <- c("a", "b", "c", "d", "e")
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)


#Length of a vector
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
length(x) #[1] 5

#Indexing vector
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
x[1] #[1] 10.4
x[c(2,4)] #[1] 5.6 6.4
x[-1] #[1]  5.6  3.1  6.4 21.7
x[c(-1,-3)] #[1]  5.6  6.4 21.7
x[c(2.4, 3.54)] #[1] 5.6 3.1

#Using logical vector as index
x <- c(10,20,30,40,50,60)
x[c(TRUE, FALSE, FALSE, TRUE, TRUE, TRUE)] #[1] 10 40 50 60
x[x<20] #[1] 10
x[x>20] #[1] 30 40 50 60
x[2:4] #[1] 20 30 40

#Combining vectors

n = c(2, 3, 5)
s = c("aa", "bb", "cc", "dd", "ee")
c(n, s) #[1] "2"  "3"  "5"  "aa" "bb" "cc" "dd" "ee"

#How to modify a vector
x <- c(10,20,30,40,50,60)
x[1] <- 80
x[2] <- 0
x[x<30] <- 50
x

#Vector arithmetics
a <- c(1, 3, 5, 7)
b <- c(1, 2, 4, 8)

5 * a #[1]  5 15 25 35
a + b #[1]  2  5  9 15
a - b #[1]  0  1  1 -1
a * b #[1]  1  6 20 56
a / b #[1] 1.000 1.500 1.250 0.875

#Recycling Rule
u <- c(10, 20, 30)
v <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
u+v #[1] 11 22 33 14 25 36 17 28 39

#Named vector members
v <- c("Mary", "Jane")
names(v) = c("First", "Last")
v #First   Last 
  #"Mary" "Jane"

v <- c(First = "Mary", Last = "Jane")
v["First"]  #First 
            "Mary" 
v["Last"] #Last 
          "Jane"

#Examples Explicit coercion
x <- 0:6
class(x) #[1] "integer"
as.numeric(x) #[1] 0 1 2 3 4 5 6
as.logical(x) #[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
as.character(x) #[1] "0" "1" "2" "3" "4" "5" "6"

x <- c("a", "b", "c")

as.numeric(x) #[1] NA NA NA
as.logical(x) #[1] NA NA NA
is.numeric(x) #[1] FALSE


### Mixing objects --> Implicit coercion
y <- c(1.7, "a")
y
## output: [1] "1.7" "a"  

y<- c(TRUE, 2)
y
## output: [1] 1 2

y<- c("a", TRUE)
y
## Output: [1] "a"    "TRUE"

## Explicit Coercion

x<- 0:6
class(x) ## [1] "integer"

as.numeric(x) ## [1] 0 1 2 3 4 5 6
as.logical(x) ## [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
as.character(x) ## [1] "0" "1" "2" "3" "4" "5" "6"

## Nonsensical coercion results in NAs
x<- c("a", "b", "c")
as.numeric(x) ## [1] NA NA NA
as.logical(x) ## [1] NA NA NA
as.complex(x) ## [1] NA NA NA



## Missing values
sqrt(-4) ### [1] NaN
# Warning message:
# In sqrt(-4) : NaNs produced

## Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)
##1- Return a logical vector indicating which elements are NA
is.na(x) # [1] FALSE FALSE  TRUE FALSE FALSE

## 2- returning a logical vector indicating which elements are NaN
is.nan(x) ## [1] FALSE FALSE FALSE FALSE FALSE

##Now let’s create a vector with both NA and NaN values
x <- c(1, 2, NaN, NA, 4) 
is.na(x) ## [1] FALSE FALSE  TRUE  TRUE FALSE

is.nan(x) ## [1] FALSE FALSE  TRUE FALSE FALSE. Why in is.na(x) NaN == TRUE but with is.
## is.nan(x) both NA and NaN areturn TRUE
### Infinity
1 / 0  ## [1] Inf

## NaN: Not a Number
0 / 0 ## [1] NaN
-5 / 0 ## [1] -Inf

#Factors: Factors are used to work with categorical variables

#Creating factors
countries <- c("Brazil", "Netherlands", "Tunisia","Spain", "Brazil", "Tunisia", "Netherlands")
y1 <- factor(countries)

## -----------------------------------------------------------------------
## ------------------------------------------------------------------------
## Matrices
m <- matrix(nrow = 2, ncol = 3)
m  ##    [,1] [,2] [,3]
# [1,]   NA   NA   NA
# [2,]   NA   NA   NA
##  I've got a matrix m, which has 
#two rows and three columns and it's filled in the matrix column wise. 

dim(m) # [1] 2 3
### add names??!!!

# create a matrix by creating the dimension attribute on a vector.
## 1- I can take, I can create a vector that's a sequence 1 to 10.
m <- matrix(1:6, nrow = 2, ncol = 3) 
m
#       [,1] [,2] [,3]
#[1,]    1    3    5
#[2,]    2    4    6


### Another way to create a matrix, and this is a common way, is by binding 
#columns or binding rows.  the functions cbind and rbind.
#  So for example, suppose I have the two objects x, which is sequenced from 1 
#to 3 and y, which is a sequence from 10 to 12. If I cbind those two objects, 
#then I'll get a matrix 
## object x
x<- 1:3
## Object y
y <- 10:12
cbind(x,y)
## output:  x  y
# [1,] 1 10
# [2,] 2 11
# [3,] 3 12

rbind(x, y)
## output: [,1] [,2] [,3]
# x    1    2    3
# y   10   11   12

## cbind and rbind is another way of creating matrix

## how to get access to elements in the matrix?
A = matrix(
  c(2, 4, 3, 1, 5, 7), # the data elements
  nrow=2, # number of rows
  ncol=3, # number of columns
  byrow = TRUE) # fill matrix by rows
A # print the matrix
#      [,1] [,2] [,3]
#[1,]    2    4    3
#[2,]    1    5    7

A[2, 3] # element at 2nd row, 3rd column
## [1] 7
A[2, ]# the 2nd row
## [1] 1 5 7

A[ ,3]# the 3rd column
## [1] 3 7

# We can extract more than one rows or columns at a time
A[ ,c(1,3)] # the 1st and 3rd columns

## We assign names to the rows and columns of the matrix.
colnames(A)
colnames(A) <- c('a1', 'a2', 'a3')
colnames(A)
#######------- Matrix manipulation ---------
## Transpose
t(A) ## col becomes rows and vis verça

## Combining matrices
# create Matrix B
B = matrix(
  c(2, 4, 3, 1, 5, 7),
  nrow = 3,
  ncol = 2
)

# create Matrix B
C = matrix(
  c(7, 4, 2),
  nrow = 3,
  ncol = 1
)

### We can combine the columns of B and C withcbind
cbind(B, C) ## 3 3

# Similarly, we can combine the rows of two 
#matrices if they have thesame number of columns with therbindfunction.
D <-  matrix(
  c(6, 2),
  nrow = 1,
  ncol = 2
)
dim(B)
dim(C)
dim(D)
rbind(B, D) ## 4 2

# Matrix arithmetics
a <- matrix(10:15, nrow = 2, ncol = 3)
class(a) # [1] "matrix"
typeof(a) # [1] "integer"

b <- matrix(10:15, nrow = 2, ncol = 3, byrow = TRUE)
dim(b) # [1] 2 3
dim(a) # [1] 2 3

a + b
a * b

## functions designed to work on a matrix
dim(a) # dimension
t(a) # transpose
#solve(a)
#eigen(a)
rowMeans(a) # form row means
rowSums(a) # form row sums
colMeans(a) # form column means
colSums(a) # form column sums
ncol(a) # [1] 3
colnames(a) ## NULL

## ------------------------------------------------------------------------
#### ----------- Arrays -----------
# create an array with dimensions 3 x 4 x 2
a <- array(data = 1:24, dim = c(3, 4, 2))
a ## c rows and 4 columns for 2 arrays


  ### ---------------------------------------------------------------
## ---------- Lists ----------
x <- list(1, "a", TRUE, 1+4i)
x  
## [[1]]  [1] 1   [[2]} [1] "a"  [[3]] [1] TRUE [[4]] [1] 1+4i
## elements of a list will have double brackets around them BUT elements of other vectors just have the single 
## brackets ---> That's a one way to separate a list from other types of vectors

########## Lists part II
# http://www.r-tutor.com/r-introduction/list
n <-  c(2, 3, 5) 
s <-  c("aa", "bb", "cc", "dd", "ee") 
b <-  c(TRUE, FALSE, TRUE, FALSE, FALSE) 
x <-  list(n, s, b, 3)   # x contains copies of n, s, b
x
## List slicing
x[2] ## [[1]]
## [1] "aa" "bb" "cc" "dd" "ee"

##We can retrieve a slice with multiple members.  
#Here a slice containing the second and fourth members of x.
x[c(2, 4)] ##[[1]]
# [1] "aa" "bb" "cc" "dd" "ee"
#[[2]]
#[1] 3

# We can modify its content directly:
x[[2]][1] = "ta"
x[[2]] ## [1] "ta" "bb" "cc" "dd" "ee"
s ## [1] "aa" "bb" "cc" "dd" "ee"

Lst <- list(name = "Fred", wife = "Mary", no.children =3, child.ages= c(4, 7, 9))
## The functionlength()gives the number of components in the list
length(Lst) # [1] 4
Lst$name # [1] "Fred"
Lst[[1]] # [1] "Fred"
Lst$child.ages[1] ## [1] 4
Lst[[4]][1] ## [1] 4

## ------------------------------------------------------------------------
# ------------------- data frame -------------------
# create the data frame
BMI <- data.frame (
  gender = c("Male", "Male", "Female"),
  height = c(152, 171.5, 165),
  weight = c(81, 93, 78),
  age = c(42, 38, 26)
)

print(BMI)

## built in data frame
mtcars 
# Here is the cell value from the first row, second column:
mtcars[1, 2] ## [1] 6
mtcars["Mazda RX4", "cyl"] # [1] 6
nrow(mtcars)    # number of data rows 
ncol(mtcars)    # number of columns 
# The number of data rows in the data frame
nrow(mtcars) ## [1] 32
# The number of columns of a data frame
ncol(mtcars) ## [1] 11
## to retrieve the ninth column vector of the built-in data set mtcars
mtcars[[9]] ## the column 'am'
mtcars$am ## We can also retrieve with the ``\$'' operator

# We retrieve a data frame column slice with the single square bracket "[]" operator.
## Numeric Indexing
# The following is a slice containing the first column of the built-in data set mtcars.
mtcars[1]

# Name Indexing: 1- We can retrieve the same column slice by its name
mtcars["mpg"]

## 2- To retrieve a data frame slice with the two columns mpg and hp:
mtcars[c("mpg", "hp")]

## We retrieve rows from a data frame with the single square bracket operator,
mtcars[24,] 

## Data Frame Row Slice
## To retrieve more than one rows, we use a numeric index vector.
mtcars[c(3, 24),] 
## We can retrieve a row by its name.
mtcars["Camaro Z28",] 


#### --------- Subset rows of a data.frame --------
# Let’s select the rows of mtcars where the cyl column is greater than 4 
mtcars [mtcars$cyl > 4,]
subset(mtcars, cyl > 4)

## now Let’s select the rows of the data.frame mtcars where the cyl column is greater than 4 or
#is equal to 2. Without any index for columns
mtcars [mtcars$cyl > 6 | mtcars$cyl == 8, ]
subset(mtcars, cyl> 6 | cyl == 8)
## We can subset both rows and colums at the same time:
mtcars [mtcars$cyl > 6 | mtcars$cyl == 8, c("hp", "drat", "wt")]
subset(mtcars, cyl> 6 | cyl == 8, select = hp:wt)
## ------------------------------------------------------------------------

