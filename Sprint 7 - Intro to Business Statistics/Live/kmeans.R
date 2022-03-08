library(tidyverse)
library(dplyr)

iris_df <- as_tibble(iris)

Species <- iris_df$Species

iris_df <- iris_df %>%
  select(-Species)


ggplot(iris_df, aes(Sepal))