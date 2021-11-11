# 시각화 : 이산변수와 연속변수들을 그래프로 표시
# 이산변수 : 막대, 점, 원형, 선 ...
# 연속변수 : 상자박스, 히스토그램

stu <- read.csv('testdata/ex_studentlist.csv')
mode(stu)
head(stu, n = 3)

# 막대 그래프
barplot(stu$grade)
table(stu$grade)
barplot(stu$grade, xlab = '학년', ylab = '학생', main='제목', col=c(1,2,3))
barplot(stu$grade, xlab = '학년', ylab = '학생', main='제목', col=rainbow(4), horiz = T)
barplot(stu$grade, xlab = '학년', ylab = '학생', main='제목', col=c(1,2,3), space = 2)

par(mfrow=c(1, 2)) # 그래프 영역을 1행 2열로 변경
barplot(stu$grade)
barplot(stu$grade, xlab = '학년', ylab = '학생', main='제목', col=rainbow(4))

# 점 그래프
par(mfrow=c(1, 1))
dotchart(stu$grade)
dotchart(stu$grade, color = 2:5, lcolor = 'black', pch = 1:2, cex = 1.5)

# 원 그래프
? pie
df <- na.omit(stu)  # NA 행 생략
df
pie(df$age, labels = df$age, lty = 3)
title('원 그래프')

# 연속형 데이터를 시각화
mean(stu$height); median(stu$height); quantile(stu$height)
boxplot(stu$height, range = 0)
boxplot(stu$height, range = 1)
boxplot(stu$height, range = 1, notch = T)
abline(h=170, lty=3, col='blue')

# hist
hist(stu$height)
hist(stu$height, breaks = 5, prob = T)
lines(density(stu$height))

# 산점도
plot(stu$height)
plot(stu$height)
# 시각화지원라이브러리
install.packages("ggplot2")
library(ggplot2)

data(mpg)
mpg

ggplot(data = mpg, aes(x=displ))
ggplot(data = mpg, aes(x=displ, y=hwy)) + geom_point()
ggplot(data = mpg, aes(x=displ, y=hwy)) + geom_boxplot()
ggplot(data = mpg, aes(x=displ, y=hwy)) + geom_line()
