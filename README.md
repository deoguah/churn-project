# Telco Customer Churn Prediction – End-to-End Data Science Project

## Overview
This project demonstrates a full end-to-end data science workflow using the Telco Customer Churn dataset.  
The goal is to **predict whether a customer will churn** (leave the company) based on their account information, usage, and demographics.  

This project mirrors real-world workflows in data science teams, including data cleaning, feature engineering, SQL-based modeling, exploratory analysis, machine learning, and results visualization.

---

## Repository Structure
```
churn_project/
├── data/
│   └── Telco-Customer-Churn.csv
│
├── sql/
│   └── 01_build_modeling_table.sql
│
├── notebooks/
│   └── 01_eda_and_modeling.ipynb
│
├── src/
│   └── train_model.py
│
├── outputs/
│   ├── figures/
│   │   ├── monthlycharges_hist.png
│   │   ├── churn_by_contract.png
│   │   └── churn_by_tenure_bucket.png
│   │
│   ├── metrics.json
│   ├── logreg_coefficients.csv
│   ├── top_50_retention_targets.csv
│   └── churn.db
│
├── README.md
└── requirements.txt
```

---

## Data

- **Source:** [Telco Customer Churn dataset](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)  
- **Description:** Contains information about customer accounts, tenure, subscription details, monthly charges, and churn status.
- **Columns include:**  
  - `customerID` – Unique customer identifier  
  - `gender` – Male or Female  
  - `SeniorCitizen` – 1 if senior, 0 otherwise  
  - `tenure` – Number of months with the company  
  - `MonthlyCharges` – Amount billed monthly  
  - `TotalCharges` – Total billed  
  - `Churn` – Target variable (Yes/No)

---

## Approach

1. **Data Cleaning:**  
   - Handle missing or invalid values  
   - Convert categorical variables to numeric where needed  
   - Drop duplicate or unnecessary columns  

2. **Feature Engineering:**  
   - Create meaningful features (e.g., `tenure_bucket`)  
   - Transform skewed variables  

3. **SQL Modeling:**  
   - Create clean, analytical tables from raw CSV data using SQL  
   - Separate data preparation from modeling  

4. **Exploratory Data Analysis (EDA):**  
   - Visualize relationships between features and churn  
   - Identify patterns and anomalies  

5. **Machine Learning:**  
   - Train classification models (e.g., Logistic Regression, Random Forest)  
   - Evaluate using accuracy, precision, recall, and ROC-AUC  

6. **Results and Visualization:**  
   - Output charts and model metrics  
   - Save key performance metrics in `outputs/metrics.json`  

---

## Key Learnings

- Full end-to-end workflow in Python and SQL  
- Handling messy real-world data  
- Feature engineering for predictive modeling  
- Model evaluation and interpretation  
- Structuring projects for reproducibility  

---

## How to Run

1. Install dependencies:

```bash
pip install -r requirements.txt
```

2. Run notebooks in order:
01_eda_and_modeling.ipynb

3. Run production script:
```
python src/train_model.py
```

Outputs (figures, metrics) will be saved in outputs/
