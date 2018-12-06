FROM rocker/shiny

RUN apt-get update && apt-get install nano

# Required for some R packages
RUN apt-get update && apt-get install -y libpq-dev git libssl-dev nano wget libxml2-dev libcurl4-openssl-dev

# Install R Packages
RUN R -e "install.packages(c('shiny', 'shinyjs', 'DT', 'shinyalert', 'shinydashboard', 'shinyWidgets', 'shinyBS', 'highcharter'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('RPostgreSQL', 'digest'), repos = 'http://cran.rstudio.com')"

RUN R -e "install.packages(c('devtools', 'roxygen2', 'tidyverse', 'lubridate', 'readxl', 'rmarkdown'), repos = 'http://cran.rstudio.com')"

RUN R -e "devtools::install_github('massmutual/dcr')"

RUN R -e "install.packages(c('tidyverse'), repos = 'http://cran.rstudio.com')"

# Copy utility files
COPY init.R /

# Clear app folder
RUN cd /srv/shiny-server && rm -r *

WORKDIR /srv/shiny-server

RUN mkdir /root/.ssh

EXPOSE 3838

RUN echo '#!/bin/bash' > /init.sh
RUN echo '\ncp /files/id_rsa /root/.ssh/id_rsa' >> /init.sh
RUN echo 'ssh -o "StrictHostKeyChecking=no" git@bitbucket.org' >> /init.sh
RUN echo 'ssh -o "StrictHostKeyChecking=no" git@github.com' >> /init.sh
RUN echo '\nchmod 600 /root/.ssh/id_rsa' >> /init.sh
RUN echo '\nRscript /init.R /files/repos.yml' >> /init.sh
RUN echo '\n/usr/bin/shiny-server.sh' >> /init.sh

RUN chmod 777 /init.sh

CMD ["/init.sh"]
