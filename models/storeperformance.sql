SELECT
    OS.StoreID,
    SUM(OFACT.Revenue) AS ActualSales,
    SUM(ST.SalesTarget) AS TargetSales
FROM
    {{ ref('orders_stg') }} OS
LEFT JOIN
    {{ ref('orders_fact') }} OFACT ON OS.OrderID = OFACT.OrderID
LEFT JOIN
    {{ ref('salestargets') }} ST ON ST.StoreID = OS.StoreID
GROUP BY 1