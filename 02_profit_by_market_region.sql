SELECT 
    Market,
    Order_Region,
    ROUND(SUM(Order_Profit_Per_Order), 2) AS Total_Profit,
    ROUND(SUM(Sales_per_customer), 2) AS Total_Revenue,
    ROUND(AVG(Order_Item_Profit_Ratio) * 100, 2) AS Avg_Margin_Pct,
    COUNT(*) AS Total_Orders
FROM DataCoSupplyChainDataset
GROUP BY Market, Order_Region
ORDER BY Total_Profit DESC