library(tidyverse)
library(caret)
library(rpart)
library(rpart.plot)

iris

iris %>% count(Species)

mean(complete.cases(iris))


set.seed(42)
n <- nrow(iris)
id <- sample(n, n*0.8)
train_df <- iris[id, ]
test_df <- iris[-id, ]

ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

set.seed(42)
# rpart_model <- train(Species ~ .,
#                      data = train_df,
#                      method = "rpart",
#                      trControl = ctrl
#                      )

set.seed(42)
knn_model <- train(Species ~ .,
                   data = train_df,
                   method = "knn",
                   metric = "Accuracy",
                   trControl = ctrl
                   )

# p_rp <- predict(rpart_model, 
#                 newdata = test_df)

p_knn <- predict(knn_model, 
                 newdata = test_df)

# mean(p_rp == test_df$Species)
mean(p_knn == test_df$Species)
