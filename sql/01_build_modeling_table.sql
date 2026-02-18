-- SQL to create modeling table from raw churn data
DROP TABLE IF EXISTS telco_modeling;

CREATE TABLE telco_modeling AS
SELECT
  customerID,
  churn,
  tenure,
  MonthlyCharges,
  TotalCharges,

  -- Create a bucketed tenure category (easier to interpret than raw tenure)
  CASE
    WHEN tenure IS NULL THEN NULL
    WHEN tenure < 6 THEN '0-5'
    WHEN tenure < 12 THEN '6-11'
    WHEN tenure < 24 THEN '12-23'
    WHEN tenure < 48 THEN '24-47'
    ELSE '48+'
  END AS tenure_bucket,

  -- Categorical fields used by the model
  gender,
  SeniorCitizen,
  Partner,
  Dependents,
  PhoneService,
  MultipleLines,
  InternetService,
  OnlineSecurity,
  OnlineBackup,
  DeviceProtection,
  TechSupport,
  StreamingTV,
  StreamingMovies,
  Contract,
  PaperlessBilling,
  PaymentMethod
FROM telco_raw;
