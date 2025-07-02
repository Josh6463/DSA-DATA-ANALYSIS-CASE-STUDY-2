
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


    
