# Makefile for DATA 550 Final Project

report.html: code/01_data_clean.R code/02_analysis.R code/03_make_output.R report/final_report.Rmd data/diabetes_binary_health_indicators_BRFSS2015.csv
	Rscript code/01_data_clean.R
	Rscript code/02_analysis.R
	Rscript code/03_make_output.R
	Rscript -e "rmarkdown::render('report/final_report.Rmd', output_file = 'report.html')"

clean:
	rm -f report/report.html
