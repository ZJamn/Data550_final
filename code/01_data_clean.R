# 01_data_clean.R — clean and subset dataset

library(here)
library(dplyr)

csv_path <- here("data", "diabetes_binary_health_indicators_BRFSS2015.csv")
stopifnot(file.exists(csv_path))  
data <- read.csv(csv_path)

clean_data <- na.omit(data)
set.seed(123)
clean_data <- clean_data %>% sample_n(min(10000, nrow(clean_data)))

if ("Diabetes_binary" %in% names(clean_data)) {
  clean_data$Diabetes_binary <- factor(clean_data$Diabetes_binary,
                                       levels = c(0, 1),
                                       labels = c("No", "Diabetes"))
}

clean_data$PhysActivity <- factor(clean_data$PhysActivity, levels = c(0,1), labels = c("No","Yes"))
clean_data$HighBP       <- factor(clean_data$HighBP,       levels = c(0,1), labels = c("No","Yes"))


save(clean_data, file = "data/clean_data.RData")
write.csv(clean_data, "data/clean_data.csv", row.names = FALSE)
cat("✅ Data cleaning complete. Saved to data/clean_data.csv\n")


