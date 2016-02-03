# Clean up the workspace
rm(list = ls())

# Set the working directory
setwd("C:/Users/Dell/Documents/GitHub/hello-world/")

# Read the file
data <- read.csv("train.csv")

# Check the first 6 rows of the dataframe
head(data)

# Summary of the dataframe
summary(data)

# To find out if the class of each column/variable - categorical or continuous
str(data) # Here Name, Ticket, Cabin and Embarked are categoriacal variable and the rest are continuous variables

# To check for NA's
for (i in names(data)) {
  if (i != "Name") {
    print(i)
    print(summary(is.na(data[i]))[c(3)])
  }    
} # Only Age has NA's

# To calculate mean, median and SD for the continuous variables
for (i in 1:ncol(data)) {
  if(names(data[i]) != "Name") {
    if(is.integer(data[,i]) == TRUE) {
      print(names(data[i]))
      print(summary(data[i]))
    }
  }
}

# Histogram of the numerical variables
# To check for numerical variables
str(data) # Only Age and Fare are numerical and makes sense to make histograms
hist(data$Age, main = "Age in Train.csv dataset", xlab = "Age")
hist(data$Fare, main = "Fare in Train.csv dataset", xlab = "Fare")

