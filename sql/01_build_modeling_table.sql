-- SQL to create modeling table from raw churn data
CREATE TABLE telco_model AS
SELECT customerID,
       gender,
       SeniorCitizen,
       tenure,
       MonthlyCharges,
       TotalCharges,
       Churn
FROM telco_raw;
