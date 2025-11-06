# Data550 Final Project: Diabetes Health Indicators

This repository contains the final project for DATA 550, analyzing the 2015 BRFSS (Behavioral Risk Factor Surveillance System) **Diabetes Health Indicators** dataset. The goal is to identify key demographic, behavioral, and clinical risk factors associated with diabetes and to demonstrate a reproducible workflow from data cleaning to model-based interpretation.

## Why this project
Diabetes is a prevalent and preventable chronic disease. Large-scale survey data such as BRFSS allow us to quantify how risk varies by age, sex, BMI, lifestyle (e.g., smoking, physical activity), and comorbidities (e.g., high blood pressure). This project asks:
- Which factors are most strongly associated with diabetes status?
- How well can we predict diabetes using routinely collected indicators?
- What actionable patterns (e.g., by BMI or lifestyle) emerge from the data?

## Data
- **Dataset:** Diabetes Health Indicators (BRFSS 2015, cleaned version)
- **Rows:** ~250k survey respondents; **Outcome:** binary diabetes status
- **Source:** Kaggle – Diabetes Health Indicators Dataset (BRFSS 2015)

## Methods (overview)
1. **Data cleaning**: import, variable recoding, handling missing values.
2. **Modeling**: logistic regression for inference; a simple ML baseline (e.g., random forest) for prediction.
3. **Outputs**: one summary **table** of key coefficients/metrics and at least one **figure** (e.g., diabetes prevalence by BMI category or ROC curve).
4. **Reproducibility**: a `Makefile` builds the entire report from scripts and R Markdown.

## Repository structure
```

Data550_final/
├─ data/
│ └─ diabetes_binary_health_indicators_BRFSS2015.csv
├─ code/
│ ├─ 01_data_clean.R # data import & cleaning
│ ├─ 02_analysis.R # regression & ML modeling
│ └─ 03_make_output.R # figures & tables
├─ report/
│ ├─ final_report.Rmd # main R Markdown
│ └─ report.html # rendered output (built)
├─ Makefile # one-command build
└─ README.md
```
