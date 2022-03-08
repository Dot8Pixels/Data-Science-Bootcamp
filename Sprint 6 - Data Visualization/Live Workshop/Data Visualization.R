library(dplyr)
library(ggplot2)

head(mtcars)

# 1. How many variables?
# 2. Data type of each variables?

ggplot(data = mtcars, mapping = aes(mpg)) + 
  geom_histogram(bins = 10) # geometry

ggplot(data = mtcars, aes(mpg)) + 
  geom_density()

ggplot(data = mtcars, aes(mpg)) + 
  geom_boxplot()

# Put first layer into a variable

p <- ggplot(data = mtcars, aes(mpg))

p + geom_histogram(bins = 10)
p + geom_density()
p + geom_boxplot()

# Two Variables numeric -> scatter plot

p1 <- ggplot(mtcars, aes(hp, mpg)) + 
  geom_point() +
  geom_smooth(se = FALSE, color = "red") +
  geom_rug()

p1 + 
  theme_minimal() +
  labs(title = "My first ggplot chart", 
      x = "Horse Power",
      y = "Miles per Gallon")

diamonds
diamonds$cut[1:10]

temperatures <- c("high", "med", "low", "low", "high")
factor(temperatures, levels = c("low","med","high"), ordered = TRUE)

ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar() +
  theme_minimal()

ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar(position = "dodge") +
  theme_minimal()

ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar(position = "fill") +
  theme_minimal()

ggplot(diamonds, aes(cut, price)) +
  geom_boxplot()

ggplot(diamonds, aes(cut, price)) +
  geom_violin()
