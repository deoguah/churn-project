# src/train_model.py

import pandas as pd
import sqlite3
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, precision_score, recall_score, roc_auc_score
import json

# Connect to SQLite DB
con = sqlite3.connect("telco_churn.db")
df = pd.read_sql("SELECT * FROM telco_modeling", con)

# Prepare features and target
X = df.drop(columns=["churn", "customerID"])
y = df["churn"].map({"Yes": 1, "No": 0})  # Convert to 0/1

# Train/test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train a random forest
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Predict
y_pred = model.predict(X_test)

# Evaluate
metrics = {
    "accuracy": accuracy_score(y_test, y_pred),
    "precision": precision_score(y_test, y_pred),
    "recall": recall_score(y_test, y_pred),
    "roc_auc": roc_auc_score(y_test, y_pred)
}

# Save metrics to JSON
with open("outputs/metrics.json", "w") as f:
    json.dump(metrics, f)

print("Model training complete. Metrics saved to outputs/metrics.json")
