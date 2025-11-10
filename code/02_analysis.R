# --- Logistic Regression Model ---
library(dplyr)
load("data/clean_data.RData")

dat <- clean_data %>%
  mutate(
    PhysActivity = case_when(
      PhysActivity %in% c(1, "1", "Yes", "YES") ~ 1L,
      PhysActivity %in% c(0, "0", "No", "NO")  ~ 0L,
      TRUE ~ NA_integer_
    ),
    HighBP = case_when(
      HighBP %in% c(1, "1", "Yes", "YES") ~ 1L,
      HighBP %in% c(0, "0", "No", "NO")  ~ 0L,
      TRUE ~ NA_integer_
    )
  )

dat$diabetes_bin <- ifelse(dat$Diabetes_binary %in% c(1, "1", "Yes", "Diabetes"), 1L, 0L)

fit <- glm(diabetes_bin ~ Age + BMI + factor(PhysActivity) + factor(HighBP),
           data = dat, family = binomial())

summary_text <- capture.output(summary(fit))
writeLines(summary_text, "output/model_summary.txt")
cat("✅ Model summary saved to output/model_summary.txt\n")

