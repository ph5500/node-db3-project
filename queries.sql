-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select product.ProductName, category.CategoryName
from Product
Inner join Category on product.CategoryId = category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.Id
,o.orderdate, shipper.CompanyName from "order" as o
inner join shipper on o.ShipVia = shipper.Id
order by orderdate
Limit 429


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select o.id as testname
, o.Quantity
, product.ProductName 
from OrderDetail as o
inner join product on o.ProductId = product.Id
where testname like '10248%'

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.


Select o.id as [Order ID]
, customer.CompanyName as [Customer Company]
, employee.LastName as [Employee Last Name]
from [order] as o
inner join employee on o.EmployeeId = employee.Id
inner join customer on o.CustomerId = customer.Id