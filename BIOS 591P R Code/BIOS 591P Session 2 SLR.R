#Correlation
#Set working directory and read in data
setwd("~/BIOS 591P/Session 2 SLR")

na_bp_data <- read.csv(file = "sodium intake and bp-1.csv")

View(na_bp_data)

#Create scatterplot
plot(na_bp_data$Sodium, na_bp_data$BP, main="Blood Pressure vs. Sodium", xlab= "Sodium", ylab = "Blood pressure" pch=19)


#Simple Linear Regression
age_muscle_data <- data.frame("woman" = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16),
                              "age" = c(71,64,43,67,56,73,68,56,76,65,45,58,45,53,49,78),
                              "mass" = c(82,91,100,68,87,73,78,80,65,84,116,76,97,100,105,77))

#Scatterplot
plot(x = age_muscle_data$age, y = age_muscle_data$mass, main = "Muscle Mass vs. Age", xlab = "Age(years)", ylab = "Muscle Mass (lbs)" , pch = 19)

#Fit linear model 
age_muscle_slr <- lm(formula = mass ~ age, data = age_muscle_data)
summary(age_muscle_slr)

age_muscle_slr <- lm(mass ~ age, age_muscle_data) #another way to do the same thing

#Confidence interval for coefficients 
confint(age_muscle_slr)

confint(age_muscle_slr, level = 0.99) #?confint

confint(age_muscle_slr, parm="age", level = 0.99)

#Confidence/prediction intervals 
predict(object = age_muscle_slr, newdata = 61, interval = "confidence")
predict(object = age_muscle_slr, newdata = data.frame("age"=61), interval = "confidence")
predict(object = age_muscle_slr, newdata = data.frame("age"=61), interval = "predict")

# ANOVA table
anova(age_muscle_slr)

##Plot linear model
plot(x = age_muscle_data$age, y = age_muscle_data$mass, main = "Muscle Mass vs. Age", xlab = "Age(years)", ylab = "Muscle Mass (lbs)" , pch = 19)
abline(age_muscle_slr)

#Confidence and prediction intervals