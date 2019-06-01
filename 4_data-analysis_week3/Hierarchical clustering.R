##creating dataset
set.seed(1234)
par(mar=c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4,), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x,y,col="blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

##the first step is to calculate the difference between the points. This is done
##by using the function dist
dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame) ##by default eucledian distance
hClustering <- hclust(distxy)
plot(hClustering) ##produces a dendogram which shows how the data is clustered

#you can choose a point to cut the tree produced by the dendogram which will give you
##a certain amount of clusters

##heatmap function is usefull to quickly summarize high dimensional datasets
##it clusters the rows and shows which columns contain data in which cluster
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)


##Kmeans
kmeansobj <- kmeans(dataFrame, centers = 3, iter.max = 20) ##more iterations can lead to a better result
names(kmeansobj)
kmeansobj$cluster ##returns which datapoints are in which cluster

##plot result kmeans
par(mar = rep(0.2,4))
plot(x,y, col = kmeansobj$cluster, pch = 19, cex = 2)
points(kmeansobj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)

##plot results kmeans with ggplot
library(ggplot2)
kmeanscenters <- as.data.frame(kmeansobj$centers)
ggplot() + 
        geom_point(data = dataFrame, aes(x,y,color = kmeansobj$cluster), lwd = 3) + 
        geom_point(data = kmeanscenters, aes(x = x, y = y), col = 1:3, pch = 3, cex = 3, lwd =3)


##heatmaps
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1,2), mar = c(2,4,0.1,0.1))
image(t(dataMatrix)[,nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[,order(kmeansObj2$cluster)], yaxt = "n")



