library(dplyr)

df <- read.csv('rf1.csv')
dim(df)
head(df)
df <- subset(df, select=-X)

dim(df)

df <- rename(df, "피자" = "FF_PIZZA", 
             '햄버거' = 'FF_HAMBER',
             '치킨' = 'FF_F_CHIC',
             '라면' = 'FF_INSTNO',
             '아이스크림' = 'FF_ICECM',
             '과자' = 'FF_SNACK',
             '초콜릿' = 'FF_CHOCO',
             '우유' = 'FF_MILK',
             '소주' = 'FF_SOJU',
             '맥주' = 'FF_BEER',
             '막걸리' = 'FF_RWINE',
             '콩나물' = 'FF_SPROU',
             '채소샐러드' = 'FF_VSALAD',
             '달걀후라이/달걀말이' = 'FF_F_EGG',
             '고등어/꽁치' = 'FF_MACKER',
             '된장찌개' = 'FF_J_SOYP',
             '김치찌개' = 'FF_J_KIMC',
             '1주일간 근력운동 일수' = 'BE5_1',
             '1주일간 걷기 일수' = 'BE3_31',
             '평소 하루 앉아서 보내는 시간' = 'Sittime')


#df2 <- subset(df, select =c('피자','햄버거','치킨','라면','BMI'))
#df2 <- subset(df, select =c('아이스크림','과자','초콜릿','우유','BMI'))
#df2 <- subset(df, select =c('소주','맥주','막걸리','BMI'))
#df2 <- subset(df, select =c('콩나물','채소샐러드','달걀후라이/달걀말이','고등어/꽁치','된장찌개','김치찌개','BMI'))
df2 <- subset(df, select =c('1주일간 근력운동 일수', '1주일간 걷기 일수', '평소 하루 앉아서 보내는 시간','BMI'))

dim(df2)

table(df2$BMI)


df2$BMI <- ifelse(df2$BMI >= 30, 1, 0)
table(df2$BMI)

for (i in 1:4){
  df2[,i] <- as.factor(df2[,i])
}
str(df2)

df2_tr <- as(df2, "transactions")
str(df2_tr)
rule_2 <- apriori(df2_tr, parameter=list(support = 0.001, minlen=4, maxlen=4, maxtime=5000), appearance = list(rhs="BMI=0"))
rule_2
inspect(rule_2)
rule_2_order <- sort(rule_2, by=c('support'))
head(inspect(rule_2_order))
