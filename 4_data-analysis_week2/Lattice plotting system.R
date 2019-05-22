##lattice plot is usefull to look at correlations at many different levels

##most usefull latice plot
xyplot(y~x | f * g, data)
##I want to look at the scatterpolot for y and x for every level of f & g coming from dataframe data

library(lattice)
library(datasets)
##Simple scatterplot
xyplot(Ozone~Wind, data = airquality)

##Adding levels to the scatterplot - plotting scatterplot ozone and wind for each month
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

##you can assign a lattice plot to an R object to store the plot
##nothing happens untill p is printed by the print command
p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)

##Lattice panel functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1)) ##plot with 2 panels

##Custom panel plot function - add horizontal line to the median
xyplot(y ~ x | f, panel = function(x,y, ...){
        panel.xyplot(x, y, ...) ##first call the default panel function for 'xyplot'
        panel.abline(h=median(y), lty = 2) ##add a horizontal line to the median
        
})

##Custom panel plot function - add regression line to the panels
xyplot(y ~ x | f, panel = function(x,y, ...){
        panel.xyplot(x, y, ...) ##first call the default panel function for 'xyplot'
        panel.lmline(x,y, col = 2) ##add a horizontal line to the median
        
})






