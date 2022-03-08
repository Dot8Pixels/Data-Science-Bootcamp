library(tidyverse)
library(dplyr)

df = read.csv('churn.csv')

cor(df[,unlist(lapply(df, is.numeric))])
