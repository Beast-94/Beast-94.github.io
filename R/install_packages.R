## install_packages.R
## Bootstrap script: installs required packages and initializes renv.
## Run this once locally (R must be installed) to generate renv.lock.
##
##   Rscript R/install_packages.R
##   Then commit the generated renv.lock file.

if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

pkgs <- c(
  "dplyr",
  "readr",
  "tidyr",
  "ggplot2",
  "lme4",       # mixed models
  "lmerTest",   # p-values for lme4 models
  "emmeans",    # BLUE/BLUP extraction
  "agricolae",  # AMMI/GGE and field trial tools
  "metan",      # AMMI/GGE biplots, MTSI
  "here",       # path handling
  "testthat"    # unit testing
)

install.packages(setdiff(pkgs, rownames(installed.packages())))

renv::init(bare = TRUE)
renv::snapshot()

message("renv.lock generated. Commit it to version control.")
