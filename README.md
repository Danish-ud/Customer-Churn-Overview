#  Telecom Customer Churn Analysis

This project focuses on analyzing telecom customer churn. The goal of this project is to analyze actionable insights on customer churn using SQL for data preparation, Python for exploratory data analysis (EDA), and Tableau for data visualization and KPI reporting.

---

##  Problem Statement

Telecom companies lose a significant portion of their revenue due to customer churn. The goal of this project is to:
- Identify key factors that lead to customer churn
- Understand patterns and behaviors of churned customers
- Provide actionable insights to reduce churn
- Build an interactive Tableau dashboard to present findings

---

##  Tools & Technologies

- **SQL**: Data cleaning, joins, aggregation, transformation
- **Python**: Exploratory Data Analysis using pandas, matplotlib, seaborn
- **Tableau**: Data visualization and dashboard creation
---

##  Dataset

The dataset contains **4 interrelated tables**:

- `customers`:-  Demographic information of customers
- `services` :- Details of services subscribed
- `usage`   :-Monthly data usage and minutes used
- `churn`   :-Customer churn status and billing details 


## 🛠️ Steps Performed

### 1. 📦 Data Cleaning (SQL)
Performed instial cleaning on datsets using MySql workbench.

- Identified Duplicate values through out the Data set and got rid of it.
- Handled Null vales and Missing values with utmost precautions.
- With the help of join, joined the important data columns into a single table "Clean Data". 
-
### 2. 🔍 Exploratory Data Analysis (Python)
Performed Exploratory Data Analysis (EDA) with the help of Python and its libraries Pandas, Matplotlib and, Seaborn.
With the help of Graph features in matplot and seaborn analyzed
- Churn Rate of the Telecom.
- Customer Demographics like senir citizen, married... impact on the Churn Rate.
- Analyzed monthly Charges impact on Churn Rate.
- Examined Services usage impact on Churn Rate.
  
### 3. 📈 Dashboard & KPI Visualization (Tableau)
Based on the Insigts generated through Exploratory Data Analysis (EDA) Created Kpi Visuals and Dashboard in Tableau. 
- Created Dashboard that heps us to identify the key factors that lead to customer churn.
- The Dashboard contains different Kpi's that help us to convey our insights more crisp and cearly.
- It contains different Customer demograpic visuals to convey the message. Below is the Screenshort of the Dashboard and Tableau file where you can check the direct impact throug filters.

---

##  Key Insights

- Month-to-month contract customers have the highest churn rate.
- Customers with lower monthly charges tend to churn more.
- GB usage distribution shows underutilization of services.
- Slightly higher churn among senior citizens and those with partners.
- Customers who use more services are more likely to churn.

---

##  Recommendations

- Promote long-term contracts (1-year / 2-year) with incentives.
- Target low-usage customers with personalized engagement or offers.
- Focus on improving service quality for high-usage customers.
- Design campaigns for senior citizens to increase stickiness.

---

## 📌 Project Folder Structure

# Customer-Churn-Overview
