SELECT 
    Category_Name,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales_per_customer), 2) AS Total_Revenue,
    ROUND(SUM(Order_Profit_Per_Order), 2) AS Total_Profit,
    ROUND(AVG(Order_Item_Profit_Ratio) * 100, 2) AS Avg_Profit_Margin_Pct
FROM DataCoSupplyChainDataset
GROUP BY Category_Name
ORDER BY Total_Profit DESC