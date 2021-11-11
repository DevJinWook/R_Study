# 내장 함수
seq(0, 5, by = 1.5)

set.seed(123)  # 난수 값을 고정
aa <- rnorm(10, mean = 0, sd = 1)  # 정규분포를 따르는 난수 발생. # 중심극한정리
print(aa)
print(mean(aa))
hist(aa)

bb <- runif(10, min = 0, max = 100) # 균등분포를 따르는 난수
print(bb)
hist(bb)

sample(0:100, 10)

vec <- 1:10
min(vec)
mean(vec)
median(vec)
quantile(vec)
table(vec)
# ...

# 사용자 정의 함수
func1 <- function() {
  print('사용자 정의 함수')
}
func1()

func2 <- function(arg1) {
  cat('arg : ', arg1)
  cat('\n매개 변수 사용')
  return(arg1 + 10)
}

func2(20)

# 윤년 체크 : 년도가 4의 배수이고 100의 배수가 아니거나 400의 배수
yun_func <- function(y) {
  if(y %% 4 == 0 & y %% 100 != 0 | y %% 400 == 0) {
    paste(y, '년은 윤년')
  } else {
    paste(y, '년은 평년')
  }
}
yun_func(2020)
yun_func(2022)
