library(ggplot2)
library(faraway)
library(tidyverse)
install.packages("olsrr")
library(olsrr)
install.packages("dplyr")
library(dplyr)

install.packages("ggcorrplot")
library(ggcorrplot)




View(chredlin)

#Assignt log function for income variable
log_income<- log(chredlin$income)
chredlin$log_income<- log_income


DF <- chredlin

#Remove income variable from data set.
DF<- DF[-6]
DF

#Check for the missing values in the data set
missing_values <- sum(is.na(DF))
missing_values

#Check for the null values in the data set
all_null_values <- is.na(DF)
all_null_values

#Assigning numerical values for Side variable
side<- c("s"=0,"n" =1)

side_numeric<- side[DF$side]
DF$side_numeric<- side_numeric
side_numeric
View(DF)
summary(DF)

#histogram of variables
Plot1<- boxplot(DF)

Plot1 <- hist(DF$race ,main= "Histogram of Race")
Plot2 <-hist(DF$fire ,main= "Histogram of log Fire")
Plot3 <-hist(DF$theft,main= "Histogram of Theft")
Plot4 <-hist(DF$age,main= "Histogram of Age")
Plot5 <-hist(DF$involact,main= "Histogram of INVOLACT ")
Plot6 <-hist(DF$log_income,main= "Histogram of Log_Income")


##################################################################################

#Full regression model
Model <- lm(involact ~ race + fire + theft + age + log_income, chredlin)

summary(Model) #In this r square is 0.7517

##################################################################################
#Detecting outliers in residuals
# Cook distances - Checking for outliers
cook_model <- influence(Model)
qqnorml(cook_model$coef[,4])
halfnorm(cooks.distance(Model))

# Check jackknife residuals for outlier
range(rstudent(Model))

# 2 Outliers
chredlin[c(6,24),]
##################################################################################

#Transformation

prplot (Model, 1)
prplot (Model, 2)

#Full linear regression model without outliers
Model1 <-lm(involact ~ race + fire + theft + age + log_income, chredlin, subset=-c(6, 24))
summary(Model1) #In this r square is 0.8041
confint(Model1)
anova(Model1)

##################################################################################
#Check the assumptions for Model1
#1.Normality of Residuals
Model1_residuals<- Model1$residuals
Model1_residuals
hist(Model1_residuals)
qqnorm(Model1_residuals)

qqline(Model1_residuals)

#2.Linearity

# Create scatter plot for independent variable race
Scatter_plot_race <- ggplot(DF, aes(x=race, y=involact)) + geom_point() + geom_smooth(method="lm", se=FALSE, color="blue") + labs(title="Scatter Plot of Race vs. Involact")
Scatter_plot_race
# Create scatter plot for independent variable fire
Scatter_plot_fire <- ggplot(DF, aes(x=fire, y=involact)) + geom_point() + geom_smooth(method="lm", se=FALSE, color="blue") + labs(title="Scatter Plot of Fire vs. Involact")
Scatter_plot_fire

# Create scatter plot for independent variable theft
Scatter_plot_theft <- ggplot(DF, aes(x=theft, y=involact)) + geom_point() + geom_smooth(method="lm", se=FALSE, color="blue") + labs(title="Scatter Plot of Theft vs. Involact")
Scatter_plot_theft

# Create scatter plot for independent variable age
Scatter_plot_age <- ggplot(DF, aes(x=age, y=involact)) + geom_point() + geom_smooth(method="lm", se=FALSE, color="blue") + labs(title="Scatter Plot of Age vs. Involact")
Scatter_plot_age

# Create scatter plot for independent variable income
Scatter_plot_income <- ggplot(DF, aes(x=log_income, y=involact)) + geom_point() + geom_smooth(method="lm", se=FALSE, color="blue") + labs(title="Scatter Plot of Income vs. Involact")
Scatter_plot_income



#3.Multicollinearity

# Compute correlation matrix
correlation_matrix <- cor(DF[, c("involact","race","fire","theft","age","log_income")])
print(correlation_matrix)



#4. Homoscedasticity
ols_plot_resid_fit(Model1)
ols_plot_resid_fit(Model3)



##################################################################################

#All possible regressions and their r square value 
Models<- select(ols_step_all_possible(Model1)$result,n,predictors,rsquare)
Models$rsquare<-round(Models$rsquare*100,4)
Models


#Second linear regression model
Model2<- lm(data=chredlin,involact~race+fire+theft+age, subset=-c(6, 24))
Model2
summary(Model2)
confint(Model2)
anova(Model2)

#Check for the best model among Model1 and Model2(F- test)
anova(Model1,Model2)

#Third linear regression model
Model3<- lm(data=chredlin,involact~race+fire+age,subset=-c(6, 24))
Model3
summary(Model3)
confint(Model3)
anova(Model3)

#Fourth linear regression model
Model4<-lm(data=chredlin,involact~race+fire,subset=-c(6, 24))
Model4
summary(Model4)
confint(Model4)
anova(Model4)

Model4_residuals<- Model4$residuals
Model1_residuals
hist(Model1_residuals)
hist(Model1)
hist(Model4_residuals)


#Check for the best model among Model2 and Model3(F- test)
anova(Model2,Model3)

anova(Model3,Model4)


#Check the normality of final model(Model3)
Model3_residuals<- Model3$residuals
hist(Model3_residuals)


prplot (Model, 1)
