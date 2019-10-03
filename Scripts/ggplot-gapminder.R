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





