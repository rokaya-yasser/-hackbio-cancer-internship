# Load necessary libraries
library(ggplot2)

# Load the dataset
data <- read.csv("https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/nhanes.csv")

# Process NAs by converting to zero
data[is.na(data)] <- 0

# Check the column names to find the correct one for Alcohol Year
print(colnames(data))

# Visualize distributions with histograms
par(mfrow=c(2,2))
hist(data$BMI, main="BMI Distribution", xlab="BMI", col="lightblue")
hist(data$Weight, main="Weight Distribution", xlab="Weight", col="lightgreen")
hist(data$Weight * 2.2, main="Weight in Pounds Distribution", xlab="Weight (lbs)", col="lightyellow")
hist(data$Age, main="Age Distribution", xlab="Age", col="lightcoral")

# Mean 60-second pulse rate
mean_pulse_rate <- mean(data$Pulse.Rate, na.rm=TRUE)
cat("Mean 60-second pulse rate:", mean_pulse_rate, "\n")

# Range of values for diastolic blood pressure
diastolic_range <- range(data$Diastolic.Blood.Pressure, na.rm=TRUE)
cat("Range of Diastolic Blood Pressure:", diastolic_range, "\n")

# Variance and standard deviation for income
income_variance <- var(data$Income, na.rm=TRUE)
income_sd <- sd(data$Income, na.rm=TRUE)
cat("Variance of Income:", income_variance, "\n")
cat("Standard Deviation of Income:", income_sd, "\n")

# Visualize relationship between weight and height, colored by gender
ggplot(data, aes(x = Height, y = Weight, color = factor(Gender))) +
  geom_point() +
  labs(title="Weight vs Height by Gender", x="Height", y="Weight") +
  theme_minimal()

# Recode the Diabetes variable to binary
data$DiabetesBinary <- ifelse(data$Diabetes == "Yes", "Diabetic", "Non-Diabetic")

# Conduct t-test between Age and Gender
t_test_age_gender <- t.test(Age ~ Gender, data = data)
print(t_test_age_gender)

# Conduct t-test between BMI and Diabetes
t_test_bmi_diabetes <- t.test(BMI ~ DiabetesBinary, data = data)
print(t_test_bmi_diabetes)

install.packages("tidyr")
library(tidyr) 

# Replace NAs with zero for numeric columns, but replace NAs in Relationship_Status with "Unknown"
data_filled <- data %>%
  mutate(across(where(is.numeric), ~replace_na(., 0))) %>%
  mutate(RelationshipStatus = replace_na(RelationshipStatus, "Unknown"))

# Continue with your analysis...
# Example: T-test for Alcohol Year and Relationship Status
filtered_data <- data_filled[data_filled$RelationshipStatus %in% 
                               c("Married", "NeverMarried", "Widowed", "LivePartner", "Separated", "Divorced", "Unknown"), ]

if (nrow(filtered_data) >= 2) {
  t_test_alcohol_relationship <- t.test(AlcoholYear ~ RelationshipStatus, data = filtered_data)
  print(paste("T-Test P-Value between Alcohol Year and Relationship Status:", t_test_alcohol_relationship$p.value))
} else {
  print("Not enough data for T-Test between Alcohol Year and Relationship Status.")
}

install.packages("readr")
library(readr)

data <- read_csv("NationalNutitionalHealth.csv")
print(data)

ls()
# List of objects in the environment
object_names <- ls()

# Extracting objects
data <- get("data")                
diastolic_range <- get("diastolic_range")
income_sd <- get("income_sd")
income_variance <- get("income_variance")
mean_pulse_rate <- get("mean_pulse_rate")
t_test_age_gender <- get("t_test_age_gender")
t_test_bmi_diabetes <- get("t_test_bmi_diabetes")
print(mean_pulse_rate)
print(t_test_age_gender)
print(t_test_bmi_diabetes)

# Step 1: Save all specified objects to an .RData file
save(data, diastolic_range, income_sd, income_variance, 
     mean_pulse_rate, t_test_age_gender, t_test_bmi_diabetes,
     file = "my_data_objects.RData")  

# Step 2: Save data frames as CSV files (if applicable)
# Check if 'data' is a data frame and save it
if (is.data.frame(data)) {
  write.csv(data, "data.csv", row.names = FALSE)
}

# Check if 't_test_age_gender' is a data frame and save it
if (is.data.frame(t_test_age_gender)) {
  write.csv(t_test_age_gender, "t_test_age_gender.csv", row.names = FALSE)
}

# Check if 't_test_bmi_diabetes' is a data frame and save it
if (is.data.frame(t_test_bmi_diabetes)) {
  write.csv(t_test_bmi_diabetes, "t_test_bmi_diabetes.csv", row.names = FALSE)
}
