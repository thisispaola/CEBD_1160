########################################################################
# CEBD 1160
# Final Project - R
# Fall 2017
#
# By: M. Paola Calderon
# Date: 2017-10-28
#
# Install ggplot2 package
#install.packages("ggplot2")
#install.packages("RCurl")
library(ggplot2)
library(RCurl)

# Import .csv file from github repo
data <- read.csv("https://raw.githubusercontent.com/thisispaola/CEBD_1160/master/Data/sampleData.csv")

# Define subset1 as a dataframe which limits data set to Attrition = Yes
subset1 <- data.frame(subset(data, Attrition  == "Yes"))

########################################################################
# PART A - Histogram of Employee Age - Attirition = Yes
########################################################################
hist(subset1$Age,main="Histogram of Attrited Employee Age", xlab = "Age", ylab = "Frequency", col = "light blue", xlim= c(0,70), ylim = c(0,100), breaks=5)

########################################################################
# PART B - Histogram of Employee Hourly Rates - Attirition = Yes
########################################################################
hist(subset1$HourlyRate,main="Histogram of Attrited Employee Hourly Rate", xlab = "Hourly Rate", ylab = "Frequency", col = "light blue", xlim= c(0,120), ylim = c(0,50), breaks=9)

########################################################################
# PART C - Scatter Plot of Attrited Employees Hourly Rate vs Age
########################################################################
plot(subset1$Age,subset1$HourlyRate,main= "Scatterplot of Attrited Employee Hourly Rate vs Age", xlab = "Age", ylab = "Hourly Rate", xlim=c(10,70), ylim=c(20,110))

########################################################################
# PART D - Use ggplot2 - Scatter Plot of Attrited Employees Hourly Rate vs Age
########################################################################
ggplot(subset1, aes(x=Age, y=HourlyRate)) + geom_point() + ggtitle("Scatter Plot of Attrited Employee Hourly Rate vs Age") + xlab("Age") + ylab("Hourly Rate")

########################################################################
# PART E - Use ggplot2 - Bar Plot of Attrition by Job Role
########################################################################
counts <- data.frame(table(data$Attrition, data$JobRole))
ggplot(counts, aes(factor(Var2), Freq, fill = factor(Var1))) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Default dodge positioning") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs(title="Attrition by Job Role", x="Job Role", y = "Count", fill = "Attrition")