"""
Train entry point.

Usage:
    python python/scripts/train.py --target trait --epochs 50
"""

import argparse
import sys
from pathlib import Path

# Allow running as `python python/scripts/train.py` from repo root
sys.path.append(str(Path(__file__).resolve().parents[2]))

from python.models.genomic_prediction import build_mlp_model
from python.utils.data_loader import load_processed_data, make_splits


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", type=str, default="trait", help="Target column name")
    parser.add_argument("--epochs", type=int, default=50)
    parser.add_argument("--batch-size", type=int, default=32)
    args = parser.parse_args()

    df = load_processed_data()
    X_train, X_test, y_train, y_test = make_splits(df, target_col=args.target)

    model = build_mlp_model(input_dim=X_train.shape[1])
    model.fit(
        X_train, y_train,
        validation_data=(X_test, y_test),
        epochs=args.epochs,
        batch_size=args.batch_size,
        verbose=2,
    )

    model.save("results/models/genomic_prediction_model.keras")
    print("Model saved to results/models/genomic_prediction_model.keras")


if __name__ == "__main__":
    main()
