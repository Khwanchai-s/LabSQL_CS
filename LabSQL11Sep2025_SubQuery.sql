--Sub Query
--ต้องการข้อมูลคนที่มีตำแหน่งเดียวกับ Nancy
-- 1.หาตำแหน่งของ Nancy ก่อน
    Select title from Employees where firstname = 'Nancy'
-- 2.หาข้อมูลคนที่มีตำแหน่งเดียวกับข้อ 1
    Select * 
    from Employees 
    where Title = (Select title from Employees where firstname = 'Nancy')
--ต้องการชื่อนามสกุลพนักงานที่มีอายุมากที่สุด
Select FirstName,Lastname from Employees
where BirthDate = (Select min(BirthDate) from Employees)

--ต้องการชื่อสินค้าที่มีราคามากกว่าสินค้าชือ Ikura
Select ProductName from Products
where UnitPrice > (Select UnitPrice from Products 
                    where ProductName = 'Ikura')

--ต้องการชื่อบริษัทลูกค้าที่อยู่เมืองเดียวกับบริษัทชื่อ Around the Horn
Select CompanyName from Customers 
where city = (Select city from customers 
                where CompanyName= 'Around the Horn')

--ต้องการข้อมูลใบสั่งซื้อรายการแรก ในปี 1998
Select * from orders
where orderDate = (Select Min(OrderDate) from Orders
                    where year(orderdate)=1998)

--ต้องการชื่อนามสกุลพนักงานที่เข้างานคนล่าสุด
Select FirstName,Lastname from Employees
where HireDate = (Select Max(HireDate) from Employees)

--ข้อมูลใบสั่งซื้อที่ถูกส่งไปประเทศที่ไม่มีผู้ผลิตสินค้าตั้งอยู่
Select * from Orders
where ShipCountry not in (Select distinct country from Suppliers)

--ต้องการข้อมูลสินค้าที่มีราคาน้อยกว่า 50$
Select ROW_NUMBER() OVER (ORDER BY ProductName) AS RowNum,
ProductID, productName, UnitPrice 
from products
where UnitPrice <50

Select ROW_NUMBER() OVER (ORDER BY UnitPrice desc) AS RowNum,
ProductID, productName, UnitPrice 
from products
where UnitPrice <50

--คำสั่ง DML (Insert Update Delete)
Select * from Shippers
--ตาราง มี PK เป็น AutoIncrement (AutoNumber)
Insert into Shippers
values ('บริษัทขนเยอะจำกัด','081-1234567')

insert into Shippers(CompanyName)
values('บริษัทขนมหาศาลจำกัด')


Select * from Customers
--ตารางที่มี PK เป็น Char, nChar
Insert into customers(CustomerID,CompanyName,Phone)
values('UDRU1','บริษัทซื้อเยอะจำกัด','089-1234567')

--คำสั่ง Update
Update Shippers set phone = '087-9998888'
where CompanyName = 'บริษัทขนเยอะจำกัด'

update Shippers set phone = '042-2110401'
where ShipperID = 5

update customers 
set ContactName = 'วรมินทร์', 
    ContactTitle = 'HR',
    Address = 'อุดรธานี Thailand'
where customerID = 'UDRU1'
 
 --ปรับปรุงจำนวนสินค้าคงเหลือสินค้ารหัส 1 เพิ่มจำนวนเข้าไป 100 ชิ้น
 Update products set UnitsInStock = UnitsInStock + 100
 where productID =1 

 --คำสั่ง Delete 
 --ลบบริษัทขนส่งสินค้า รหัส 5 
 Delete from Shippers where ShipperID =  5

 Delete from Shippers where ShipperID =  1  -- ได้หรือไม่ ทำไมเหตุผล

 Delete from customers where customerID = 'UDRU1'


 select distinct shipvia from orders

select * from products
select * from Shippers
select * from customers