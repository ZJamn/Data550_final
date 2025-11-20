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
2. **Modeling**: logistic regression for inference。
3. **Outputs**: one summary **table** of key coefficients/metrics and at least one **figure**.
4. **Reproducibility**: a `Makefile` builds the entire report from scripts and R Markdown.

## Repository structure
```

Data550_final/
├── data/
│   ├── diabetes_binary_health_indicators_BRFSS2015.csv
│   ├── clean_data.RData
│   └── clean_data.csv
├── code/
│   ├── 01_data_clean.R
│   ├── 02_analysis.R
│   └── 03_make_output.R
├── output/
│   ├── model_summary.txt
│   └── diabetes_by_age.png
├── report/
│   ├── final_report.Rmd
│   └── final_report.html
├── renv/
│   ├── activate.R
│   └── settings.json
├── renv.lock
├── Makefile
└── README.md

```

## How to reproduce
```bash
1. clone and enter
git clone git@github.com:ZJamn/Data550_final.git
cd Data550_final


2. Restore the R environment (renv)
make install

3. Build the final report (creates report/report.html)
make report.html

Key components:
- Required table: generated in code/03_make_output.R  
- Required figure: generated in code/03_make_output.R  
- Final report source: report/final_report.Rmd  
- Rendered output: report/final_report.html  
- Build rules: see Makefile  
```


