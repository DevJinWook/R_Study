# 상관관계 분석
result <- read.csv("testdata/drinking_water.csv", header = TRUE, fileEncoding = 'utf-8')
head(result)
str(result)

cov(result$친밀도, result$적절성)  # 공분산
cov(result)

# 상관계수
cor(result$친밀도, result$적절성)
cor(result$친밀도, result$만족도)
cor(result$적절성, result$만족도)
cor(result$적절성, result$친밀도, result$만족도)

cor(result, method = 'pearson')

# 상관관계를 시각화
symnum(cor(result)) # 숫자를 심볼로 표시

install.packages("corrgram")
library(corrgram)

corrgram(result)
corrgram(result, upper.panel = panel.conf)
corrgram(result, lowwer.panel = panel.conf)

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

chart.Correlation(result, histogram = , pch='+')

# 참고
cor(result, method = 'spearman')
cor(result, method = 'kendall')
