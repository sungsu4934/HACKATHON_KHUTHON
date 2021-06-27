library(arules)

df <- read.csv('rf.csv')
dim(df)

df1 <- subset(df, select =-X)
dim(df1)

table(df1$BMI)

df1$BMI <- ifelse(df1$BMI >= 30, 1, 0)
table(df1$BMI)

for (i in 1:15){
  df1[,i] <- as.factor(df1[,i])
}
str(df1)

df1_tr <- as(df1, "transactions")
str(df1_tr)


rule_1 <- apriori(df1_tr, parameter=list(support = 0.001, minlen=15, maxlen=15, maxtime=5000), appearance = list(rhs="BMI=0"))
rule_1
inspect(rule_1)
rule_1_order <- sort(rule_1, by=c('count'))
head(inspect(rule_1_order))

