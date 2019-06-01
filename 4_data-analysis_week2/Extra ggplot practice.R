##excersises can be found here
https://www.r-exercises.com/2018/02/23/practice-you-ggplot-skills-exercises/

library(dplyr)

##first excersise - create simple IRIS scatterplot plot with dynamic colors and bw theme
head(iris)
irisplot <- ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species))
irisplot + 
  geom_point(aes(shape = Species)) + 
  geom_density2d() + 
  theme_bw() + 
  labs(title = "IRIS")

##second excersise - create faceted IRIS plot that also contains a facet for ALL data
iris %>%
  mutate(Species = 'ALL') %>%
  bind_rows(iris) %>%
  ggplot(aes(Petal.Length, Petal.Width, color = Species)) +
  geom_point() +
  geom_smooth() +
  xlab('Petal Length') +
  ylab('Petal Width') +
  facet_wrap(~Species, scales = 'free') +
  theme_bw()

##3rd exercise - tuffy style mtcars (showing text labels instead of points in scatterplot)
str(mtcars)
mtcarsplot <- ggplot(mtcars,aes(rownames(mtcars), mpg, label = rownames(mtcars)))
mtcarsplot +
  geom_point() +
  geom_text(nudge_y = .3, hjust = 'left') +
  coord_flip() + ##switching the x and y axis (mpg to x, carnames to y)
  ylab('Miles per gallon fuel consumption') +
  ylim(10, 40) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0, size = 16),
        axis.title.x = element_text(face = 'bold'),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.line.y = element_blank())

##4th excercise - creating a dynmaic bubble plot (bubbles increase based on value)
mtcars %>%
  ggplot(aes(mpg, qsec, size = disp, color = as.factor(am))) +
  geom_point() +
  scale_colour_discrete(name  ="Gear",
                        breaks=c(0, 1),
                        labels=c("Manual", "Automatic")) +
  scale_size_continuous(name = 'Displacement') +
  xlab('Miles per gallon') +
  ylab('1/4 mile time') +
  theme_light()

##5th excersise






