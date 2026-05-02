-- =============================================
-- PROJECT: Customer Churn Analysis
-- TOOL: Microsoft SQL Server (SSMS 22)
-- DESCRIPTION: Analyzing 1,000 telecom customers 
-- to identify key drivers of churn and high risk 
-- customer profiles
-- AUTHOR: Toluwanimi Awofisayo
-- =============================================


-- Query 1: Overall Churn Rate
-- Purpose: Establish the baseline churn rate across all customers
-- This is always the first step in any churn analysis - 
-- you need to know how bad the problem is before investigating why
SELECT 
    COUNT(*) AS TotalCustomers,
    SUM(Churn) AS ChurnedCustomers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM customer_churn;


-- Query 2: Churn by Contract Type
-- Purpose: Determine whether contract length affects customer loyalty
-- Hypothesis: Customers with shorter contracts have less commitment 
-- and are therefore more likely to leave
SELECT 
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(Churn) AS ChurnedCustomers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM customer_churn
GROUP BY Contract
ORDER BY ChurnRate DESC;


-- Query 3: Churn by Internet Service Type
-- Purpose: Identify whether the type of internet service 
-- influences churn rate
-- Hypothesis: Fiber Optic customers paying premium prices 
-- may have higher expectations and churn more if those 
-- expectations are not met
SELECT 
    InternetService,
    COUNT(*) AS TotalCustomers,
    SUM(Churn) AS ChurnedCustomers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM customer_churn
GROUP BY InternetService
ORDER BY ChurnRate DESC;


-- Query 4: Churn by Tech Support
-- Purpose: Assess whether access to technical support 
-- improves customer retention
-- Hypothesis: Customers without tech support feel abandoned 
-- when issues arise and are more likely to switch providers
SELECT 
    TechSupport,
    COUNT(*) AS TotalCustomers,
    SUM(Churn) AS ChurnedCustomers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM customer_churn
GROUP BY TechSupport
ORDER BY ChurnRate DESC;


-- Query 5: Churn by Number of Complaints
-- Purpose: Determine if complaint volume is an early warning 
-- signal for churn
-- Hypothesis: The more complaints a customer makes, the more 
-- frustrated they are and the more likely they are to leave
-- Key insight: Identifies the complaint threshold that triggers churn
SELECT 
    Complaints,
    COUNT(*) AS TotalCustomers,
    SUM(Churn) AS ChurnedCustomers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM customer_churn
GROUP BY Complaints
ORDER BY Complaints ASC;


-- Query 6: Churn by Payment Method
-- Purpose: Investigate whether payment method influences churn
-- Hypothesis: Customers on automatic payments are more committed 
-- while manual payment customers actively reconsider every billing cycle
SELECT 
    PaymentMethod,
    COUNT(*) AS TotalCustomers,
    SUM(Churn) AS ChurnedCustomers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY ChurnRate DESC;


-- Query 7: Average Monthly Charges - Churned vs Retained
-- Purpose: Determine whether price is a driver of churn
-- Hypothesis: Churned customers may be paying more and 
-- feeling they are not getting value for money
-- Note: CASE WHEN converts 1s and 0s in Churn column 
-- into readable labels (Churned/Retained)
SELECT 
    CASE WHEN Churn = 1 THEN 'Churned' ELSE 'Retained' END AS CustomerStatus,
    COUNT(*) AS TotalCustomers,
    ROUND(AVG(MonthlyCharges), 2) AS AvgMonthlyCharges,
    ROUND(AVG(TotalCharges), 2) AS AvgTotalCharges
FROM customer_churn
GROUP BY Churn;


-- Query 8: Churn by Tenure Group
-- Purpose: Identify which stage of the customer lifecycle 
-- carries the highest churn risk
-- Note: CASE WHEN is used here to bin continuous tenure values 
-- into meaningful groups - this technique is called binning
-- Hypothesis: Newer customers have not yet built loyalty 
-- and are more likely to leave
SELECT 
    CASE 
        WHEN Tenure BETWEEN 1 AND 12 THEN '0-1 Year'
        WHEN Tenure BETWEEN 13 AND 24 THEN '1-2 Years'
        WHEN Tenure BETWEEN 25 AND 36 THEN '2-3 Years'
        WHEN Tenure BETWEEN 37 AND 48 THEN '3-4 Years'
        WHEN Tenure BETWEEN 49 AND 72 THEN '4+ Years'
    END AS TenureGroup,
    COUNT(*) AS TotalCustomers,
    SUM(Churn) AS ChurnedCustomers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM customer_churn
GROUP BY 
    CASE 
        WHEN Tenure BETWEEN 1 AND 12 THEN '0-1 Year'
        WHEN Tenure BETWEEN 13 AND 24 THEN '1-2 Years'
        WHEN Tenure BETWEEN 25 AND 36 THEN '2-3 Years'
        WHEN Tenure BETWEEN 37 AND 48 THEN '3-4 Years'
        WHEN Tenure BETWEEN 49 AND 72 THEN '4+ Years'
    END
ORDER BY ChurnRate DESC;


-- Query 9: High Risk Customer Profile
-- Purpose: Combine multiple risk factors to identify the exact 
-- customer segments most likely to churn
-- This moves the analysis from describing the problem to 
-- identifying specifically WHO the problem customers are
-- HAVING filters grouped results to only show segments 
-- with churn rate above 50% - the truly critical segments
-- Note: This output can be used as a direct action list 
-- for the customer retention team
SELECT 
    Contract,
    InternetService,
    TechSupport,
    COUNT(*) AS TotalCustomers,
    SUM(Churn) AS ChurnedCustomers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM customer_churn
GROUP BY Contract, InternetService, TechSupport
HAVING ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) > 50
ORDER BY ChurnRate DESC;