create database customer_churn;
use customer_churn;
select * from churn;
select * from customers;
select * from services;
select * from customer_churn.usage;

select * from customers;
select distinct(payment_method)
from customers;
SELECT c.*, ch.churn_flag
FROM customers c
LEFT JOIN churn ch ON c.customer_id = ch.customer_id;

-- [-----------Check for duplicates----------------
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- -  --------------Check for NULLs-----------------------------
SELECT 
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
  SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
  SUM(CASE WHEN senior_citizen IS NULL THEN 1 ELSE 0 END) AS null_senior,
  SUM(CASE WHEN partner IS NULL THEN 1 ELSE 0 END) AS null_partner,
  SUM(CASE WHEN dependents IS NULL THEN 1 ELSE 0 END) AS null_dependents
FROM customers;

select * from customers 
where contract_type = null or contract_type  = ' ' ;
--  ---------------Make necessary Updates --------------------------
-- ----------------DATA CLEANING--------------------------------- --
update customers
set senior_citizen = 'Yes'
where senior_citizen = 1 ;

update customers
set senior_citizen = 'No'
where senior_citizen = 0 ;

desc customers;

alter table customers add column senior_citizens varchar(3);

update customers
set senior_citizens = case
when senior_citizen = 1 then "Yes"
else "No"
end;

alter table customers
drop column senior_citizen;

select * from services;

select * from services
group by customer_id, service_type, has_service
having count(*) >1;

select * from services
where customer_id = null or customer_id = ' ' or
service_type = null or service_type = ' ' or
has_service = null or has_service = ' ';

select distinct(service_type) from services;


select * from customer_churn.usage;

select * from customer_churn.usage
group by usage_id, customer_id, service_type, month_year, gb_used, minutes_used
having count(*) >1;

select distinct(service_type)
from customer_churn.usage;

select distinct(month_year)
from customer_churn.usage;

select * from customer_churn.usage
where usage_id = null or usage_id	=' ' or
customer_id = null or customer_id =' ';

select * from churn;

desc churn;
alter table churn
modify column churn_date date;

UPDATE churn
SET churn_date = NULL
WHERE TRIM(churn_date) = '' OR churn_date IS NULL;

select count(*) from churn
where churn_date is null;

select count(customer_id) from churn;

-- ----MERGING ALL TABLES NECCESARY DATA TO FORM THE REQUIRED CLEANED_TELECOM TABLE --- -----
select
  customer_id,
  gender,
  senior_citizens,
  partner,
  dependents,
  contract_type,
  MAX(monthly_charges) AS monthly_charges,
  MAX(total_charges) AS total_charges,
  COUNT(DISTINCT month_year) AS active_months,
  round(SUM(gb_used),2) AS total_gb_used,
  SUM(minutes_used) AS total_minutes_used,
  MAX(churn_flag) AS churn_flag
FROM cleaned_telecom
GROUP BY 
  customer_id, gender, senior_citizens, partner, dependents, contract_type;
-- ---------------CREATING A VIEW FOR NEW DATA SET--------------------
create view clean_telecom as
SELECT 
  customer_id,
  gender,
  senior_citizens,
  partner,
  dependents,
  contract_type,
  MAX(monthly_charges) AS monthly_charges,
  MAX(total_charges) AS total_charges,
  COUNT(DISTINCT month_year) AS active_months,
  round(SUM(gb_used),2) AS total_gb_used,
  SUM(minutes_used) AS total_minutes_used,
  MAX(churn_flag) AS churn_flag
FROM cleaned_telecom
GROUP BY 
  customer_id, gender, senior_citizens, partner, dependents, contract_type;

select * from clean_telecom;
-- --------CHURN RATE----------------------------- ---
SELECT 
  ROUND(AVG(CASE WHEN lower(churn_flag) = 'true'
  THEN 1 ELSE 0 END) * 100, 2) AS churn_rate_percent
FROM clean_telecom;
-- -------CONTRACT TYPE VS CHURN------------------ ---
SELECT 
  contract_type,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN lower(churn_flag) = 'true' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(AVG(CASE WHEN lower(churn_flag) ='true' = TRUE THEN 1 ELSE 0 END) * 100, 2) AS churn_rate_percent
FROM clean_telecom
GROUP BY contract_type
ORDER BY churn_rate_percent DESC;

-- ------------ SENIOR CITIZE VS CHURN---------------- ------
SELECT 
  senior_citizens,
  ROUND(AVG(CASE WHEN lower(churn_flag) = 'true' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate_percent
FROM clean_telecom
GROUP BY senior_citizens;

-- -------------COMPARING CHURNED CUSTOMERS AVERAGE CHARGES--------------- --
SELECT 
  customer_id, monthly_charges, total_charges
FROM clean_telecom
WHERE churn_flag = 'True'
ORDER BY monthly_charges DESC
LIMIT 5;

-- ------------DEMOGRAPHICS IMPACT ON CHURN RATE-------------------- -- 
SELECT 
  partner, dependents,
  COUNT(*) AS total_customers,
  ROUND(AVG(CASE WHEN lower(churn_flag) = 'true' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate_percent
FROM clean_telecom
GROUP BY partner, dependents
ORDER BY churn_rate_percent DESC;

-- ------------CHURN FLAG VS CHARGES--------------- --
SELECT 
  churn_flag,
  ROUND(AVG(monthly_charges), 2) AS avg_monthly_charge,
  ROUND(AVG(total_charges), 2) AS avg_total_charge
FROM clean_telecom
GROUP BY churn_flag;

SELECT 
  ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges,
  ROUND(AVG(total_charges), 2) AS avg_total_charges
FROM clean_telecom;

-- ----------------SENIOR CITIZEN VS CHARGES--------------- --
SELECT 
  senior_citizens,
  ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges
FROM clean_telecom
GROUP BY senior_citizens;

-- ---------------CONTRACT TYPE VS CHARGES------------------- --
SELECT 
  contract_type,
  ROUND(AVG(total_charges), 2) AS avg_total_charges
FROM clean_telecom
GROUP BY contract_type
ORDER BY avg_total_charges DESC;

-- ------------MONTHLY SERVICES UTILIZATION----------- --
SELECT 
 active_months,
  ROUND(AVG(total_gb_used), 2) AS avg_gb,
  ROUND(AVG(total_minutes_used), 2) AS avg_minutes
FROM clean_telecom
GROUP BY active_months
ORDER BY active_months;

-- ---------TOP REVENUE GENERATRING CUSTOMER------------ --
SELECT 
  customer_id, active_months, total_charges
FROM clean_telecom
ORDER BY total_charges DESC
LIMIT 5;
