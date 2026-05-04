# 📉 Customer Churn Analysis

## Project Overview

Customer churn is one of the biggest challenges in the telecom industry. Acquiring a new customer costs significantly more than retaining an existing one, making churn analysis a critical business priority.

This project analyzes **1,000 telecom customers** using SQL to identify the key drivers of churn and pinpoint the exact customer profiles most likely to leave — enabling the business to take targeted retention action before it's too late.

---

## 🛠️ Tools Used

- **Microsoft SQL Server (SSMS 22)** — Database creation, querying, and analysis

---

## 📁 Dataset

| Property | Detail |
|---|---|
| Total Records | 1,000 customers |
| Total Features | 12 columns |
| Overall Churn Rate | 30.10% |

**Key columns include:**
- `CustomerID`, `Gender`, `Age`
- `Tenure` — how long the customer has been with the company (months)
- `Contract` — Month-to-Month, One Year, Two Year
- `InternetService` — DSL, Fiber Optic, No
- `TechSupport` — Yes, No
- `PaymentMethod` — Electronic Check, Mailed Check, Bank Transfer, Credit Card
- `MonthlyCharges`, `TotalCharges`
- `Complaints` — number of complaints made (0-5)
- `Churn` — target variable (1 = Churned, 0 = Retained)

---

## 🔍 Analysis & Key Findings

### Query 1 — Overall Churn Rate
The baseline churn rate across all 1,000 customers is **30.10%** — nearly 1 in 3 customers is leaving. This is above the industry average of 15-25%, signaling a serious retention problem that requires urgent attention.

### Query 2 — Churn by Contract Type
| Contract | Churn Rate |
|---|---|
| Month-to-Month | 47.06% |
| One Year | 15.75% |
| Two Year | 8.85% |

Customers on Month-to-Month contracts churn at nearly **5x the rate** of Two Year contract holders. The longer the commitment, the stronger the loyalty — making contract conversion the single most impactful retention strategy available.

### Query 3 — Churn by Internet Service
| Internet Service | Churn Rate |
|---|---|
| Fiber Optic | 35.29% |
| DSL | 27.32% |
| No Internet | 24.67% |

Fiber Optic customers — who pay the highest monthly charges — churn the most. This suggests the premium service is failing to deliver a premium experience, representing both a revenue risk and a product quality issue.

### Query 4 — Churn by Tech Support
| Tech Support | Churn Rate |
|---|---|
| No | 33.60% |
| Yes | 26.70% |

Customers without Tech Support churn at nearly 7 percentage points higher than those with it. Access to help when things go wrong is a powerful retention tool — Tech Support is not just a feature, it's a loyalty driver.

### Query 5 — Churn by Number of Complaints
| Complaints | Churn Rate |
|---|---|
| 0 | 27.17% |
| 1 | 26.81% |
| 2 | 24.56% |
| 3 | 36.05% |
| 4 | 32.44% |
| 5 | 33.61% |

Churn stays relatively stable for customers with 0-2 complaints, then jumps sharply at 3 complaints. **3 complaints is the critical tipping point** — beyond this, frustration turns into a decision to leave.

### Query 6 — Churn by Payment Method
| Payment Method | Churn Rate |
|---|---|
| Mailed Check | 32.28% |
| Bank Transfer | 30.95% |
| Credit Card | 29.88% |
| Electronic Check | 27.34% |

Payment method is the **weakest predictor of churn** in this dataset — only a 5 percentage point gap across all methods. The company should not prioritize payment method switching as a retention strategy.

### Query 7 — Monthly Charges: Churned vs Retained
| Status | Avg Monthly Charges | Avg Total Charges |
|---|---|---|
| Retained | $69.09 | $2,272.63 |
| Churned | $69.08 | $2,154.96 |

Churned and retained customers pay virtually identical monthly charges — just 1 cent difference. **Price is not driving churn.** Blanket discounts would be an ineffective and costly retention strategy. The real issues are service quality and customer support.

### Query 8 — Churn by Tenure Group
| Tenure Group | Churn Rate |
|---|---|
| 0-1 Year | 38.07% |
| 1-2 Years | 25.66% |
| 2-3 Years | 29.96% |
| 3-4 Years | 29.20% |
| 4+ Years | 29.03% |

New customers in their first year churn at 38% — significantly higher than all other groups. After surviving the first 12 months, churn rate drops and stabilizes around 29%. **The first year is the most critical retention window.**

### Query 9 — High Risk Customer Profile
| Contract | Internet | Tech Support | Churn Rate |
|---|---|---|---|
| Month-to-Month | Fiber Optic | No | 57.14% |
| Month-to-Month | Fiber Optic | Yes | 50.28% |

The single most at-risk customer profile is **Month-to-Month + Fiber Optic + No Tech Support** — more than half of these customers are leaving. Even adding Tech Support only reduces churn by 7 points for this group, confirming that contract type is the root issue.

---

## 💡 Business Recommendations

1. **Prioritize contract conversion** — Offer Month-to-Month customers discounted annual plans. This single action could cut churn nearly in half for the highest risk segment
2. **Investigate Fiber Optic service quality** — Premium customers are churning most. Survey recently churned Fiber Optic customers to identify the root cause
3. **Set a 3-complaint alert threshold** — Automatically flag customers who reach 3 complaints for immediate personal outreach before they decide to leave
4. **Launch a New Customer Success Program** — The first 12 months is the most critical window. Dedicated onboarding support and a 12-month loyalty reward could significantly improve first year retention
5. **Bundle Tech Support with high-risk segments** — Offer free Tech Support to Month-to-Month Fiber Optic customers as part of a retention package
6. **Don't compete on price** — Churned and retained customers pay the same. Invest retention budget in service quality and support, not discounts

---

## 📂 Project Structure

```
customer-churn-analysis/
│
├── customer_churn.csv          # Dataset
├── churn_analysis.sql          # All 9 SQL queries
└── README.md                   # Project documentation
```

---

## 👤 Author

**Toluwanimi Awofisayo**
Mathematics Graduate | Data Analyst
📧 temijasopelincoln@gmail.com
🔗www.linkedin.com/in/iréwámirí-awófisáyọ̀-745b9930a

