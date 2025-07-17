Select * from Employees
select EmployeeID, FirstName,LastName from Employees
Select *  --ทุกคอลัมน์
from Employees  --ตารางพนักงาน
where city = 'london'  --อยู่ในลอนดอน

Select EmployeeID,FirstName,LastName
from Employees  
where city = 'london'  
--สินค้าที่มีราคามากกว่า 200
Select * from Products
where UnitPrice>200
--สินค้าที่มีราคาไม่เกิน 5$
Select * from Products
where UnitPrice<=5
-- ข้อมูลลูกค้าที่อยู่ในเมือง London, vancouver
SELECT  *
FROM   Customers
WHERE  (City ='London') OR (City ='Vancouver')

SELECT  *
FROM   Customers
WHERE  City ='London' Or city = 'vancouver'
--แสดงข้อมูลลูกค้าที่อยู่ในประเทศ USA หรือ ในเมือง Vancouver
SELECT CompanyName,ContactName,Phone
FROM    Customers
WHERE  not(Country  = 'USA' or city = 'vancouver')
--
Select * from customers where not fax is null

-- ต้องการข้อมูลลูกค้าที่อยู่ประเทศที่ลงท้ายด้วย Land
Select * from customers where country like '%land'
-- ต้องการข้อมูลลูกค้าที่ชื่อบริษัทมีคำว่า chi
Select * from customers where CompanyName like '%nese%'
-- ต้องการข้อมูลลูกค้า ที่ชื่อบริษัท หรือชื่อผู้ติดต่อ มีตัวอักษร ny
Select * from customers 
where CompanyName like '%ny%' or ContactName like '%ny%'
-- ต้องการข้อมูลพนักงานที่มีอักษรในชื่อตัวที่ 2 เป็น a
Select * from Employees
where FirstName LIKE '_a%t'
-- ต้องการข้อมูลพนักงานที่มีอักษรขึ้นต้นด้วย a, r , s
Select * from Employees
where FirstName LIKE '[ars]%'
-- ต้องการข้อมูลพนักงานที่มีอักษรขึ้นต้นด้วย a จนถึง m
Select * from Employees
where FirstName LIKE '[a-m]%'

-- เรียกตัวที่ใช้แทนตัวอักษรทั้งหลายว่า Wildcard ประกอบด้วย % _ [] -

-- Order by------
--แสดงข้อมูลรหัสประเภทสินค้า, ชื่อสินค้า และราคา 
--โดยเรียงลำดับตามรหัสประเภทสินค้าจากน้อยไปมาก 
--หากรหัสประเภทเป็นรหัสเดียวกันให้เรียงตามราคาสินค้าจากมากไปน้อย
SELECT	CategoryID, ProductName, UnitPrice
FROM    	Products
ORDER  BY  CategoryID ASC , UnitPrice DESC
