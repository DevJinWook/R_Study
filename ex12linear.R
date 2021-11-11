# 선형회귀분석 모델 작성
# y = wx + b 일차방정식의 w: 기울기, b : 절편 구하기

# 부모의 IQ와 자녀의 IQ로 선형회귀분석
x <- c(110, 120, 130, 140, 150)  # 부모의 IQ
y <- c(100, 105, 128, 115, 142)  # 자녀의 IQ

cor(x, y)  # 상관계수 0.8660744 양의 상관관계가 매우 높음
# 분석가의 판단을 보니 부모의 IQ가 자녀의 IQ에 영향을 주는 것으로 보임. 인과관계
# 선형회귀분석을 진행
plot(x, y)

x_dev <- x - mean(x)  # x 편차
y_dev <- y - mean(y)  # y 편차
dev_mul <- (x - mean(x)) * (y - mean(y))  # 편차곱
square <- x_dev ** 2
df <- data.frame(x, y, x_dev, y_dev, dev_mul, square)
df
mean(df$x)   # x의 평균값
mean(df$y)   # y의 평균값
sum(df$dev_mul) # 분자
sum(df$square)  # 분모
slope <- sum(df$dev_mul) / sum(df$square)
slope  # 기울기 0.94
bias <- mean(df$y) - (slope * mean(df$x))
bias  # 절편
y = slope * x + bias  # 회귀분석 모델 수식이 완성
y
pred_y = slope * 100 + bias
pred_y

pred_y = slope * 110 + bias
pred_y

pred_y = slope * 120 + bias
pred_y

# R이 제공하는 함수를 이용해 선형회귀모델(수식) 얻기
?lm
model <- lm(y ~ x)
model

plot(x, y)
abline(model, col = 'blue')

# 연습2 : 시간당 급여액에 대한 회귀분석
df <- data.frame(workhour = 1:7, totalpay = seq(10000, 70000, by = 10000))
df

cor(df$workhour, df$totalpay)
plot(totalpay ~ workhour, data = df)

model <- lm(totalpay ~ workhour, data = df)
model  # bias -5.5e-12      slope 1.0e+04 

pred_y <-1.0e+04 * 3 + -5.5e-12
cat('예측값 y : ', pred_y)

pred_y <-1.0e+04 * 3.5 + -5.5e-12
cat('예측값 y : ', pred_y)

grid()
abline(model, col = 'blue', lwd = 2)

# 예측값 함수
pred_y <- predict(model)
pred_y

new_pred <- predict(model, data.frame(workhour = c(8, 2.2, 7.8)))
new_pred  # 80000 22000 78000

