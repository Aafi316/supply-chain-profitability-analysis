
SELECT 
    Shipping_Mode,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN Late_delivery_risk = 1 THEN 1 ELSE 0 END) AS Late_Orders,
    CAST(ROUND(100.0 * SUM(CASE WHEN Late_delivery_risk = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(10,2)) AS Late_Delivery_Rate_Pct,
    ROUND(AVG(Order_Item_Profit_Ratio) * 100, 2) AS Avg_Margin_Pct
FROM DataCoSupplyChainDataset
GROUP BY Shipping_Mode
ORDER BY Late_Delivery_Rate_Pct DESC