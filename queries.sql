-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.ProductName as Product, c.CategoryName as Category
from product as p
join category as c
    on p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.Id as OrderId, s.CompanyName as ShipperCompany
from [order] as o
join shipper as s
    on o.ShipVia = s.Id
where o.OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select distinct p.ProductName as Product, o.Quantity
from product as p
join orderDetail as o
    on o.ProductId = p.Id
where o.orderId = '10251'
order by p.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.Id as OrderId, c.CompanyName as CustomerCompanyName, e.LastName as EmployeeLastName
from [order] as o
join customer as c
    on o.CustomerId = c.Id
join employee as e
    on o.EmployeeId = e.Id
