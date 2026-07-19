test_that("clean_column_names lowercases and replaces special chars", {
  df <- data.frame(`Trait Name` = 1, `Rep#` = 2, check.names = FALSE)
  out <- clean_column_names(df)
  expect_equal(names(out), c("trait_name", "rep_"))
})

test_that("drop_incomplete_rows removes rows above missing threshold", {
  df <- data.frame(a = c(1, NA, 3), b = c(1, NA, NA))
  out <- drop_incomplete_rows(df, threshold = 0.5)
  expect_equal(nrow(out), 2)
})
