
library(tidyverse)
library(janitor)
library(devtools)

# -------------------------------------------------------------------------

df <- tibble("A" = 1:3,
             "b" = c("x", "y", "z")) %>% 
  clean_names()

df %>% 
  write_csv("proc/output.csv")
  # write_csv(snakemake@output[["output_file"]])


# write output file to test R package versions ----------------------------

session_info <- capture.output(sessionInfo())

run_time <- paste("Script run at:", Sys.time())

output_text <- c(run_time, session_info)

output_text %>%
  writeLines("proc/session-info.txt")
# writeLines(snakemake@output[["session_info"]])

