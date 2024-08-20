## Correlation
# Set working directory and read in data
setwd("~/Documents/Work/BIOS 591P 2024/Recitation Sessions/20240205 Session 1")
na_bp_data <- read.csv("./Data/sodium intake and bp.csv")

View(na_bp_data)
dim(na_bp_data)
names(na_bp_data)

# Create scatterplot
plot(na_bp_data$Sodium,na_bp_data$BP)

# Create prettier scatterplot
plot(na_bp_data$Sodium,na_bp_data$BP,main="Blood pressure vs. Sodium",xlab="Sodium",ylab="Blood Pressure",pch=19)

# Calculate correlation
cor(na_bp_data)

# Conduct correlation test
cor.test(na_bp_data$BP,na_bp_data$Sodium)

na_bp_test <- cor.test(na_bp_data$BP,na_bp_data$Sodium)