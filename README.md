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
- Shipping details: Shipping Mode, Shipping Cost 
  

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

  ### SQL QUERIES WITH ITS RESULT
   Q1. Which product category had the highest sales
```sql
select top 1 Product_Category, Sum(Sales) AS HighestSales
 FROM [KMS Sql Case Study]
 Group by Product_Category
 Order By HighestSales desc;
```
![image](https://github.com/user-attachments/assets/d3aafd58-3a02-42e8-9694-242236794828)

 I. Explanation:
- Grouped data by product category.
- Summed sales within each category.
- Ordered descending to identify the highest.
- 
II. Finding:
  -The product category with the highest sales is Technology with total sales of 
(# 5984248.183)

Q2. What are the Top 3 and Bottom 3 regions in terms of sales?
   ```sql
   select top 3 Region, sum(sales) AS TopRegionsales,
    'TOP' AS RANKGROUP
   FROM KMS Sql Case Study
   Group by Region
   order by TopRegionsales DESC
  ```
 ```sql
 select top 3 Region, Sum(Sales) AS BottomSales,
  'BOTTOM' AS RANKGROUP
 From  KMS Sql Case Study
 Group by Region 
 Order by Bottomsales ASC;
```
![image](https://github.com/user-attachments/assets/3846f1af-dfcd-49c1-afdb-370660f19e05)
```sql
SELECT * FROM (
    SELECT TOP 3 Region, SUM(Sales)
    AS TotalSales, 'Top' AS RankGroup
    FROM [KMS Sql Case Study]
    GROUP BY Region
    ORDER BY SUM(Sales) DESC
) AS Top3
UNION ALL
SELECT * FROM (
    SELECT TOP 3 Region, SUM(Sales)
  AS TotalSales, 'Bottom' AS RankGroup
    FROM [KMS Sql Case Study]
    GROUP BY Region
    ORDER BY SUM(Sales) ASC
) AS Bottom3
ORDER BY Totalsales, RankGroup  DESC;
```
![image](https://github.com/user-attachments/assets/97528c74-38cd-41e6-9b10-56057377551b)

I. Explanation
1. Group the data by the region and sum the sales of the data based on the region as totalsales. I also used RankGroup(top and Bottom) to represent the position of the result based on the region sales
2. Union all the two query inorder to combine the various result gotten from the queries into a single table
   
II. Findings

The above Table shows that the regions with the highest sales are;
1. West with (# 3597549.278) total sales
2. Ontario	with (# 3063212.480) total sales
3. Prarie	 with (# 2837304.602)	 total sales
 
And the regions with the lowest(bottom) sales are ;
1. Yukon	with (# 975867.374)	Totalsales
2. Northwest Territories with (#	800847.330	) Totalsales
3. Nunavut	with (# 116376.484) totalsales

Q3. What were the total sales of appliances in Ontario?
   
```sql
select Product_Sub_Category,Region,
 sum(Sales) AS OntarioAppliancesTotalsales
 From [KMS Sql Case Study] 
  Where Region = 'Ontario' and  Product_Sub_category = 'Appliances'
  group by Region, Product_Sub_Category
  ```
![image](https://github.com/user-attachments/assets/8570b387-2bbd-4496-bb25-0bd5bdf17240)

I. Explanation
1. Group the data by product_Sub_Category
2. filter it down to the desired Region by using a conditional clause 'where' and 'and' to get the total sale of Appliances in Ontario
3. Sum the sales of Appliances in the Region AS OntarioAppliancesTotalsales

II. Findings

1. The totalsales of Appliance in the Ontario is (# 202346.840)
2. Also found out that Appliances is of the top selling product in Ontario while  I compared its Totalsales With the Totalsales of Products in the Region
   
III. Recommendation/Advice

 I recommend that the company supplies more products under Appliances to Ontario as the count of distinct products under Appliances is 72 which is very low compared to other subs-Category like paper,office Furnishing and many more

 Q4. Advise the management of KMS on what to do to increase the revenue from the bottom
```sql
     select Top 10 Customer_Name,
   Sum(Sales) AS TotalBottomCustomersales
  From [dbo].[KMS Sql Case Study]
  group by Customer_Name 
  Order by TotalBottomCustomersales asc;
```
![image](https://github.com/user-attachments/assets/e862aaa2-68f4-47fa-8786-99d44c0104b4)

The below Query shows the breakdown of the various product Purchased by this Bottom Customers in term of sales
```sql
    select Customer_Name, Sum(sales) AS Lowestrevenue,
    Product_Category
  from [KMS Sql Case Study] 
 where Customer_Name IN  (
                select top 10 Customer_Name
				From [KMS Sql Case Study]
                group by Customer_Name
                 Order by sum(sales) Asc
				 )
GROUP BY Customer_Name, Product_Category
ORDER BY Customer_Name, Lowestrevenue asc
```
![image](https://github.com/user-attachments/assets/adffa82b-3c97-40e8-ab98-2258ce5e5c91)

I. Explanation
1. Group the data by Customer_Name and Product_category
2. Sum the sales as TotalBottomsales based on the Category and the Customer_Name
3. filter the result by selecting the top 10 and sort it to give the result for      the lowest sales using order by  asc
4. Ran the second query to breakdown the product_Category this Customer_Name falls in and to know the Products they normally purchase

II. Findings

The above tables shows that the Bottom Revenue(sales) by customer_name and the Bottom 10 Customer purchases from the Office Supplies Category and this made Office the Lowest Purchase Product_Category.
This Could be due to low Quality Products,lack of visibliy caused by Inappropriate Marketing Strategy, High product Cost, NO/Low Discount and some other factors.

III. Advise/Recommendation

- I advise the company to review the quality of the products produced under the Office Supplies Category.
- The Company should also track the Progress of the Product_Category in their marketing Strategy and If possible reduces the cost of the Products in the Category.

Q5. KMS incurred the most shipping cost using which shipping method?
```sql
      select top 1 Ship_Mode,
       Sum(Shipping_Cost) As Highestshippingcost
        From [KMS Sql Case Study] 
	group by Ship_Mode 
   Order by Highestshippingcost  desc;
```
![image](https://github.com/user-attachments/assets/226d7987-9caa-40de-a567-48b570791b77)

```sql
     select top 10 (Shipping_Cost) As HighestshippingCost,
    Ship_Mode,Ship_Date
    from [KMS Sql Case Study] 
     group by Shipping_Cost,Ship_Mode,Ship_Date
      order by HighestshippingCost desc
    ```
![image](https://github.com/user-attachments/assets/2ff13e75-d4b2-41dd-8045-71315dbcbcbf)




      
   
  


