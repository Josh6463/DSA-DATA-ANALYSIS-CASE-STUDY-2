
-----select * from [KMS Sql Case Study]

 ----Alter Table [KMS Sql Case Study]
----- Alter Column Order_date date

 -----Alter Table [KMS Sql Case Study]
 ----Alter column Ship_Date date

 ----Alter Table [KMS Sql Case Study]
 -----Alter Column Sales Decimal (10,3)

 ----EXEC sp_rename '[KMS Sql Case Study].[ROW ID]','Row_ID','COLUMN';-----
 
----Q1 Product_category with highestsales-----
 select top 1 Product_Category, Sum(Sales) AS HighestSales
 FROM [KMS Sql Case Study]
 Group by Product_Category
 Order By HighestSales desc

   
----Q2 Top 3 sales and bottom 3 sales by Regions----
 select Region, sum(Sales) As TotalRegionsales from [KMS Sql Case Study] 
 group by Region

 select top 3 Region, sum(sales) AS TopRegionsales, 'TOP' AS RANKGROUP
  FROM [KMS Sql Case Study]
 Group by Region
 order by TopRegionsales DESC


 select top 3 Region, Sum(Sales) AS BottomSales, 'BOTTOM' AS RANKGROUP
 From  [KMS Sql Case Study]
 Group by Region 
 Order by Bottomsales ASC;

 ----union the two queries together to give a single result

 SELECT * FROM (
    SELECT TOP 3 Region, SUM(Sales) AS TotalSales, 'Top' AS RankGroup
    FROM [KMS Sql Case Study]
    GROUP BY Region
    ORDER BY SUM(Sales) DESC
) AS Top3

UNION ALL

SELECT * FROM (
    SELECT TOP 3 Region, SUM(Sales) AS TotalSales, 'Bottom' AS RankGroup
    FROM [KMS Sql Case Study]
    GROUP BY Region
    ORDER BY SUM(Sales) ASC
) AS Bottom3

ORDER BY Totalsales, RankGroup  DESC;

------Q3 Total sales Of appliances in Ontario------
----(TotalSales in Ontario)-----
  select  Region,sum(Sales) AS OntarioTotalsales
  From [KMS Sql Case Study] 
  Where Region = 'Ontario' 
  group by Region
  order by OntarioTotalsales;

  -----(Totalnumber of Products from each Subcategory)---
  
  select count(Distinct Product_Name) AS TotalProducts,Product_Sub_Category
  from [KMS Sql Case Study]
  group by Product_Sub_Category
  order by TotalProducts Desc;
  
  select count(Distinct Product_Name) AS [TotalNumber of Product in Ontario]
   from [KMS Sql Case Study]


  ------TotalSales of Appliances in Ontario-----

  select Product_Sub_Category,Region,sum(Sales) AS OntarioAppliancesTotalsales
  From [KMS Sql Case Study] 
  Where Region = 'Ontario' and  Product_Sub_category = 'Appliances'
  group by Region, Product_Sub_Category
  
  SELECT SUM(Sales) AS OntarioAppliancesTotalSales
FROM [KMS Sql Case Study]
WHERE Region = 'Ontario' AND Product_Sub_Category = 'Appliances';

 ---- Alter Table [KMS Sql Case Study]-----
 ----- Alter Column Shipping_Cost Decimal (10,3)---

------- TotalNumber of Products from each Product_sub_category-----
  select count(distinct Product_Name) AS TotalProducts,Product_Sub_Category
  from [KMS Sql Case Study]
  group by Product_Sub_Category
  order by TotalProducts Desc;

  ------ Q4 Advise the management of KMS on what to do to increase the revenue from the bottom
------------10 customers-----
 -----Name of Customeres with lowest Sales----
select Top 10 Customer_Name, Sum(Sales) AS TotalBottomCustomersales
  From [dbo].[KMS Sql Case Study]
  group by Customer_Name 
  Order by TotalBottomCustomersales asc;

  ----Customers Lowest sales by Product_category----
   select Customer_Name, Sum(sales) AS Lowestrevenue,Product_Category
  from [KMS Sql Case Study] 
 where Customer_Name IN  (
                select top 10 Customer_Name
				From [KMS Sql Case Study]
                group by Customer_Name
                 Order by sum(sales) Asc
				 )
GROUP BY Customer_Name, Product_Category
ORDER BY Customer_Name, Lowestrevenue asc

  select Product_category,Discount,Unit_Price
  from [KMS Sql Case Study]
  where Product_Category = 'Technology'
  group by Product_Category,Unit_Price,Discount
  

-----Q5 highetshippingcost----
  
 select top 1 Ship_Mode,Sum(Shipping_Cost) As Highestshippingcost
    From [KMS Sql Case Study] 
	group by Ship_Mode 
  Order by Highestshippingcost  desc;


  ----top 10 The highest Shipping Cost by shippingmode---

 select top 10 (Shipping_Cost) As HighestshippingCost,Ship_Mode,Ship_Date
 from [KMS Sql Case Study] 
 group by Shipping_Cost,Ship_Mode,Ship_Date
 order by HighestshippingCost desc

 select Shipping_Cost from [dbo].[KMS Sql Case Study]
 order by Shipping_Cost desc;

 ---Case Scenario II----
 -----Q6---MostValuable-----

 SELECT TOP 5 Customer_Name, SUM(Sales) AS TotalSales
FROM [KMS Sql Case Study]
GROUP BY Customer_Name
ORDER BY TotalSales Desc 

---------Products bought by the most valuable customers----

  SELECT Customer_Name,Product_category,Product_Sub_Category,SUM(Sales) AS TotalSales
 FROM [KMS Sql Case Study]
  where Customer_Name In(
         SELECT TOP 5 Customer_Name
FROM [KMS Sql Case Study]
GROUP BY Customer_Name
ORDER BY Sum(Sales) desc
 )
  group by Customer_Name,Product_Category,Product_Sub_Category
  Order by Customer_Name,TotalSales desc;

-----Q7 Small Business with Highestsales---

  Select * from [KMS Sql Case Study]

  Select top 1 Customer_Name, Customer_segment,Sum(Sales) As TotalSmallBusinessSales  from [KMS Sql Case Study]
  where  Customer_Segment = 'Small Business'
  Group by Customer_Name,Customer_Segment
  Order by TotalSmallBusinessSales Desc

  ---to get the breakdown of the sales of the smallbusiness--not done---

  Select Customer_Name,Customer_Segment,Product_category,Product_Sub_Category,Sum(sales) As TotalSmallBusinessSales  from [KMS Sql Case Study]
  Where Customer_Segment IN
      (select top 1 Customer_Segment
	    From [KMS Sql Case Study]
		where Customer_Segment = 'Small Business'
    Group by Customer_Segment,Customer_Name
	Order by Sum(Sales), Customer_Segment asc
)
	group by Customer_Name,Customer_Segment, Product_Sub_Category,Product_Category	
  Order by Customer_Segment,TotalSmallBusinessSales desc;Group

  ----- Q8 Corporate Customer with the Highest Orders in 2009-2012
  
  select top 1 Customer_Segment,Customer_Name, Count(Order_ID) As TotalOrder 
  from [dbo].[KMS Sql Case Study]
  where Customer_Segment = 'Corporate'
  group by Customer_Segment, Customer_Name
  order by TotalOrder desc

  -----To get the Product Ordered by Corporate Customer With Highest Order and the order_Quantity-----
   select  Customer_Name,Product_Sub_Category,Order_Quantity
   from [dbo].[KMS Sql Case Study]
    where Customer_Segment = 'Corporate' and Customer_Name = 'Adam Hart'
	group by Product_Sub_Category,Customer_Name,Order_Quantity
	order by Order_Quantity desc;
	----totalOrder BY Segment-----
 select Customer_Segment,count(Order_ID) AS  TotalOrder From [dbo].[KMS Sql Case Study]
 Group by Customer_Segment

 ----Q9 Most Profitable Consumer Customer----
 select top 1 Customer_Name,Customer_Segment,sum(Profit) MostProfitable
 from [KMS Sql Case Study]
 where Customer_Segment = 'Consumer'
 group by Customer_Name,Customer_Segment
 order by MostProfitable desc;


 -----Q10 consumer returned Item by segment----
 select top 10  Customer_Name,Customer_segment 
 from [KMS Sql Case Study]
 where profit < 0 
 group by Customer_Name,Customer_segment 

 ----the top 10 numbers of return per segment by  Customers------

 -------Q11 ----
  ----totalorder that uses shippmode based on orderpriority----

 select Order_priority,Ship_Mode,count(distinct Order_ID) AS TotalOrder
 From [KMS Sql Case Study]
 Group by Order_priority,Ship_Mode
 order by Order_priority,TotalOrder desc;
 ------ the cost of the shipmode based on orderpriority----

 select Order_priority,Ship_Mode,sum(distinct Shipping_Cost) AS TotalCost
 From [KMS Sql Case Study]
 Group by Order_priority,Ship_Mode
 order by Order_priority,TotalCost desc;

