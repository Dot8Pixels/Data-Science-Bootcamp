cor(mtcars$hp, mtcars$mpg)
cor(mtcars$wt, mtcars$mpg)

plot(mtcars$hp, mtcars$mpg, pch=16)
plot(mtcars$wt, mtcars$mpg, pch=16)
plot(mtcars$wt, mtcars$hp, pch=16)

cor(mtcars[ , c("mpg", "wt", "hp")])

library(dplyr)

mtcars %>%
  select(mpg, wt, hp, am) %>%
  cor()

