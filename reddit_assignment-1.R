rm(list = ls())
setwd("~/Documents/git_repos/CS570/")

data <- read.csv("RedditShortDemoSurvey-1-Cleaned.csv", na.strings=c("",".","NA")) 
head(data)
summary(data)
names(data)
data <- data[,c(1:14)]

#A. Aggregate all Countries to their Continents.
summary(data$Treated.country.data)

#B. Drop US States
test <- subset(data, select = -X.For.U..S..redditors..In.which.state.do.you.live.)

#C. Look for and handle missing values
data <- read.csv("RedditShortDemoSurvey-1-Cleaned.csv", na.strings=c("",".","NA")) 

#D. Create indicator variables for categoricals, bin where you feel appropriate
sex <- model.matrix(~ data$Please.indicate.your.gender. - 1)
hist(sex, freq = F)
ms <- model.matrix(~ data$What.is.your.marital.status. - 1)
hist(ms, freq = F)

#E. Clean bad data (e.g. the value movies is present in “Are you a dog or a cat person?”)
new <- data
new2 <- data.frame(sub("movies", "NA", new$Are.you.a.dog.or.a.cat.person.))
summary(new2)
head(new2)

#2 Use Pearson's Correlation Coefficient, determine which variables are most highly collinear, and graph the results. 
dcor <- cor(data, method = "pearson")
library(corrplot)
corrplot(dcor, type="upper", order="hclust", tl.col="black", tl.srt=45)
