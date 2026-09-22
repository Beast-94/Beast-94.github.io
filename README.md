# Project Name

Deep learning (TensorFlow) and quantitative genetics (R) pipeline for [trait/species — e.g. genomic prediction in Urochloa forages].

## Overview

This repository combines:
- **Python/TensorFlow** — genomic prediction / trait modeling (e.g. genomic selection from GBS data, NIRS calibration models)
- **R** — quantitative genetics workflows: BLUP/BLUE estimation, mixed models, AMMI/GGE biplots, GWAS, heritability

## Repository structure

```
.
├── data/
│   ├── raw/              # Original, immutable data (not committed — see .gitignore)
│   ├── processed/        # Cleaned/derived data ready for analysis
│   └── external/         # Third-party reference data
├── R/
│   ├── functions/        # Reusable R functions (sourced, not scripts)
│   └── scripts/          # Numbered analysis scripts (01_..., 02_...)
├── python/
│   ├── models/           # Model architectures (TF/Keras)
│   ├── scripts/          # Training/eval entry points
│   └── utils/            # Data loaders, preprocessing, metrics
├── notebooks/            # Exploratory Jupyter/Rmd notebooks (not for pipeline logic)
├── results/
│   ├── figures/
│   ├── tables/
│   └── models/           # Saved model weights/checkpoints (large files via Git LFS or excluded)
├── tests/
│   ├── r/                # testthat tests
│   └── python/           # pytest tests
├── docs/                 # Extended documentation, methods notes
├── renv.lock              # R package versions (renv)
├── requirements.txt       # Python package versions
└── .github/workflows/     # CI: lint + test on push/PR
```

## Setup

### R environment
First time (no renv.lock yet):
```bash
Rscript R/install_packages.R   # installs packages, initializes renv, writes renv.lock
```
Afterwards, anyone cloning the repo just runs:
```r
renv::restore()   # installs exact package versions from renv.lock
```

### Python environment
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Usage

Run R analysis scripts in order:
```bash
Rscript R/scripts/01_data_prep.R
Rscript R/scripts/02_mixed_models.R
```

Train/evaluate TensorFlow models:
```bash
python python/scripts/train.py --target trait --epochs 50
```

## Data

Raw data is not tracked in git (see `.gitignore`). 

## Portfolio / CV site (free link)

`docs/index.html` is a self-contained CV and project page, ready for **GitHub Pages**.

Published as `https://beast-94.github.io`:
1. Repository to `Beast-94.github.io` 
2. Push to GitHub
3. In the repo, **Settings → Pages**, set **Source** to `Deploy from a branch`, branch `main`, folder `/docs`. Save.
4. Site live at `https://beast-94.github.io`

Page- `https://beast-94.github.io/<repo-name>/` 

CV content MODS `docs/index.html` 

## Push to GitHub

```bash
git remote add origin https://github.com/Beast-94/Beast-94.github.io.git
git branch -M main
git push -u origin main
```

## Citation

If you use this repository, please cite: Kimani et al., 2026

## License

[MIT / CC-BY-4.0 /]
