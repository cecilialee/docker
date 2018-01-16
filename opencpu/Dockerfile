FROM opencpu/base

# Install development tools
RUN \
  apt-get install -y rstudio-server r-base-dev sudo curl git libcurl4-openssl-dev libssl-dev libxml2-dev libssh2-1-dev

RUN apt-get update && apt-get install nano

# Required for some R packages
RUN apt-get install libpq-dev -y

RUN apt-get install git -y

RUN apt-get install libssl-dev -y

# Install R Packages
RUN R -e "install.packages(c('shiny', 'dplyr', 'DT', 'digest', 'shinydashboard'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('RPostgreSQL'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('devtools', 'roxygen2', 'stringr', 'tidyr', 'lubridate'), repos = 'http://cran.rstudio.com')"

CMD /usr/lib/rstudio-server/bin/rserver && apachectl -DFOREGROUND

