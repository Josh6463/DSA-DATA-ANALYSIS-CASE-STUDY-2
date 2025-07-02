
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

## CASE SCENARIO 2

6. Who are the most valuable customers, and what products or services do they typically purchase?
7. Which small business customer had the highest sales?
8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
9. Which consumer customer was the most profitable one?
10. Which customer returned items, and what segment do they belong to?
11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer



