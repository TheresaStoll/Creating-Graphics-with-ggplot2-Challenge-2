library(tidyverse)

#Open a new script and use read_csv to read in the gapminder data and assign it to a varilabl called gapminder
# Hint: read_csv can be accessed through the tidyverse package

gapminder <- read_csv("Data/gapminder_data.csv")
gapminder

#because our example figure uses only the data from 1977, create a new dataframe called gapminder_1977
#and assign it the data just from 1977 using the filter() function

gapminder_1977 <- filter(gapminder, year == 1977)
gapminder_1977

#other way to filter for the data just from 1977
gapminder %>%
  filter(year == 1977)

ggplot(data = gapminder_1977)

ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop))

#adding a new layer to add geometry, but outside of ggplot function!
ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point()

#scale the x axis to change the values of the x axis 
#there are many different ways to scale the x axis
ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point() +
  scale_x_log10()

#Creating Graphics with ggplot2

#Challenge 4 p. 6
#experiment with substituting different combinations of data variables into 3 positions
# lesson: fundamental structure of data, mapping and geometry gives you access to large varieties of figures
ggplot(data = gapminder_1977, 
       mapping = aes(x = country,
                     y = lifeExp,
                     colour = continent)) +
  geom_point()

ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = country,
                     colour = country,
                     size = pop)) +
  geom_point()

#Diggin Deeper

ggplot(data = gapminder_1977) +
  geom_point(mapping = aes(x = gdpPercap,
                           y = lifeExp,
                           colour = continent,
                           size = pop)) +
  scale_x_log10()

#to access help function
?geom_point()


#Challenge 6 p. 7

#mapping = Zuordnung
#mapp gdpPercap on x and lifeExp on y and use points for geometry
ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point()

# setting = Einstelltung (generell)
ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point(colour = "blue", size = 5)

#added the mapping of continent to color and the pop to size
ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point() 

#added that points are now transparent by 0.5 (alpha = transparency)
ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point(alpha = 0.5) 

#added that points are now transparent by 0.5 (alpha = transparency) as well as a star and size 2
ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point(shape = "star", size = 2, alpha = 0.5) 

#setting can override mapping
#instead of colour now mapped according to continent (points for different continents have different colours), all points are now green
ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point(colour = "green") 


#Challenge 7 p. 8

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) + geom_line()

ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp, 
                                       group = country, colour = continent)) + 
  geom_line()

#add another level of geometry - points in this example
ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp, 
                     group = country, colour = continent)) + 
  geom_line() +
  geom_point()

#to make the points above not the same colour as the lines, but make them black
ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp, 
                     group = country, colour = continent)) + 
  geom_line() +
  geom_point(colour = "black")

#to do same as above with less code
ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp, 
                     group = country)) + 
  geom_line(aes(colour = continent)) +
  geom_point()

# !! geom functions always need to have their own line of code

#if change order of geom functions, then the order of geometric layers will change
#now points will printed first and then lines will be printed
#in example above: lines will be printed first and then lines will be printed
ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp, 
                     group = country)) + 
  geom_point() +
  geom_line(aes(colour = continent)) 
  
# transformations and statistics
#geom_smooth to add a relationship of the data
#method = lm - means I want it to use a linear model (= a straight line)
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.3) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)

#ggplot will choose the default colours
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(colour = continent)) +
  scale_x_log10() 

#to choose the colours myself
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(colour = continent)) +
  scale_x_log10() +
  scale_colour_manual(values = c("red", "green", "purple", "blue", "black"))

#to assing a specific colour to a specific value
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(colour = continent)) +
  scale_x_log10() +
  scale_colour_manual(values = c(Europe = "red", 
                                 Africa = "green", 
                                 Oceania = "purple", 
                                 Asia = "blue", 
                                 Americas = "black"))

#different scales to choose

#Challenge 9 p. 13
# for all points, the colour will be green and the size will be 2 
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 2, colour = "green") + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)

#Challenge 10 p.13
#shading is standard error of trendlines (showing level of uncertainty)
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, 
                     y = lifeExp,
                     colour = continent)) +
  geom_point(size = 3, shape = 1) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1)

#how to control the shape of points / to specify the specific shapes
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, 
                     y = lifeExp,
                     colour = continent,
                     shape = continent)) +
  geom_point(size = 4) +
  scale_x_log10() +
  scale_shape_manual(values = c(7, 8, 3, 10, 18))


#Challenge 11, p. 14  
#to use scale_colour_brewer() function

colours()
scale_colour_brewer()

ggplot(data = gapminder, aes(x = gdpPercap, 
                             y = lifeExp, 
                             colour = continent)) +
  geom_point() + 
  scale_x_log10() +
  scale_color_brewer(palette = "PuOr")

#Separating figures / facetting

a_countries <- gapminder %>%
  filter(str_starts(country, "A"))
a_countries

ggplot(
  data = a_countries, 
  mapping = aes(x = year, y = lifeExp, colour = continent, group = country)
  ) +
  geom_line() +
  facet_wrap(~country)

#facet function we used at the beginning of the day
#facet can be used to illustrate time-based change

gapminder_1977 <- filter(gapminder, year == 1977)

gapminder_rich <- filter(gapminder_1977, gdpPercap > 30000)
gapminder_rich

ggplot(gapminder_1977, mapping = aes(x = gdpPercap, y = lifeExp, 
                                colour = continent, size = pop)) +
  geom_point() +
  scale_x_log10()

#Challenge 12
ggplot(
  data = gapminder, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
) +
  geom_point() +
  scale_x_log10() +
  facet_wrap( ~ year)

#add a new layer of text
ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, 
                colour = continent, size = pop, label = country)
) +
  geom_point() +
  scale_x_log10() +
  geom_text()

#add a new layer of text only to gapminder_rich dataset
# only countries from gapminder_rich dataset will be labelled
ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, 
                colour = continent, size = pop, label = country)
) +
  geom_point() +
  scale_x_log10() +
  geom_text(data = gapminder_rich)

#assign a variable name to ggplot code and save it like that
rough_plot <- ggplot(
  data = a_countries, 
  mapping = aes(x = year, y = lifeExp, colour = continent, group = country)
) +
  geom_line() +
  facet_wrap(~country)

#taken the plot we saved and added the Dark2 colour scale to it 
#not changing the variable "rough_plot" itself but adding different layers to it
rough_plot + scale_color_brewer(palette = "Dark2")

rough_plot +
  labs(title = "Fig1",
       x = "Year",
       y = "Life expectancy",
       colour = "Continent")

#Preparing plots for display - Challenge 1 p.2 
rough_plot +
  labs(title = "Life expectancy over time for 'A' countries",
       caption = "Data from Gapminder",
       x = "Year",
       y = "Life expectancy",
       colour = "Continent")

#Modifying looks through themes
rough_plot + 
  theme_bw()

rough_plot + 
  theme_linedraw()

#remove thicker grid lines on plot
rough_plot + 
  theme(
    panel.grid.major = element_blank()
  )

# 
rough_plot +
  labs(title = "Life expectancy over time for 'A' countries",
       caption = "Data from Gapminder",
       x = "Year",
       y = "Life expectancy",
       colour = "Continent") + 
  theme(
    panel.grid.major = element_blank(),
    plot.title = element_text(size = 4),
    axis.line = element_line(colour = "blue", size = 4)
  )


#exporting the plots p.4ff

ggsave("Figures/my_first_plot.jpg", plot = rough_plot, width = 12, height = 10, units = "cm")





