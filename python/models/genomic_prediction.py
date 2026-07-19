"""
Example TensorFlow/Keras model for genomic prediction / trait modeling
from tabular genotype (e.g. SNP/GBS) or NIRS spectral features.

Replace input_dim and architecture details with what fits your data.
"""

import tensorflow as tf
from tensorflow.keras import layers, models


def build_mlp_model(input_dim: int, output_dim: int = 1) -> tf.keras.Model:
    """Simple feed-forward network for continuous trait prediction."""
    model = models.Sequential([
        layers.Input(shape=(input_dim,)),
        layers.Dense(256, activation="relu"),
        layers.BatchNormalization(),
        layers.Dropout(0.3),
        layers.Dense(64, activation="relu"),
        layers.Dropout(0.2),
        layers.Dense(output_dim, activation="linear"),
    ])
    model.compile(
        optimizer=tf.keras.optimizers.Adam(learning_rate=1e-3),
        loss="mse",
        metrics=["mae"],
    )
    return model
