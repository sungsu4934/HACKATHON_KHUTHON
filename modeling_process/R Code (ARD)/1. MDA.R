library(randomForest)

df <- read.csv('rf.csv')
df1 <- subset(df, select =-X)
dim(df1)

# MDA
set.seed(42)

for (i in 1:116){
  df1[,i] <- as.factor(df1[,i])
}

str(df1)
dim(df1)

rf_MDA <- randomForest(formula = as.factor(BMI)~., data = df1, importance=TRUE)
importance(rf_MDA)
varImpPlot(rf_MDA, n.var=12)    
