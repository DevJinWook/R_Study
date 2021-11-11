# 도수 분포표 - 범주형 중 명목형 자료 : gender, bloodtype
df <- read.csv("testdata/ex_studentlist.csv")
df

# table() 함수로 분할표 작성
freq <- table(df$bloodtype)
freq

# 상대도수
rfreq <- prop.table(freq)
rfreq

rtable <- rbind(freq, rfreq)
rtable

rtable <- addmargins(rtable, margin = 1)
rtable
