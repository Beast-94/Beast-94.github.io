## 01_data_prep.R
## Load raw phenotype/genotype data, clean, and write processed data for downstream analysis.

library(dplyr)
library(readr)

source("R/functions/data_helpers.R")

raw_path <- "data/raw/phenotypes.csv"
out_path <- "data/processed/phenotypes_clean.csv"

if (!file.exists(raw_path)) {
  stop("Raw data not found at ", raw_path, ". Place your data file there or update the path.")
}

df <- read_csv(raw_path, show_col_types = FALSE) |>
  clean_column_names() |>
  drop_incomplete_rows()

write_csv(df, out_path)
message("Wrote cleaned data to ", out_path)
