WITH discount_bands AS (
    SELECT 
        CASE 
            WHEN Order_Item_Discount_Rate = 0 THEN '0% - No Discount'
            WHEN Order_Item_Discount_Rate <= 0.05 THEN '1-5%'
            WHEN Order_Item_Discount_Rate <= 0.10 THEN '6-10%'
            WHEN Order_Item_Discount_Rate <= 0.20 THEN '11-20%'
            ELSE '20%+'
        END AS Discount_Band,
        Order_Item_Profit_Ratio,
        Order_Profit_Per_Order
    FROM DataCoSupplyChainDataset
)
SELECT 
    Discount_Band,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Order_Item_Profit_Ratio) * 100, 2) AS Avg_Margin_Pct,
    ROUND(SUM(Order_Profit_Per_Order), 2) AS Total_Profit
FROM discount_bands
GROUP BY Discount_Band
ORDER BY Avg_Margin_Pct DESC