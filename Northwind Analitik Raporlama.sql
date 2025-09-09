-- Northwind Analitik Raporlama

-- 1.Yıllara Göre Satış Trendleri --

SELECT YEAR(o.OrderDate) AS Yil,
ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS ToplamSatis
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY YEAR(O.OrderDate)
ORDER BY Yil

-- 2.Kategori Bazında Satış Analizi -- 

SELECT c.CategoryName,
ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS ToplamSatis
FROM [Order Details] od
join Products p ON od.ProductID = p.ProductID
join Categories c ON p.CategoryID =c.CategoryID
group by c.CategoryName
order by ToplamSatis desc


-- 3.Bölgesel Satış Analizi -- 

SELECT c.Country,
ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS ToplamSatis
FROM Customers c 
JOIN Orders o ON c.CustomerID =o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.Country
ORDER BY ToplamSatis desc ;

-- 4.Çalışan Performansı --

SELECT e.FirstName +' '+ e.LastName AS Calisan,
ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS ToplamSatis,
COUNT(DISTINCT o.OrderID) AS SiparisSayisi
FROM Employees e
JOIN Orders o ON e.EmployeeID = O.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.FirstName , e.LastName
ORDER BY ToplamSatis desc ;

-- 5.En Çok Sipariş Veren Müşteriler --

SELECT c.CompanyName as Musteri,
COUNT(o.OrderID) as SiparisSayisi,
ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS ToplamSatis
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
ORDER BY ToplamSatis desc ;