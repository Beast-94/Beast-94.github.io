## 02_mixed_models.R
## Fit mixed models for BLUP estimation and heritability, using processed data.

library(lme4)
library(readr)
library(dplyr)

df <- read_csv("data/processed/phenotypes_clean.csv", show_col_types = FALSE)

## Example mixed model: trait ~ genotype (random) + rep (random)
## Adjust formula to match your actual column names/design
model <- lmer(trait ~ (1 | genotype) + (1 | rep), data = df)

print(summary(model))

## Extract variance components for heritability calculation
vc <- as.data.frame(VarCorr(model))
var_g <- vc$vcov[vc$grp == "genotype"]
var_resid <- vc$vcov[vc$grp == "Residual"]
n_reps <- length(unique(df$rep))

h2 <- var_g / (var_g + (var_resid / n_reps))
message("Broad-sense heritability (H2): ", round(h2, 3))

saveRDS(model, "results/models/mixed_model_trait.rds")
