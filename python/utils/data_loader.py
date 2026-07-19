"""Data loading and train/test split utilities."""

from pathlib import Path

import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split


def load_processed_data(path: str = "data/processed/phenotypes_clean.csv") -> pd.DataFrame:
    file_path = Path(path)
    if not file_path.exists():
        raise FileNotFoundError(
            f"Processed data not found at {file_path}. Run R/scripts/01_data_prep.R first."
        )
    return pd.read_csv(file_path)


def make_splits(df: pd.DataFrame, target_col: str, test_size: float = 0.2, seed: int = 42):
    X = df.drop(columns=[target_col]).select_dtypes(include=[np.number]).values
    y = df[target_col].values
    return train_test_split(X, y, test_size=test_size, random_state=seed)
