# DSA-DATA-ANALYSIS-CASE-STUDY-2 (Kultra Mega Stores Inventory)

## Brief Description of the Project
 This project explore Kultra Mega Stores Inventory data
 - A Company with headquarter in Lagos, Specialises in Office supplies and Furniture. Its customer base includes individual consumers, small businesses (retail), and large corporate clients (wholesale) across Lagos, Nigeria
 - aimed to Provide answers to  Important Questions such as the Product category with the Highest Sales,Total Sales of Products in a Specific Region which are needed to make Important Business Decision and Promote the Business.

## Dataset Description
The KMS SQL Case Study dataset contains transactional sales records for a retail company. It includes details such as:
- Order information: Order ID, Order Date, Ship Date
- Customer details: Customer Name, Segment, Region
- Product details: Product Category, Sub-Category
- Sales performance metrics: Sales, Quantity Ordered, Profit
- Shipping details: Shipping Mode, Shipping Cost (if available)
  

## Introduction
In this project, I explored the KMS retail sales data using SQL to uncover powerful business insights. From discovering the best-selling products and top regions to finding out which customers buy the most and how shipping costs can be optimised, this analysis reveals what drives KMS’s revenue. The findings provide clear, data-backed recommendations to help the company grow faster and spend smarter. Dive in to see how simple SQL queries can unlock strategies that boost profits and transform business decisions.
### Tools Used
The major tool used for this project is Microsoft SQL server Management Studio

### Approach 
Here is an outline of the step by step processes taken in the completion of this project  

- Imported the dataset into SQL Server.
- Inspected table structure and cleaned data where necessary.
- Ran SQL queries to answer business questions.
- Documented key findings and recommendations.
- 
  1. Which product category had the highest sales?
2. What are the Top 3 and Bottom 3 regions in terms of sales?
3. What were the total sales of appliances in Ontario?
4. Advise the management of KMS on what to do to increase the revenue from the bottom
10 customers
5. KMS incurred the most shipping cost using which shipping method?
Case Scenario II
6. Who are the most valuable customers, and what products or services do they typically
purchase?
7. Which small business customer had the highest sales?
8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
9. Which consumer customer was the most profitable one?
10. Which customer returned items, and what segment do they belong to?
11. If the delivery truck is the most economical but the slowest shipping method and
Express Air is the fastest but the most expensive one, do you think the company
appropriately spent shipping costs based on the Order Priority? Explain your answer

  ### SQL QUERIES WITH ITS RESULT
   1. Which product category had the highest sales?
````` select top 1 Product_Category, Sum(Sales) AS HighestSales
 FROM [KMS Sql Case Study]
 Group by Product_Category
 Order By HighestSales desc `````

