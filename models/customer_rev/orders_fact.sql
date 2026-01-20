

SELECT
    O.OrderID,
    O.OrderDate,
    O.CustomerID,
    O.EmployeeID,
    O.StoreID,
    O.StatusCD,
    O.StatusDesc,
    COUNT(DISTINCT O.OrderID) AS OrderCount,
    SUM(OI.TotalPrice) AS Revenue,
FROM

{{ ref('orders_stg')}} as O

left join {{ ref('orderitems_stg')}} OI on O.orderid=OI.orderid

group by 1,2,3,4,5,6,7