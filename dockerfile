# Base image https://hub.docker.com/u/rocker/
FROM rocker/tidyverse:3.6.1

# pull snakelike image
#bdocker pull snakemake/snakemake:5.8.2

# install required computer libraries
# RUN apt-get update && apt-get install -y \
#    libxyz \

## Copy install-r-packages-with-renv.R to container directory /tmp
COPY ./config/install-r-packages-with-renv.R /tmp/install-r-packages-with-renv.R
## install required R libraries
RUN Rscript /tmp/install-r-packages-with-renv.R



# create an R user
ENV USER tidyverse

## Copy your working files over
## The $USER defaults to `rstudio` but you can change this at runtime
COPY ./raw /home/$USER/raw
COPY ./proc /home/$USER/proc
COPY ./scripts /home/$USER/scripts
