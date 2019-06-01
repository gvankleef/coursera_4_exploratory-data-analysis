##standard color package is grDevices
##the function colors() contains 657 names of predefined colors

##randomly selects 10 colors
sample(colors(),10)

##the colorRamp & colorRampPalette functions can take color names as it arguments and return
##a palet of new colors

##The first, colorRamp, takes a palette of colors (the arguments) and returns a function that
##takes values between 0 and 1 as arguments. The 0 and 1 correspond to the extremes of the color
##palette. Arguments between 0 and 1 return blends of these extremes.

pal <- colorRamp(c("red","blue"))

##gives red
pa(0)

##gives blue
pa(1)

##gives (127.5,0,127.5) (half the extreme values for both red and blue (255 is max))
pa(0.5)

##We'll turn now to colorRampPalette, a function similar to colorRamp. It also takes a palette of
##colors and returns a function. This function, however, takes integer arguments (instead of
##numbers between 0 and 1) and returns a vector of colors each of which is a blend of colors of
##the original palette.

##To see this better, assign to the variable p1 the output of a call to colorRampPalette with the
##single argument, c("red","blue"). We'll compare it to our experiments using colorRamp.
p1 <- colorRampPalette(c("red","blue"))

p1(2)
##We see a 2-long vector is returned. The first entry FF0000 represents red. The FF is
##hexadecimal for 255, the same value returned by our call pal(0). The second entry 0000FF
##represents blue, also with intensity 255.

##We can also form palettes using colors other than red, green and blue. Form a palette, p2, by
##calling colorRampPalette with the colors "red" and "yellow". Remember to concatenate them into
##a single argument.

p2 <- colorRampPalette(c("red","yellow"))
##Let's now call p2 with the argument 10. This will show us how the two extremes, red and yellow,
##are blended together.
p2(10)

##use color.scale to see the colors
##So the fourth argument is alpha which can be a logical, i.e., either TRUE or FALSE, or a
##numerical value. Create the function p3 now by calling colorRampPalette with the colors blue
##and green (remember to concatenate them into a single argument) and setting the alpha argument
##to .5.

p3 <- colorRampPalette(c("blue","green"),alpha = .5)

##We generated 1000 random normal pairs for you in the variables x and y. We'll plot them in a
##scatterplot by calling plot with 4 arguments. The variables x and y are the first 2. The third
##is the print character argument pch. Set this equal to 19 (filled circles). The final argument
##is col which should be set equal to a call to rgb. Give rgb 3 arguments, 0, .5, and .5.
plot(x,y,pch=19, col = rgb(0,.5,.5))

##Well this picture is okay for a scatterplot, a nice mix of blue and green, but it really
##doesn't tell us too much information in the center portion, since the points are so thick
##there. We see there are a lot of points, but is one area more filled than another? We can't
##really discriminate between different point densities. This is where the alpha argument can
##help us. Recall your plot command (use the up arrow) and add a 4th argument, .3, to the call to
##rgb. This will be our value for alpha.
plot(x,y,pch=19, col = rgb(0,.5,.5,.3))

##Our last topic for this lesson is the RColorBrewer Package, available on CRAN, that contains
##interesting and useful color palettes, of which there are 3 types, sequential, divergent, and
##qualitative. Which one you would choose to use depends on your data.

###colorBrewer gebruiken!! Werkt het eenvoudigst###

##These colorBrewer palettes can be used in conjunction with the colorRamp() and
##colorRampPalette() functions. You would use colors from a colorBrewer palette as your base
##palette,i.e., as arguments to colorRamp or colorRampPalette which would interpolate them to
##create new colors.

##As an example of this, create a new object, cols by calling the function brewer.pal with 2
##arguments, 3 and "BuGn". The string "BuGn" is the second last palette in the sequential
##display. The 3 tells the function how many different colors we want.

cols <- brewer.pal(3,"BuGn")
##We see 3 colors, mixes of blue and green. Now create the variable pal by calling
##colorRampPalette with cols as its argument.

pal <- colorRampPalette(cols)

##The call showMe(pal(3)) would be identical to the showMe(cols) call. So use showMe to look at
##pal(20).

##Now we can use the colors in pal(20) to display topographic information on Auckland's Maunga
##Whau Volcano. R provides this information in a matrix called volcano which is included in the
##package datasets.  Call the R function image with volcano as its first argument and col set
##equal to pal(20) as its second.

image(volcano,col = pal(20))

##We see that the colors here of the sequential palette clue us in on the topography. The darker
##colors are more concentrated than the lighter ones. Just for fun, recall your last command
##calling image and instead of pal(20), use p1(20) as the second argument.

