source("week2 directory.R")
library(ggplot2)

##qplot is the equivalent of the plot function in the baseplot system
##data needs to be organized in a dataframe
##factors are very important for indicating subsets of the data
##factors should be labeled so they make sense when plotted

str(mpg)

##simple plot - high way milage (y) by engine size (x)
qplot(displ, hwy, data = mpg)

##add dimension (drive type) as color indication - automatically generates legend
qplot(displ,hwy, data=mpg, color = drv)

##adding a statistic to the plot - in this case a smooth line describing the trend of the data
qplot(displ,hwy,data=mpg,geom =c("point","smooth"))

##histogram with colors based on factor variable
qplot(hwy,data=mpg,fill=drv)

##creating panel plots with ggplot - so different plots based on factor variables
qplot(displ,hwy,data=mpg, facets = .~drv) ##3 columns
qplot(hwy,data=mpg,facets = drv~., binwidth = 2) ##3 rows

##add lineair regression line
qplot(displ,hwy,data=mpg, facets = .~drv, geom = c("point","smooth"), method = "lm")

##adding point astethics to existing ggplot object - in this case the color is static
g <- qplot(displ, hwy, data = mpg)
g + geom_point(color = "steelblue", size = 4, alpha = 1/2)

##adding point astethics to existing ggplot object - in this case the color is dynamic.
##based on factor variable. If a color is dynamic you need to wrap it within the aes function
f <- qplot(displ, hwy, data = mpg)
f + geom_point(aes(color = drv), size = 4, alpha = 1/2)
##changing labels
f + geom_point(aes(color = drv)) + labs(title = "mygraph") + labs(x ="myx", y="myy")

##change theme of graph - background white instead of grey and different font
f + geom_point(aes(color = drv)) + theme_bw(base_family = "Times")

##handling outliers with ggplot
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100 ##outlier

g <- ggplot(testdat, aes(x=x,y=y)) 
g + geom_line()

##removing outlier from dataset
g + geom_line() + ylim (-3,3)

##adjusting scale of the graph, but keeping outlier
g + geom_line() + coord_cartesian(ylim = c(-3,3))

##break out plots by continious data

##1. Calculate the deciles of the data
cutpoints <- quantile(mpg$displ, seq(0,1,length=4), na.rm = TRUE)
mpg$disquant <- cut(mpg$displ, cutpoints)

g <- ggplot(mpg, aes(cyl,hwy))
##add layers
g + geom_point(alpha = 1/3) + facet_wrap(drv ~ disquant)



