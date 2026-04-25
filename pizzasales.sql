--1.  Total Revenue
SELECT 
	SUM([total_price]) AS [TOTAL REVENUE]
FROM [dbo].[Pizza Data ETL]

---TO ROUNDUP  THE TOTAL REVENUE TO 2 DECIMAL PLACES
SELECT 
	CAST( SUM ([total_price]) AS DECIMAL (20,2)) AS [TOTAL REVENUE]
FROM [dbo].[Pizza Data ETL]


--2.	Total Pizzas Sold
SELECT 
	SUM ([quantity]) AS [TOTAL PIZZA SOLD]
FROM [dbo].[Pizza Data ETL]

--3.	Total number of Orders
SELECT 
	COUNT (DISTINCT [order_id] )AS [TOTAL NUMBER OF ORDERS]
FROM [dbo].[Pizza Data ETL]

--4.	How many order Veggie pizza category was sold
SELECT 
	(SUM ([quantity])) AS [TOTAL VEGGIE PIZZA SOLD]
FROM [dbo].[Pizza Data ETL]
WHERE [pizza_category] = 'Veggie'

----OPTION 2: USING HAVING CLAUSE
SELECT 
	(SUM ([quantity])) AS [TOTAL VEGGIE PIZZA SOLD]
FROM [dbo].[Pizza Data ETL]
GROUP BY [pizza_category]
HAVING [pizza_category] = 'Veggie'

--5.	How many  The Hawaiian Pizza and  The Greek Pizza  was sold
SELECT 
	[pizza_name], 
	(SUM ([quantity]) ) AS [TOTAL PIZZA SOLD]
FROM [dbo].[Pizza Data ETL]
GROUP BY [pizza_name]
HAVING [pizza_name] IN ('The Hawaiian Pizza' , 'The Greek Pizza')

--6.	List of pizza ordered in January 2015
SELECT 
	[pizza_name],
	(SUM ([quantity]) ) AS [TOTAL PIZZA SOLD]
FROM [dbo].[Pizza Data ETL]
WHERE MONTH ([order_date]) = 1 AND YEAR ([order_date]) =  2015
GROUP BY [pizza_name]
ORDER BY [TOTAL PIZZA SOLD] DESC

--7.	What is the quantity of The Spinach Supreme Pizza sold in March 2015
SELECT  
	(SUM ([quantity]) ) AS [TOTAL QUANTITY OF SPINACH SUPREME PIZZA SOLD IN MARCH 2015]
FROM [dbo].[Pizza Data ETL]
WHERE [pizza_name] = 'The Spinach Supreme Pizza' AND MONTH ([order_date]) = 3 AND YEAR ([order_date]) =2015


--8		LIST OF PIZZA ORDERED BETWEEN 1ST OF NOVEMBER  TILL 31ST DECEMBER 2015
---USING MONTH  AND YEAR FUNCTION
SELECT 
	[pizza_name], 
	SUM ([quantity]) AS [TOTAL PIZZA SOLD]
FROM [dbo].[Pizza Data ETL]
WHERE YEAR ([order_date]) = 2015 AND MONTH ([order_date])  IN (11, 12)
GROUP BY [pizza_name]
ORDER BY [TOTAL PIZZA SOLD]


SELECT 
	   [pizza_name] 
	  ,SUM([quantity]) AS [TOTAL PIZZA SOLD]
FROM [dbo].[Pizza Data ETL]
WHERE [order_date] BETWEEN '2015-11-01' AND '2015-12-31'
GROUP BY [pizza_name]
ORDER BY [TOTAL PIZZA SOLD] DESC


--9.	List of Medium pizza sold
SELECT 
	   [pizza_name] 
	  ,SUM ([quantity]) AS [TOTAL MEDIUM PIZZA SOLD]
FROM [dbo].[Pizza Data ETL]
WHERE [pizza_size] = 'M'
GROUP BY [pizza_name]
ORDER BY [TOTAL MEDIUM PIZZA SOLD] DESC


--10. 	List of pizza that sold for more than 12.5
SELECT 
	   [pizza_name]
	  ,[unit_price]
	  ,[pizza_id]
	  ,[order_id]
	  ,[pizza_size]
  FROM [dbo].[Pizza Data ETL]
  WHERE [unit_price] > 12.5
  ORDER BY [unit_price] DESC

---- ADDING THE TOTAL QUANTITY SOLD TO GIVE MORE INSIGHT
/*SELECT 
	  [pizza_name]
	 ,[unit_price]
	 ,[pizza_id]
	 ,[pizza_size]
     ,SUM([quantity]) AS [TOTAL QUANTITY SOLD]
FROM [dbo].[Pizza Data ETL]
WHERE [unit_price] > 1
GROUP BY [pizza_name], [unit_price]
ORDER BY [unit_price] DESC*/  



-----THE END ----
	
SELECT*
FROM [dbo].[Pizza Data ETL]
	
SELECT TOP 5*
FROM [dbo].[Pizza Data ETL]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
