## Simple Linear Regression
# Enter data
age_muscle_data <- data.frame("woman" = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16),
                              "age" = c(71,64,43,67,56,73,68,56,76,65,45,58,45,53,49,78),
                              "mass" = c(82,91,100,68,87,73,78,80,65,84,116,76,97,100,105,77))

# Scatterplot
plot(x = age_muscle_data$age, y = age_muscle_data$mass, main = "Muscle Mass by Age", xlab = "Age (Years)",ylab = "Muscle Mass (lbs)",pch=19)

# Fit linear model
age_muscle_slr <- lm(formula = mass ~ age, data = age_muscle_data)
summary(object = age_muscle_slr)

# Get confidence intervals for predictors
confint(object = age_muscle_slr)

# Get prediction intervals
predict(object = age_muscle_slr, newdata = data.frame(age = 61), interval = "confidence")
predict(object = age_muscle_slr, newdata = data.frame(age = 61), interval = "predict")

# Get the ANOVA table
anova(age_muscle_slr)

# Scatterplot with lines
plot(age_muscle_data$age, age_muscle_data$mass, main = "Muscle Mass by Age", xlab = "Age (Years)", ylab = "Muscle Mass (lbs)", pch = 19)
abline(age_muscle_slr)

# Getting the confidence interval and prediction interval lines
age_values <- seq(from = min(age_muscle_data$age),to = max(age_muscle_data$age),by=1)
predict_data <- data.frame(age = age_values)
plot_ci <- data.frame(predict(age_muscle_slr, newdata = predict_data, interval = "confidence"))
plot_pi <- data.frame(predict(age_muscle_slr, newdata = predict_data, interval = "predict"))

lines(x = age_values, y = plot_ci$lwr)
lines(x = age_values, y = plot_ci$upr)

lines(x = age_values, y = plot_pi$lwr, lty = "dashed")
lines(x = age_values, y = plot_pi$upr, lty = "dashed")

# Bonus: doing this in ggplot2 (May not have time for this in class)
library(ggplot2)

data_pi <- predict(age_muscle_slr, newdata = data.frame(age = age_muscle_data$age), interval = "predict")

ggplot_data <- cbind(age_muscle_data,data_pi)

ggplot(data = ggplot_data, mapping = aes(x = age, y = mass)) + 
      geom_point(color="black") +
      geom_smooth(method = "lm", se = TRUE) +
      geom_line(aes(y = lwr),linetype = "dashed") +
      geom_line(aes(y = upr),linetype = "dashed") +
      labs(title = "Muscle Mass by Age",x = "Age (years)",y = "Muscle Mass (lbs)")
