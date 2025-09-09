
-- Northwind Veri Keşfi (EDA)

-- Kaç müşteri var?
select count(*) from Customers  -- 91 adet müşteri bulunmakta.

-- Kaç sipariş var ?
select count(*) from Orders -- 830 adet sipraaiş bulunmakta.

-- Orders tablosunda eksik müşteri ya da çalışan var mı?
SELECT * 
FROM Orders
WHERE CustomerID IS NULL OR EmployeeID IS NULL -- Boş değer bulunmamaktadır.

-- Order Details tablosunda eksik ürün var mı?
SELECT * 
FROM [Order Details]
WHERE ProductID IS NULL  -- EKSİK DEĞER YOK.

-- Temel İstatistikler

-- Yıllara göre sipariş sayısı:

SELECT YEAR(OrderDate) AS Yil ,COUNT(*) AS SiparisSayısı
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY Yil

-- Kaç farklı ülkeye satış yapılmış?
SELECT COUNT(DISTINCT Country) AS UlkeSayisi
FROM Customers

-- En çok satılan ürünler:
SELECT TOP 10 p.ProductName , Sum(od.Quantity) as ToplamAdet
FROM [Order Details] od
join Products p on od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY ToplamAdet DESC

