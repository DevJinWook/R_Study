# KNN(최근접 이웃 알고리즘)

install.packages("ggvis")
library(ggvis)

cor(iris[, 1:4])
unique(iris$Species)

iris %>% ggvis(~Petal.Length, ~Petal.Width, fill = ~factor(Species))

# 데이터 정규화 : (요소값 - 최소값) / (최대값 - 최소값)
func_normal <- function(x) {
  num <- x - min(x)
  m_m <- max(x) - min(x)
  return (num / m_m)
}

# test <- data.frame(x = c(1, 2, 3, 4, 5))
# func_normal(test)
# lapply(test, func_normal)

head(iris, 3)
normal_d <- as.data.frame(lapply(iris[1:4], func_normal))
head(normal_d, 3)

df <- data.frame(normal_d, Species = iris$Species)
head(df, 3)

set.seed(123)
idx <- sample(1:nrow(df), nrow(df) * 0.7)
ir_train <-df[idx, ]
ir_test <-df[-idx, ]
dim(ir_train) # 105   5
dim(ir_test) # 45 5

library(class)
? knn
model <- knn(train = ir_train[, -5], test = ir_test[, -5], cl = ir_train$Species
             , k = 3)
model  # predict() 함수 지원하지 않음
summary(model)

t <- table(model, ir_test$Species)
t
acc <- sum(diag(t)) / nrow(ir_test)
acc

install.packages("gmodels")
library(gmodels)
CrossTable(x = ir_test$Species, y = model)

model2 <- knn(train = ir_train[, -5], test = ir_test[, -5], cl = ir_train$Species
             , k = 11)
model2  # predict() 함수 지원하지 않음
summary(model2)

t2 <- table(model2, ir_test$Species)
t2
acc2 <- sum(diag(t2)) / nrow(ir_test)
acc2

# 반복문으로 최적의 k값 얻기
k = seq(from = 3, to = 13, by = 2)
k

result <- c()

for (i in k) {
  m <- knn(train = ir_train[, -5], test = ir_test[, -5], cl = ir_train$Species
           , k = i)
  tab <- table(m, ir_test$Species)
  accuracy <- sum(diag(tab)) / nrow(ir_test)
  result <- c(result, accuracy)
}

result
# 3         5         7         9         11        13
# 0.9777778 0.9555556 0.9777778 0.9777778 0.9777778 0.9777778

acc_df <- data.frame(k값 = k, 정확도 = result)
acc_df
plot(acc_df)
