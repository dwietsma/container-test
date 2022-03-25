
# Base image https://hub.docker.com/u/rocker/
FROM rocker/tidyverse:3.6.2

# install required computer libraries
# RUN apt-get update && apt-get install -y \
#    libxyz \

# Define working directory
WORKDIR /container-test

# Copy files to container
COPY renv.lock renv.lock
COPY raw raw
COPY proc proc
COPY scripts scripts

# Install and restore R packages with RENV
ENV RENV_VERSION 0.15.4
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
RUN R -e "renv::consent(provided = T)"
RUN R -e "renv::restore()"
