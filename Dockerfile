
FROM rocker/verse:latest
WORKDIR /project

COPY . .


RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')" \
 && R -e "renv::restore(prompt = FALSE)"

RUN mkdir -p output

CMD ["make", "report.html"]
