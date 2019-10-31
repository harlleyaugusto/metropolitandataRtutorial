library(tidyverse)

mpg
# displ, a car’s engine size
# hwy, a car’s fuel efficiency on the highway

?mpg

#Do cars with big engines use more fuel than cars with small engines?
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

## same result
g <- ggplot(data = mpg)
g + geom_point(mapping = aes(x = displ, y = hwy))

#Cars with big engines use more fuel

#You can map the aesthetics in your plot to the variables in your dataset:
#The \texttt{class} variable of the \texttt{mpg} dataset classifies cars into groups 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#We can also have mapped class to the size aesthetic in the same way:
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = class))

#We can also map \texttt{class} to the alpha aesthetic (transparency) in the same way
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#We can also map \texttt{class} to the shape aesthetic in the same way:
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#We can also map \texttt{class} to the shape aesthetic with more than 6 shapes
factor_class <- factor(mpg$class)
level_class <- nlevels(factor_class)

ggplot(data = mpg) +  
  scale_shape_manual(values=1:level_class) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class)) 

#You can also set the aesthetic properties of your geom manually
#Aesthetic name goes outside ofaes()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#Facets

library(ggplot2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

## To facet your plot on the combination of two variables, add facet_grid()
# This time the formula should contain two variable names separated by a ~
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)


## Geometric objects
#  The plot on the left uses the point geom, and the plot on the right
#uses the smooth geom, a smooth line fitted to the data.
# left ## the point geom
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# right ## the smooth geom
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

## geom_smooth() will draw a different line, with a different 
#linetype, for each unique value of the variable that you map 
#to linetype.
g <- ggplot(data = mpg) 
g + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
## Here geom_smooth() separates the cars into three lines based on their 
#drv value, which describes a car’s drivetrain
#One line describes all of the points with a 4 value, 
#one line describes all of the points with an f value, 
#and one line describes all of the points with an r value. 
#Here, 4 stands for four-wheel drive, f for front-wheel drive, 
#and r for rear-wheel drive.

#ggsave() is a convenient function for saving a plot.
ggsave("data/g.png")
ggsave("data/g.pdf")

# Exercice: Find the difference between the plots
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )


### To display multiple geoms in the same plot, add multiple geom functions
#to ggplot():

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


## If you place mappings in a geom function, ggplot2 will treat them as local mappings for the layer.
## to extend or overwrite the global mappings for that layer only.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

## Bar charts seem simple,
#but they are interesting because they reveal something subtle about plots.

# dataset
diamonds 
#The diamonds dataset comes in ggplot2 and contains information about ~54,000 diamonds, 
#including the price, carat, color, clarity, and cut of each diamond.
#grouped by cut
#x-axis, the chart displays cut, a variable from diamonds
#the y-axis, it displays count
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

## Output: The chart shows that more
#diamonds are available with high quality cuts than with low quality cuts.
##  the count
table(diamonds$cut)

# similarly you can use stat_count() instead of geom_bar
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))


#Position adjustments

#You can color a bar chart using either the \texttt{color} aesthetic or \texttt{fill}
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, color = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

# Note what happens if you map the fill aesthetic to another variable, like \texttt{clarity}\\
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))


#\texttt{position = "identity"}: will place each object exactly 
#where it falls in the context of the graph
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")


#works like stacking, but makes each set of stacked bars the same height
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")


#places overlapping objects directly beside one another
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#Scatterplots
#The values of hwy and displ are rounded so the points appear on a grid and 
#many points overlap each other.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

#You can avoid this gridding by setting the position adjustment to “jitter”
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

# Boxplot example
ggplot(data = mpg, aes(x = class, y = hwy, color = class)) + 
  geom_boxplot() +
  scale_x_discrete(name = "Car classes") + # x legend
  scale_y_continuous(name = "Highway miles per gallon") + # y legend
  ggtitle("Boxplot of class by hwy") + #title
  theme(plot.title = element_text(hjust = 0.5)) #title center

## -------------`EDA` ------------------
## To examine the distribution of a `categorical variable', 
#use a bar chart:
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
## The height of the bars displays how many observations occurred with each x value.
# the main value is :
diamonds %>% 
  count(cut)

## Pie chart: Create the pie chart of the count of observations 
#in each value of attribute cut :
ggplot(data = diamonds, mapping = aes(x = cut, y=..prop.., fill = cut)) + 
  geom_bar(width = 1) + 
  coord_polar()

### Continuous variable
# You can compute this by
diamonds %>% 
  count(cut_width(carat, 0.5))

## To examine the distribution of a continuous variable, use a histogram:
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)
# A histogram divides the x-axis into equally spaced bins and then uses 
#the height of a bar to display the number of observations that fall in each bin.
## histogram + Density plots

ggplot(diamonds, aes(x =price)) + geom_density()

ggplot(diamonds, aes(x=carat)) + 
  geom_density(col="blue") + 
  geom_histogram(aes(y=..density..), colour="black", fill=NA)


## to overlay multiple histograms in the same plot
# geom_freqpoly()
ggplot(data = diamonds, mapping = aes(x = carat, colour = cut)) +
  geom_freqpoly(binwidth = 0.5)

### Missing values
#ggplot(data = diamonds, mapping = aes(x = x, y = y)) + 
#  geom_point(na.rm = TRUE)


### -------- Covariation
#variation describes the behavior within a variable
### covariation describes the behavior between variables.
#### It is the tendency of two or more variables to vary together in a related way.
# to visualise the relationship between two or more variables


# 1/ let's the y-axis from count to density
#density plot
ggplot(diamonds, aes(x = price)) + 
  geom_density()
## to overlay multiple density plots in the same plot
ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) + 
  geom_freqpoly(mapping = aes(colour = cut), binwidth = 500)


# 2/ Let’s take a look at the distribution of price 
#by cut using geom_boxplot():
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot() 
#coord_flip() ## the quantitative variable is horizontal


# Violin plots
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) + 
  geom_violin()

## Boxplot + Violin plots
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +  
  geom_violin() + 
  geom_boxplot()

#------- Two categorical variables -----
#To visualise the covariation between categorical variables, you’ll need 
#to count the number of observations for each combination.
#copy ///
ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))
### The size of each circle in the plot displays how many observations occurred
###at each combination of values.

##barplot for two categorical variables
ggplot(diamonds, aes(x = cut, fill = color)) +
  geom_bar()

# Then visualise with geom_tile() and the fill aesthetic:
diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = cut, y = color)) +
  geom_tile(mapping = aes(fill = n))


##--------------Two continuous variables
## scatterplots
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point() 
##ylab('The price')

#geom_bin2d() and geom_hex() to bin in two dimensions.
#geom_bin2d() and geom_hex() divide the coordinate 
#plane into 2d bins and then use a fill 
#color to display how many points fall into each bin.

### geom_bin2d: geom_bin2d() creates rectangular bins. 
ggplot(data = diamonds) +
  geom_bin2d(mapping = aes(x = carat, y = price))

### geom_hex: geom_hex() creates hexagonal bins.
install.packages("hexbin")
ggplot(data = diamonds) +
  geom_hex(mapping = aes(x = carat, y = price))
