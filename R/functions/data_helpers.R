## data_helpers.R
## Reusable helper functions for data cleaning and prep.
## Source this file from analysis scripts; do not run directly.

clean_column_names <- function(df) {
  names(df) <- tolower(gsub("[^A-Za-z0-9_]", "_", names(df)))
  df
}

drop_incomplete_rows <- function(df, threshold = 0.5) {
  # Drop rows with more than `threshold` proportion of missing values
  keep <- rowMeans(is.na(df)) <= threshold
  df[keep, , drop = FALSE]
}
