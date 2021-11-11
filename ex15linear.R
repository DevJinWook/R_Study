# 선형회귀 : cars dataset
head(cars, 3)  # speed(속도)  dist(제동거리)

cor(cars$speed, cars$dist)  # 0.8068949 양의 상관관계

model <- lm(formula = dist ~ speed, data = cars)  # dist : 종속변수 y speed : 독립변수 x
model
summary(model)

coef(model)   # 회귀계수
fitted(model)   # 예측값 : 각 speed 값에 대한 dist 예측값

residuals(model)[1:4]  # 잔차
fitted(model)[1:4] + residuals(model)[1:4] # 예측값 + 잔차 ==> 실제값
cars$dist

confint(model)  # 계수 신뢰구간

summary(model)$r.squared  # 결정계수

# 예측값
predict(model, newdata = data.frame(speed=10))

