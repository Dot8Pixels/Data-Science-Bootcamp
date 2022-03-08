install.packages(c("ggplot2", "dplyr"))

library(ggplot2)
library(dplyr)

select(mtcars, 1:3, 5, 11)

df <- mtcars %>%
  select(mile_per_gallon = mpg, 
        auto_manual = am, 
        horse_power = hp, 
        weight = wt) %>%
  filter(mile_per_gallon <= 15) %>%
  arrange(desc(horse_power))

hist(mtcars$hp)
plot(mtcars$hp, mtcars$mpg, pch=16, col='red')

ggplot(mtcars, aes(hp, mpg)) + geom_point()
ggplot(mtcars, aes(hp, mpg)) + geom_smooth()

ggplot(mtcars, aes(hp, mpg)) + 
  geom_point() + 
  geom_smooth() + 
  geom_rug() +
  theme_minimal() +
  labs(title = 'Hello World')

Species <- iris$Species

iris_data <- iris %>% select(-Species)

km_result <- kmeans(iris_data, 3)
cluster_membership <- km_result$cluster

table(cluster_membership)

table(Species, cluster_membership)
