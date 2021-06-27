install.packages("mice")
library(mice)


df <- read.csv('data.csv')
dim(df)
head(df)
df <- subset(df, select=-X)


df_mice <- mice(df, m=5, printFlag = F, seed=1234) 
df_mice <- complete(df_mice, 2) 
dim(df_mice)

write.csv(df_mice, 'df_mice.csv')
