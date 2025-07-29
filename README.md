#  Telecom Customer Churn Analysis

This project focuses on analyzing telecom customer churn. The goal of this project is to analyze actionable insights on customer churn using SQL for data preparation, Python for exploratory data analysis (EDA), and Tableau for data visualization and KPI reporting.

---
## Problem Statement

Telecom companies lose a significant portion of their revenue due to customer churn. The goal of this project is to:
- Identify key factors that lead to customer churn
- Understand patterns and behaviors of churned customers
- Provide actionable insights to reduce churn
- Build an interactive Tableau dashboard to present findings

---

## Tools & Technologies

- **SQL**: Data cleaning, joins, aggregation, transformation
- **Python**: Exploratory Data Analysis using pandas, matplotlib, seaborn
- **Tableau**: Data visualization and dashboard creation
---

## Dataset

The dataset contains **4 interrelated tables**:

- `customers`:-  Demographic information of customers
- `services` :- Details of services subscribed
- `usage`   :-Monthly data usage and minutes used
- `churn`   :-Customer churn status and billing details 
* [Raw Dataset](https://github.com/Danish-ud/Customer-Churn-Overview/tree/main/Raw%20Data%20set)

##  Steps Performed

### 1.Data Cleaning(SQL)
Performed instial cleaning on datsets using MySql workbench.

- Identified Duplicate values through out the Data set and got rid of it.
- Handled Null vales and Missing values with utmost precautions.
- With the help of join, joined the important data columns into a single table "Clean Data". 
* [SQL File](https://github.com/Danish-ud/Customer-Churn-Overview/blob/main/CHURN%20ANALYSIS%20SQL.sql)

### 2.Exploratory Data Analysis(Python)
Performed Exploratory Data Analysis (EDA) with the help of Python and its libraries Pandas, Matplotlib and, Seaborn.
With the help of Graph features in matplot and seaborn analyzed
- Churn Rate of the Telecom.
- Customer Demographics like senir citizen, married... impact on the Churn Rate.
- Analyzed monthly Charges impact on Churn Rate.
- Examined Services usage impact on Churn Rate.
* [Jupyter Note Book](https://github.com/Danish-ud/Customer-Churn-Overview/blob/main/Jupyter%20Note%20book%20pdf.pdf)
* [Cleaned Dataset](https://github.com/Danish-ud/Customer-Churn-Overview/blob/main/clean_telecom.csv)
### 3.  Dashboard & KPI Visualization (Tableau)
Based on the Insigts generated through Exploratory Data Analysis (EDA) Created Kpi Visuals and Dashboard in Tableau. 
- Created Dashboard that heps us to identify the key factors that lead to customer churn.
- The Dashboard contains different Kpi's that help us to convey our insights more crisp and cearly.
- It contains different Customer demograpic visuals to convey the message. Below is the Screenshort of the Dashboard and Tableau file where you can check the direct impact throug filters.
* [Tableau File](https://github.com/Danish-ud/Customer-Churn-Overview/blob/main/Customer%20Churn%20Overview.twb)
![Dashboard](https://github.com/Danish-ud/Customer-Churn-Overview/blob/main/Customer%20Churn%20Dashboard.png)
---

##  Key Insights

- The Current Churn Rate of the telecom company is around 24% which higher, neccesary steps should be taken to control the churning customers.
- From The above Dashboard we can clearly see that around 1/4 th of the total customers have churned.
- The monthly churn rate line graph shows that January and December are peak months for churning customers.
- Overall Churn Rate of males is higher than the Churn Rate of Females.
- While in histogram We can clearly see the underutilization of resoursces.
- Customers with mont to month plan are more likey to churn.
- Partner and Senior Citizen also plays a crucial factor among churning customers.
  

---

##  Recommendations

Based on the churn analysis and key business insights drawn from the data, the following actionable strategies are recommended to help reduce customer churn and improve retention:

### 1. Encourage Long-Term Contracts :
Customers on month-to-month plans exhibit significantly higher churn.
Recommendation:
- Offer discounts, cashback, or exclusive features for customers switching to 1-year or 2-year contracts.
- Introduce auto-renewal benefits or loyalty points for long-term users.
  
### 2. Preemptive Retention During High-Risk Months
Churn peaks during December and January.
Recommendation:
- Launch targeted retention campaigns during Q4 and early Q1.
- Provide holiday or new year incentives, including data bonuses, plan upgrades, or limited-time offers

### 3. Address Underutilization of Services
Histogram plots reveal many customers are not using their full GB or call allowances.
Recommendation:
- Segment and offer personalized, lower-tier plans to low-usage users.
- Educate customers about plan benefits to increase engagement and satisfaction

### 4. Focus on Senior Citizens & Partnered Customers
Churn is slightly higher among senior citizens and customers with partners.
Recommendation:
- Design senior-friendly plans with simplified services and exclusive support.
- Introduce family or couple plans to boost retention among partnered users.

### 5. 👨‍💼 Understand and Act on Gender-Based Trends
Churn rate is higher among male customers.
Recommendation:
- Conduct customer interviews or surveys to identify potential service gaps.
- Run gender-focused marketing or engagement initiatives to address specific concerns.
---
## Files in this Repository
* [Raw Dataset](https://github.com/Danish-ud/Customer-Churn-Overview/tree/main/Raw%20Data%20set)
* [SQL File](https://github.com/Danish-ud/Customer-Churn-Overview/blob/main/CHURN%20ANALYSIS%20SQL.sql)
* [Jupyter Note Book](https://github.com/Danish-ud/Customer-Churn-Overview/blob/main/Jupyter%20Note%20book%20pdf.pdf)
* [Cleaned Dataset](https://github.com/Danish-ud/Customer-Churn-Overview/blob/main/clean_telecom.csv)
* [Tableau File](https://github.com/Danish-ud/Customer-Churn-Overview/blob/main/Customer%20Churn%20Overview.twb)
