# 📊 Northwind Company Analysis

This project analyzes the **Northwind** database using **SQL Server** and **Power BI**.  
It includes **6 SQL queries** and a **3-page interactive dashboard** focused on **Sales**, **Operations**, and **Customers**.

---

## 🧩 Project Overview

**Goal:**  
To analyze the Northwind database through two complementary approaches:
- **SQL Queries:** Used independently to perform business data exploration and demonstrate SQL-based analysis techniques.  
- **Power BI Dashboard:** Designed separately to visualize key metrics for Sales, Operations, and Customers.

**Tools Used:**
- Microsoft SQL Server  
- Power BI Desktop  
- Northwind sample database  

---
## 📂 Repository Structure

<details>
  <summary>🗂️ Click to expand folder structure</summary>

Northwind-Analytics/
│
├── SQL_Queries/                      
│   ├── 01_sales_summary.sql          
│   ├── 02_top_products.sql           
│   ├── 03_customer_segments.sql      
│   ├── 04_shipping_performance.sql   
│   ├── 05_employee_orders.sql        
│   └── 06_inventory_status.sql       
│
├── PowerBI_Dashboard/                
│   ├── Northwind_Dashboard.pbix
│   └── Screenshots/                  
│       ├── sales_page.png
│       ├── operations_page.png
│       └── customers_page.png
│
└── README.md                         
</details>

---

## 📑 Dashboard Pages

### 1️⃣ Sales Page
- 🔹 Overview of total revenue, orders, and top-selling products  
- 🔹 Monthly sales trends  

<details>
  <summary>🖼️ Click to view screenshot</summary>
  
  ![Sales Dashboard](PowerBI_Dashboard/Dashboard_Screenshots/sales_page.png)
</details>

---

### 2️⃣ Operations Page
- 🔹 Delivery performance and shipping times  
- 🔹 Inventory and stock status  

<details>
  <summary>🖼️ Click to view screenshot</summary>
  
  ![Operations Dashboard](PowerBI_Dashboard/Dashboard_Screenshots/operations_page.png)
</details>

---

### 3️⃣ Customers Page
- 🔹 Top customers by total purchases  
- 🔹 Customer segmentation by sales value  

<details>
  <summary>🖼️ Click to view screenshot</summary>
  
  ![Customers Dashboard](PowerBI_Dashboard/Dashboard_Screenshots/customers_page.png)
</details>

---

## 💾 SQL Queries

<details>
  <summary><b>🛒 Q1_Expensive_Products_Customers.sql</b></summary>

The marketing team wants to analyze customers who purchased expensive products.

The marketing team wants to identify customers who bought high-priced products for targeted campaigns.
You've been asked to provide a list with the following information:

1- Customer company name (CompanyName)
2- Number of products purchased with unit price above $30 (Total Expensive Products)
3- Average order value (Average Order Value, with 2 decimal places)

Filters:

1- Products should not be discontinued.
2- The number of products purchased should be more than 3.

Sort the results by average order value in descending order.

 🔗 [View Q1 solution](Queries/Q1_Expensive_Products_Customers.sql)

</details>

<details>
  <summary><b>🏆 02_top_products.sql — Top-Selling Products</b></summary>

  Lists the top 10 products based on total revenue to highlight the most profitable items.

</details>

<details>
  <summary><b>👥 03_customer_segments.sql — Customer Segmentation</b></summary>

  Groups customers into High, Medium, and Low Value segments based on their total purchase amount.

</details>

<details>
  <summary><b>🚚 04_shipping_performance.sql — Delivery Performance</b></summary>

  Analyzes delivery efficiency by comparing shipped and required dates to classify orders as On-Time or Late.

</details>

<details>
  <summary><b>👩‍💼 05_employee_orders.sql — Employee Performance</b></summary>

  Evaluates employee productivity based on total number of orders processed and sales value generated.

</details>

<details>
  <summary><b>📦 06_inventory_status.sql — Inventory Overview</b></summary>

  Monitors product stock levels and identifies low-stock items to support better inventory management.

</details>



---

## 🚀 How to Use

1. Restore the **Northwind** database in SQL Server.  
2. Run all SQL queries from the `/SQL_Queries/` folder.  
3. Import the resulting tables into Power BI.  
4. Open `Northwind_Dashboard.pbix` to explore the dashboard.

---

## 🧠 Insights

- Top-performing products and categories  
- On-time delivery rate and shipping efficiency  
- High-value vs. low-value customer segmentation  

---

## 📸 Preview

| Page | Screenshot |
|------|-------------|
| Sales | ![Sales](PowerBI_Dashboard/Dashboard_Screenshots/sales_page.png) |
| Operations | ![Operations](PowerBI_Dashboard/Dashboard_Screenshots/operations_page.png) |
| Customers | ![Customers](PowerBI_Dashboard/Dashboard_Screenshots/customers_page.png) |

---

## 🏷️ Tags
`#SQLServer` `#PowerBI` `#DataAnalysis` `#Northwind` `#Dashboard` `#BusinessIntelligence`

---

👩‍💻 **Author:** Tahereh M.  
📅 *Created in 2025*  



