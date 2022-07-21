select * from Customer
select * from Product
select * from OrderItem
select * from Orders


Create Table Customer
(
ID int NOT NULL Primary Key,
FirstName nvarchar(40) NOT NULL,
LastName nvarchar(40),
City nvarchar(40),
Country nvarchar(40),
Phone nvarchar(20)
)



Create Table Orders
(
ID int NOT NULL Primary Key,
OrderDate datetime NOT NULL,
OrderNumber nvarchar(10),
CustomerID int NOT NULL,
TotalAmount decimal(12,2)
)

Alter Table Orders add constraint Orders_CutomerID_FK
Foreign Key (ID) references Customer(ID)

Create Table Product
(
ID int NOT NULL Primary Key,
ProductName nvarchar(50) NOT NULL,
UnitPrice  decimal(12,2),
Package nvarchar(50),
IsDiscontinued bit
)


Create Table OrderItem
(
ID int NOT NULL Primary Key,
OrderID int NOT NULL,
ProductID int NOT NULL,
UnitPrice  decimal(12,2),
Quantity int NOT NULL
)

Alter Table OrderItem add constraint OrderItem_ProductID_FK
Foreign Key (ID) references Product(ID)

Alter Table OrderItem add constraint OrderItem_OrderID_FK
Foreign Key (ID) references Orders(ID)


select * from OrderItem

select * from Customer

select * from Customer
where FirstName like 'A%' or Country like 'I%';

select * from Customer
where FirstName like '__n%';

select * from Customer
where Country like 'NY%' ;


SELECT FirstName + ' ' + LastName As FullName FROM Customer;


select * from Customer
where FirstName like '_m%';


SELECT * FROM OrderItem
WHERE UnitPrice BETWEEN 10 AND 20;

select * from OrderItem where UnitPrice > 10 AND UnitPrice < 20

select * from Product
where ProductName like 'Exotic Liquids%';


select * from Orders 
order by ShippingDate


select * from Orders where ShippingName = 'La corne d''abondance' and 
OrderDate BETWEEN '2022-02-01' AND '2022-02-20'


select * from Product where Supplied= 'Exotic Liquid'

select * from OrderItem
select ProductID, AVG(Quantity) as AverageQuantity 
from OrderItem Group By ProductID

select * from Employee
select * from Manager

select E_FirstName ,M_FirstName
from Employee
INNER JOIN Manager
ON Employee.ManagerID = Manager.ID

create table ProductFinal
(
	PID int NOT NULL PRIMARY KEY,
	ProductName nvarchar(50),
	UnitPrice decimal(12,2),
	Discount decimal(12,2),
	Price_After_Discount AS ((100 - Discount)/100) * UnitPrice
)


SELECT 		OI.OrderID , P.ProductName, P.Category, P.UnitPrice,P.Price_After_Discount
from 			ProductFinal P 
INNER JOIN 	OrderItem OI
ON 			P.PID = OI.ProductID
WHERE 		OI.OrderID = 5

select O.TotalAmount as [Total Price of Orders], P.Supplied, O.ShippingName, P.UnitPrice
from Orders O
Join	 OrderItem OI
ON 	 O.ID = OI.OrderID
Join Product P
ON    P.ID = OI.ProductID
WHERE P.UnitPrice > 50 AND P.Supplied = 'Solid'


select * from Customer
select    O.ID as [Number of Orders],P.ProductName, C.FirstName+' '+C.LastName as Customer, C.Phone, OI.ProductID
from		Orders O
JOIN 	Customer C
ON		C.ID = O.CustomerID
JOIN		OrderItem OI
ON		O.ID = OI.OrderID
JOIN		Product P
ON		P.ID = OI.ProductID
where	C.Phone = '8796045392'

select * from Product where Category = 'Dairy'


select	O.ID as Orders, OI.ProductID, P.ProductName, C.FirstName+' '+C.LastName as Customer, C.Country
FROM		[Orders] O
JOIN		Customer C
ON		C.ID = O.CustomerID
JOIN		OrderItem OI
ON		O.ID = OI.OrderID
JOIN		Product P
ON		P.ID = OI.ProductID
WHERE	C.Country != 'NY'



select	O.ID as Orders, OI.ProductID, P.ProductName, C.FirstName+' '+C.LastName as Customer
from 	[Orders] O
JOIN		Customer C
ON		C.ID = O.CustomerID
JOIN		OrderItem OI
ON		O.ID = OI.OrderID
JOIN		Product P
ON		P.ID = OI.ProductID
Where	P.ProductName = 'Biscuits'



select * from Employee
Alter Table Employee add constraint Employee_DepartmentID_FK
Foreign Key (ID) references Department(DID)


select 		E.E_FirstName+' '+E.E_LastName as [Employee Name] , D.Department_Name, E.Ratings
from   		Employee E
INNER JOIN 	Department D
ON     		E.DepartmentID = D.DID


select O.TotalAmount as [Total Price of Orders], P.Supplied, O.ShippingName, P.UnitPrice ,P.Category,  C.FirstName+' '+C.LastName as Customer
from Orders O
Join	 OrderItem OI
ON 	 O.ID = OI.OrderID
JOIN		Customer C
ON		C.ID = O.CustomerID
Join Product P
ON    P.ID = OI.ProductID
WHERE P.UnitPrice > 50 AND P.Supplied = 'Exotic Liquid'


SELECT * FROM Employee 
ORDER BY DOJ DESC



select * from OrderItem
select ProductID, AVG(Quantity) as AverageQuantity 
from OrderItem Group By ProductID

SELECT
    MAX(UnitPrice) AS [MOST EXPENSIVE],
    MIN(UnitPrice) AS [LEAST EXPENSIVE]
FROM Product 

select FirstName, count(FirstName) as [Maximum Orders]
from Orders
INNER JOIN Customer ON Orders.CustomerID = Customer.ID
GROUP BY FirstName


select * from Product where IsDiscontinued= '1'


select	P.ProductName, P.Quantity as [Unit in Stock], OI.Quantity [Unit in Orders]
from		Product P
join		OrderItem OI
on		P.ID = OI.ProductID
where	P.Quantity < OI.Quantity


SELECT Category, Supplied 
FROM Product

SELECT CONCAT(c.FirstName,' ',c.LastName) AS [Full Name], c.Phone, c.City, c.Country, o.OrderNumber, o.OrderDate
FROM Customer c
INNER JOIN Orders o 
ON c.id = o.CustomerId
WHERE c.id = o.CustomerId

SELECT * FROM CUSTOMER WHERE SUBSTRING([FirstName],1,2)='RI'

SELECT SUBSTRING(ShippingName, 1, CHARINDEX(' ', ShippingName)) as[1st_word] FROM Orders;