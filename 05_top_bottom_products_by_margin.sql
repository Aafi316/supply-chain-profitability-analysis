-- Top 20 Products by Margin
WITH product_profit AS (
    SELECT 
        Product_Name,
        Category_Name,
        ROUND(AVG(Order_Item_Profit_Ratio) * 100, 2) AS Avg_Margin_Pct,
        ROUND(SUM(Order_Profit_Per_Order), 2) AS Total_Profit,
        COUNT(*) AS Total_Orders,
        RANK() OVER (ORDER BY AVG(Order_Item_Profit_Ratio) DESC) AS Profit_Rank
    FROM DataCoSupplyChainDataset
    GROUP BY Product_Name, Category_Name
)
SELECT TOP 20
    Product_Name,
    Category_Name,
    Avg_Margin_Pct,
    Total_Profit,
    Total_Orders,
    Profit_Rank
FROM product_profit
ORDER BY Avg_Margin_Pct DESC

GO

-- Bottom 10 Products by Margin
WITH product_profit AS (
    SELECT 
        Product_Name,
        Category_Name,
        ROUND(AVG(Order_Item_Profit_Ratio) * 100, 2) AS Avg_Margin_Pct,
        ROUND(SUM(Order_Profit_Per_Order), 2) AS Total_Profit,
        COUNT(*) AS Total_Orders,
        RANK() OVER (ORDER BY AVG(Order_Item_Profit_Ratio) ASC) AS Profit_Rank
    FROM DataCoSupplyChainDataset
    GROUP BY Product_Name, Category_Name
)
SELECT TOP 10
    Product_Name,
    Category_Name,
    Avg_Margin_Pct,
    Total_Profit,
    Total_Orders,
    Profit_Rank
FROM product_profit
ORDER BY Avg_Margin_Pct ASC