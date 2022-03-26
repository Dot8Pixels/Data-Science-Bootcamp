library(tidyverse)
library(caret)
library(mlbench)

# load data
data("BostonHousing")
View(BostonHousing)

set.seed(42)
n <- nrow(BostonHousing)

# train test split
id <- sample(1:n, size = 0.8*n)

train_df <- BostonHousing[id, ] # 80%
test_df <- BostonHousing[-id, ] # 20%

# train model
set.seed(42)
lm_model <- train(medv ~ .,
                  data = train_df,
                  method = "lm")

set.seed(42)
knn_model <- train(medv ~ crim + rm + tax + age,
                  data = train_df,

                                    method = "knn")
# scoring (prediction)
p_medv <- predict(lm_model, newdata = test_df)

# evaluate model
test_rmse <- sqrt(mean((test_df$medv - p_medv)**2))

# save model
saveRDS(lm_model, "LM_Model.RDS")

# load model
my_model <- readRDS("LM_Model.RDS")
my_model$finalModel

