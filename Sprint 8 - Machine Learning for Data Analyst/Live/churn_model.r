library(tidyverse)
library(caret)
library(rpart)

churn <- read_csv("churn.csv")

mean(complete.cases(churn)) == 1

glimpse(churn)

churn <- churn %>%
  mutate_if(is.character, as.factor)


churn %>%
  count(churn) %>%
  mutate(pct = n/sum(n))




set.seed(42)
n <- nrow(churn)
id <- createDataPartition(y = churn$churn,
                          p = .8,
                          list = FALSE)

train_df <- churn[id, ]
test_df <- churn[-id, ]

set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5,
                     classProbs = TRUE,
                     summaryFunction = twoClassSummary,
                     verboseIter = TRUE)

# glm_model <- train(churn ~ .,
#                    data = train_df,
#                    method = "glm",
#                    trControl = ctrl)

# rpart_model <- train(churn ~ .,
#                    data = train_df,
#                    method = "rpart",
#                    trControl = ctrl)

rf_model <- train(churn ~ .,
                     data = train_df,
                     method = "rf",
                     metric = "ROC",
                     trControl = ctrl)

p <- predict(rf_model, newdata = test_df)

mean(p == test_df$churn)

# table(test_df$churn, p, 
#       dnn=c("actual", "prediction"))

confusionMatrix(p,
                test_df$churn,
                mode = "prec_recall",
                positive = "Yes")


saveRDS(rf_model, "randomForest.RDS")
myModel <- readRDS("randomForest.RDS")
