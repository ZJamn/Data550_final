# Makefile for DATA 550 Final Project
install:
	Rscript -e "renv::restore()"

report.html: code/01_data_clean.R code/02_analysis.R code/03_make_output.R report/final_report.Rmd data/diabetes_binary_health_indicators_BRFSS2015.csv
	Rscript code/01_data_clean.R
	Rscript code/02_analysis.R
	Rscript code/03_make_output.R
	Rscript -e "rmarkdown::render('report/final_report.Rmd', output_file='final_report.html', quiet=TRUE)"

clean:
	rm -f report/final_report.html

docker-report:
	docker build -t zjamn/data550_final .
	mkdir -p report
	docker run --rm -v "$$(PWD)"/report:/project/report zjamn/data550_final
