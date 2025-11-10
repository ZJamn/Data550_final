# 03_make_output.R
# Generate Figure 1: Diabetes prevalence by age group

library(ggplot2)
library(dplyr)
library(scales)
library(readr)

# --- Load cleaned dataset ---
dat <- read_csv("data/clean_data.csv")

# --- Prepare Age group labels ---
age_labs <- c("18–24","25–29","30–34","35–39","40–44","45–49",
              "50–54","55–59","60–64","65–69","70–74","75–79","80+")

dat$AgeGrp <- factor(dat$Age, levels = 1:13, labels = age_labs)

# --- Handle Diabetes variable ---
# If dataset already has Diabetes_binary, use it directly
# Otherwise derive it from Diabetes_012 (0/1/2 coding)
if ("Diabetes_binary" %in% names(dat)) {
  dat$Diabetes_binary <- as.character(dat$Diabetes_binary)
} else if ("Diabetes_012" %in% names(dat)) {
  dat$Diabetes_binary <- ifelse(dat$Diabetes_012 == 2, "Diabetes", "No Diabetes")
} else {
  stop("No Diabetes variable found in dataset (expect Diabetes_binary or Diabetes_012)")
}

# --- Calculate prevalence by Age group ---
prev_age <- dat %>%
  filter(!is.na(AgeGrp)) %>%
  mutate(diabetes_binary = as.integer(Diabetes_binary == "Diabetes")) %>%
  group_by(AgeGrp) %>%
  summarise(prevalence = mean(diabetes_binary, na.rm = TRUE), .groups = "drop")

# --- Plot Figure 1 ---
fig <- ggplot(prev_age, aes(x = AgeGrp, y = prevalence)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = scales::percent(prevalence, accuracy = 0.1)),
            vjust = -0.25, size = 3) +
  scale_y_continuous(limits = c(0, 1), labels = scales::percent) +
  labs(
    title = "Figure 1. Diabetes prevalence by age group",
    x = "Age group",
    y = "Prevalence"
  ) +
  theme_minimal(base_size = 13)

# --- Save output figure ---
ggsave("output/diabetes_by_age.png", fig, width = 7, height = 5)
cat("✅ Figure saved to output/diabetes_by_age.png\n")

