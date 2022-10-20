
# Please register at Kaggle. Go to <https://www.kaggle.com/c/titanic/data> and download the datasets (`train.csv`, `test.csv`, `gender_submission.csv`). Put them in your working directory. The following merge commands should work. 

library(tidyverse)

## load individual datasets
titanic.train = read.csv('data/train.csv',  header = T, na.strings = c(''))
titanic.test = read.csv('data/test.csv', header = T, na.strings = c(""))
test.label = read.csv('data/gender_submission.csv', header = T, na.string=c(""))
## merge labels with test
titanic.test = merge(titanic.test, test.label, by = "PassengerId")
## bind test and train (here we don't make the distinction)
titanic = rbind(titanic.test, titanic.train)
## convert Pclass to factor (from numeric)
titanic$Pclass = as.factor(titanic$Pclass)
## convert all character variables to factor
titanic <- as.data.frame(titanic, stringsAsFactors=TRUE)
titanic <- titanic %>% mutate_if(is.character,as.factor)

write.csv(titanic, "data/titanic.csv")