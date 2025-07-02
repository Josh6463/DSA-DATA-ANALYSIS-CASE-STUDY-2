
 Q5. KMS incurred the most shipping cost using which shipping method?
 ```sql
      select top 1 Ship_Mode,
      Sum(Shipping_Cost) As Highestshippingcost
      From [KMS Sql Case Study] 
      group by Ship_Mode 
      Order by Highestshippingcost  desc;
    
----top 10 The highest Shipping Cost by shippingmode---

  select top 10 (Shipping_Cost) As HighestshippingCost,
  Ship_Mode,Ship_Date
  from [KMS Sql Case Study] 
  group by Shipping_Cost,Ship_Mode,Ship_Date
  order by HighestshippingCost desc
```
![image](https://github.com/user-attachments/assets/6ed9f3e7-3017-4c1c-9593-b35c74f1fe1c)

![image](https://github.com/user-attachments/assets/080bc3f2-c1d9-4eaa-bbaf-249e68f49431)

I. Explanation
1. Group the data by Its Ship_Mode
2. Summed the Shotting Cost based on the group
3. sort the Shipping cost in descending order to get the Ship_Mode with the Highest Shipping Cost

II. Finding ;

The Table above shows that the Ship_Mode with the highest Shipping Cost is 
Delivery Truck with the Cost of (# 51971.940)

CASESTUDY 2

Q6. Who are the most valuable customers, and what products or services do they           typically purchase?

```sql
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
```

I. Explanation;

1. Group the data by Customer_Name
2. Summed the sales AS totalsales based on the Group of the Customer_Name
3. Sort the Totalsales in descending order to get the top 5 most Valuable Customer
4. Wrote a subquery to select the Product_Category,product_Sub_Category Based Outer Query and the group the data by Customer_Name,Product_category,Product_Sub_Category to Categorised the Product Purchased by each Customer
5. sort the Query in Descending Order to get the Top Purchasing Customers

II. Findings;

The Table Shows the List of the Most Valuable Customers in term of sales;
Emily Phan	 with sales of (# 117124.438)
Deborah Brumfield with sales of (#	97433.135 )
Roy Skaria	 with the sales of (# 92542.153)
Sylvia Foulston	with the sales of (# 88875.758)
Grant Carroll with the sales of	(#88417.002 with the sales of)

III. The breakdown of the Product bought the Most Valuable Customers are
![image](https://github.com/user-attachments/assets/4792d400-bc20-46dd-a88c-0ff3d391289c)
![image](https://github.com/user-attachments/assets/371a0e89-db67-4429-a73f-29d37097c2d6)
![image](https://github.com/user-attachments/assets/3b68282b-3eb2-4edd-b4d1-6fec9e6919a0)
![image](https://github.com/user-attachments/assets/514c77a2-18f6-4408-8acb-3f45a253a5b9)
![image](https://github.com/user-attachments/assets/8c576b47-1564-40fa-abc5-299d90a8334c)

This resulted to a table with a lot of rows because the Customers actually bought Products from Different Category which resulted in Their Names being Repeated in multiple rows.

9. Which consumer customer was the most profitable one?
10. Which customer returned items, and what segment do they belong to?
11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer

Q7. Which small business customer had the highest sales?
```sql
      Select top 1 Customer_Name, Customer_segment,
   Sum(Sales) As TotalSmallBusinessSales  from [KMS Sql Case Study]
  where  Customer_Segment = 'Small Business'
  Group by Customer_Name,Customer_Segment
  Order by TotalSmallBusinessSales Desc
```
![image](https://github.com/user-attachments/assets/459f77a7-1153-4edf-81e9-c0b83d93821d)

I. Explanation 
1. Group the data by the Customer_Name and Customer_Segment to Categorise the data
2. Summed the sales As TotalSmallBusinesssales based on the Group to calculate the summation of sales by group data.
3. Used a conditional clause 'where' to calculate the result for the desired Customer_Segment 'small Business'
4. Sort the TotalSmallBusinesssales in descending order to select the highest sales

II. Findings;

The Table above shows that the small Business Customer With the highest sales is Dennis Kane having a Totalsales of (# 75967.591)

Q8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
```sql
  select top 1 Customer_Segment,Customer_Name,
   Count(Order_ID) As TotalOrder 
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
```
The second Query shows the breakdown of the order by corporate customer with the Highest sales showing the order by Product_Sub_category

 ![image](https://github.com/user-attachments/assets/16ab682f-e565-4920-a0d6-3d4545a7a445)

I. Findings;

- The Corporate Customer that placed the most number of order between 2009-2012 is;
 Adam Hart with a totalorder of 27
- found out that Adam Hart place order with large quantity of Office Supplies, Technology and Appliances
  
Q9 Which consumer customer was the most profitable one?
```sql
     select top 1 Customer_Name,Customer_Segment,
   sum(Profit) MostProfitable
   from [KMS Sql Case Study]
   where Customer_Segment = 'Consumer'
   group by Customer_Name,Customer_Segment
  order by MostProfitable desc;
```
![image](https://github.com/user-attachments/assets/1309bd83-4006-4ab6-be6c-6bbf1dfadf12)

I. Explanation
- group the data by the Customer_Name,Customer_Segment and summed the Profit based on the group AS MostProfittable
- used a conditional clause 'where' to filter the Customer_segment to a desired segment and sort the Sales in descending order to get the highest profit
  



