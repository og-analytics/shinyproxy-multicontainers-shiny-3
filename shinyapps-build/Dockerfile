FROM openanalytics/r-base

MAINTAINER Tobias Verbeke "tobias.verbeke@openanalytics.eu"

RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.0.0

# packages needed for basic shiny functionality
RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='https://cloud.r-project.org')"

# install shinyproxy package with demo shiny application
COPY shinyapps_0.0.2.tar.gz /root/
RUN R CMD INSTALL /root/shinyapps_0.0.2.tar.gz
RUN rm /root/shinyapps_0.0.2.tar.gz

# set host and port
COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e", "shinyapps::run_07_widgets()"]
