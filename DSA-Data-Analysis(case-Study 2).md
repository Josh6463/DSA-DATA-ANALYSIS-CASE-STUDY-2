
 Q5. KMS incurred the most shipping cost using which shipping method?

 
     sql```
          select top 1 Ship_Mode,
          Sum(Shipping_Cost) As Highestshippingcost
         From [KMS Sql Case Study] 
	 group by Ship_Mode 
         Order by Highestshippingcost  desc;```
         
         ```sql 
	   select top 10 (Shipping_Cost) As HighestshippingCost,
           Ship_Mode,Ship_Date
          from [KMS Sql Case Study] 
          group by Shipping_Cost,Ship_Mode,Ship_Date
          order by HighestshippingCost desc```
         
    
