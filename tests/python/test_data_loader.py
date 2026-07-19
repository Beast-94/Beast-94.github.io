import numpy as np
import pandas as pd
import pytest

from python.utils.data_loader import make_splits


def test_make_splits_shapes():
    df = pd.DataFrame({
        "trait": np.random.rand(20),
        "feat1": np.random.rand(20),
        "feat2": np.random.rand(20),
    })
    X_train, X_test, y_train, y_test = make_splits(df, target_col="trait", test_size=0.25)
    assert X_train.shape[0] == 15
    assert X_test.shape[0] == 5
    assert X_train.shape[1] == 2
