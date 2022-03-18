
library(tidyverse)
library(janitor)
library(devtools)


# -------------------------------------------------------------------------

df <- tibble("A" = 1:3,
             "b" = c("x", "y", "z")) %>% 
  clean_names()

df %>% 
  write_csv(snakemake@output[["output_file"]])


# write output file to test R package versions ----------------------------

session_info <- sessionInfo()

session_info %>% 
writeLines(snakemake@output[["session_info"]])

# test 