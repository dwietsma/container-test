
# the rocker/tidyverse image already comes with devtools
# use devtools, to install a specific version of renv
library(devtools)

# install specific version of renv
devtools::install_version("renv",
                          version = "0.15.4",
                          repos = "https://cran.rstudio.com/")

# call renv constent to give permission
renv::consent(provided = T)

# use renv to install all necessary R packages with renv
renv::restore()
