FROM rocker/shiny

RUN apt-get update && apt-get install nano

# Required for some R packages
RUN apt-get update && apt-get install -y libpq-dev git libssl-dev nano wget libxml2-dev libcurl4-openssl-dev

# Install R Packages
RUN R -e "install.packages(c('shiny', 'shinyjs', 'DT', 'shinyalert', 'shinydashboard', 'shinyWidgets', 'shinyBS', 'highcharter'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('RPostgreSQL', 'digest'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('devtools', 'roxygen2', 'tidyverse', 'lubridate', 'readxl', 'rmarkdown'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('tidyverse'), repos = 'http://cran.rstudio.com')"

EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"]