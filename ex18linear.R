# iris dataset으로 회귀분석 : train/test 로 데이터 분리해서 처리
head(iris, 3)
str(iris)
NROW(iris)

set.seed(12)
sam_tt <- sample(1:NROW(iris), NROW(iris) * 0.7, replace = F)
NROW(sam_tt)
train <- iris[sam_tt, ] # 모델 학습용 데이터 train data
test <- iris[-sam_tt, ] # 모델 검정용 데이터 test data
dim(train)  # 105 5
dim(test)   # 45 5
train
head(train, 5)
head(test, 15)

# 모델 작성
model <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = train)
model

summary(model) # p-value: < 2.2e-16 < 0.05, Adjusted R-squared:  0.8455

library(car)
# 다중공선성
vif(model)
# Sepal.Width Petal.Length  Petal.Width 
# 1.337277    15.137142    14.014160    의심

par(mfrow=c(2,2))
plot(model)

# 정규성
shapiro.test(model$residuals)  # p-value = 0.8316 > 0.05 만족

# 독립성
durbinWatsonTest(model)  # D-W Statistic  2.496394

# 등분산성
ncvTest(model)  # p = 0.12729 > 0.05

#검정
pred <- predict(model, test)  # test로 검정
pred

cat('실제값 : ', head(test[, 1], 5))
cat('예측값 : ', pred[1:5])
