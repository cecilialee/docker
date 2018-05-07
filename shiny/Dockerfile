FROM rocker/shiny

RUN apt-get update && apt-get install nano

# Required for some R packages
RUN apt-get update && apt-get install libpq-dev -y

RUN apt-get update && apt-get install git -y

RUN apt-get update && apt-get install libssl-dev -y

# Install R Packages
RUN R -e "install.packages(c('shiny', 'dplyr', 'DT', 'digest', 'shinydashboard'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('RPostgreSQL'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('devtools', 'roxygen2', 'stringr', 'tidyr', 'lubridate'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('shinyBS', 'shinyjs', 'shinyWidgets'), repos = 'http://cran.rstudio.com')"

# Mongo
RUN apt-get update && apt-get install -y libssl-dev libsasl2-dev
RUN R -e "install.packages(c('mongolite'), repos = 'http://cran.rstudio.com')"

EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"]
