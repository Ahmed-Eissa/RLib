#------------------------------------------------------------------------------------------
#-- Learn ggplot2
#------------------------------------------------------------------------------------------


#-- Loading packages
require("dplyr")
require("ggplot2")


#-- Data
dsmall <- diamonds[sample(nrow(diamonds), 100),]


#---- Learn qplot
#-----------------
#1- qplot( x, y, dataset)
qplot(carat, price, data = diamonds)
qplot(log(carat), log(price), data = diamonds)

#2- adding color and shap for each poit
#colour and shape work well with categorical variables,
qplot(carat, price, data = dsmall, colour = color)
qplot(carat, price, data = dsmall, shape = cut)

#3- Geom, short for geometric object
#geom = "point", geom = "smooth", geom = "boxplot", geom = "path" and geom = "line"
#geom = "histogram" 
#For discrete variables, geom = "bar"
#combined multiple geoms by supplying a vector of geom names created with c() .
qplot(carat, price, data = diamonds, geom = c("point", "smooth"))

#4 Boxplots and jittered points
#When a set of data includes a categorical variable and one or more continuous
#variables, you will probably be interested to know how the values of the
#continuous variables vary with the levels of the categorical variable

qplot(color, price / carat, data = diamonds, geom = "jitter")
qplot(color, price / carat, data = diamonds, geom = "boxplot")


#5 Histogram and density plots
#Histogram and density plots show the distribution of a single variable
qplot(carat, data = diamonds, geom = "histogram")
qplot(carat, data = diamonds, geom = "density")

qplot(carat, data = diamonds, geom = "density", colour = color)
qplot(carat, data = diamonds, geom = "histogram", fill = color)

qplot(carat, data = diamonds, geom = "histogram", binwidth = 1)
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.1)

#6 Bar charts
#The discrete analogue of histogram is the bar chart
#The bar geom counts the number of instances of each class so that you don ’t need to
#tabulate your values beforehand,
qplot(color, data = diamonds, geom = "bar")
qplot(color, data = diamonds, geom = "bar", weight = carat) +
scale_y_continuous("carat")


#7 Time series

ggplot(data = mpg, aes(hwy, displ)) +
geom_point(color = "steelblue", size = 4, alpha = 1 / 2) + 
facet_grid(. ~ year) + geom_smooth(method = "lm") + ggtitle("My Chart") + 
xlab("x axis title here") + 
theme_light()