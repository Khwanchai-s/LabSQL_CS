-- แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
Select c.CategoryName, p.ProductName, p.UnitPrice
from products as p, Categories as c
where p.CategoryID = C.CategoryID


Select CategoryName, ProductName, UnitPrice
from products as p JOIN Categories as c
on p.CategoryID = C.CategoryID

--ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่าย ประเทศ
Select p.ProductID, p.ProductName, s.CompanyName, s.Country
from Products p JOIN Suppliers s on p.SupplierID = s.SupplierID

Select p.ProductID, p.ProductName, s.CompanyName, s.Country
from Products p ,  Suppliers s where p.SupplierID = s.SupplierID

-- ต้องการรหัสพนักงาน ชื่อพนักงาน รหัสใบสั่งซื้อที่เกี่ยวข้อง เรียงตามลำดับรหัสพนักงาน
select e.EmployeeID, FirstName, orderID 
from Employees as e join orders as o on e.EmployeeID = o.EmployeeID
order by EmployeeID

-- ต้องการรหัสสินค้า เมือง และประเทศของบริษัทผู้จำหน่าย
Select productID , ProductName, City, Country
from Products p join Suppliers s on p.SupplierID = s.SupplierID

-- ต้องการชื่อบริษัทขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
select CompanyName, count(*)
from orders as o join Shippers as s on o.ShipVia = s.ShipperID
GROUP by CompanyName
-- ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
Select p.ProductID,p.ProductName, sum(Quantity) as จำนวนที่ขายได้ทั้งหมด
from products p join [Order Details] od on p.ProductID = od.ProductID
GROUP BY p.ProductID,p.ProductName
order by 1

-- ต้องการรหัสสินค้า ชื่อสินค้า ที่ nancy ขายได้ ทั้งหมด เรียงตามลำดับรหัสสินค้า
select distinct p.ProductID,p.ProductName
from Employees e join orders o on e.EmployeeID = o.EmployeeID
                 join [Order Details] od on o.OrderID = od.OrderID
                 join products p on od.ProductID = p.ProductID
where e.FirstName = 'Nancy'
order by productID
-- ต้องการชื่อบริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง 
Select distinct s.Country 
from customers c join orders o on c.CustomerID = o.CustomerID
                 join [Order Details]  od on o.OrderID = od.OrderID
                 join Products p on od.ProductID = p.ProductID
                 join Suppliers s on s.SupplierID = p.SupplierID
where c.CompanyName = 'Around the Horn'
-- บริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าใด
select p.ProductID, p.ProductName, sum(Quantity) as [sum of Quantity]
from customers c join orders o on c.CustomerID = o.CustomerID
                 join [Order Details] od on od.OrderID = o.OrderID
                 join products p on p.ProductID = od.ProductID
where c.CompanyName = 'Around the Horn'
GROUP by p.ProductID, p.ProductName
order by 1
-- ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อนั้น
Select o.OrderID, e.FirstName, 
       sum((od.Quantity * od.UnitPrice * (1-od.Discount))) as TotalCash
from orders o join Employees e on o.EmployeeID = e.EmployeeID
              join [Order Details] od on o.OrderID = od.OrderID
GROUP by o.OrderID, e.FirstName
order by orderID
