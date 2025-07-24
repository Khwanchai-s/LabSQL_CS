--LabSQL วันที่ท 24 กรกฏาคม 2568
--มูลค่าสินค้าคงเหลือต่อรายการ
SELECT ProductID as รหัสสินค้า , ProductName as ชื่อสินค้า , UnitPrice as ราคา, 
        UnitsInStock as จำนวน, UnitPrice * UnitsInStock AS มูลค่าสินค้า 
FROM Products
--สินค้าที่ต้องสั่งซื้อ
SELECT ProductID as รหัส, ProductName as สินค้า, 
       UnitsInStock + UnitsOnOrder as จำนวนคงเหลือทั้งหมด,  
       ReorderLevel as จุดสั่งซื้อ
FROM Products
where (UnitsInStock + UnitsOnOrder) < ReorderLevel

--ภาษีมูลค่าเพิ่ม 7 %
SELECT ProductID, ProductName, 
        UnitPrice, ROUND(UnitPrice * 0.07, 2) AS Vat7 
FROM Products

--ต้องการคำนวณรายการขายสินค้าในรายการขายที่ 10250 ใช้ตาราง [Order Details]
select orderID, ProductID, UnitPrice,Quantity,Discount,
       UnitPrice * Quantity * (1-Discount) as NetPrice
from [Order Details]
where orderID = 10250

select orderID, ProductID, UnitPrice,Quantity,Discount,
       round(UnitPrice * Quantity * (1-Discount),2) as NetPrice
from [Order Details]
where orderID = 10250

-- ราคาเต็ม - ส่วนลด
-- ราคาเต็ม = ราคา * จำนวน
-- ส่วนลด = ราคา * จำนวน  * ส่วนลด
--(ราคา * จำนวน) - (ราคา * จำนวน  * ส่วนลด)

--สูตรลัด
--ราคา * จำนวน*(1-ส่วนลด)
---------------------------------------
--การใช้ Aggregate Function
SELECT count(*) จำนวน, count(ProductID), count(ProductName),count(UnitPrice)
from Products
where UnitsInStock < 15

-- ต้องการทราบจำนวนพนักงาน
Select count(*) as จำนวน from Employees
-- ต้องการทราบจำนวนลูกค้าที่อยู่ในประเทศ Brazil
Select count(*) from Customers where Country = 'Brazil'
-- ต้องการทราบจำนวนรายการสินค้าในใบสั่งซื้อหมายเลข  10250---- [order details]
Select count(*) from [Order Details] where orderID = 10250
-- ต้องการทราบจำนวนใบสั่งซื้อที่ถูกส่งไปประเทศ Japan---- orders
Select count(*) from orders where ShipCountry = 'japan'

-- ต้องการราคาสินค้า ต่ำสุด สูงสุด ค่าเฉลี่ย
Select min(unitprice) as ราคาต่ำสุด, max(unitprice) as ราคาสูงสุด,
       AVG(UnitPrice) as ราคาเฉลี่ย
from Products

-- ต้องการราคาเฉลี่ย ราคาสูงสุด และราคาต่ำสุด ของสินค้ารหัส 5 ที่ขายได้ [order details]
Select AVG(UnitPrice), max(UnitPrice),min(UnitPrice)
from [Order Details]
where ProductID =5

Select *
from [Order Details]
where ProductID =5

--ชื่อประเทศ และจำนวนลูกค้าในแต่ละประเทศ--- ที่มีลูกค้าน้อยกว่า 5 ราย
Select country, count(*) as จำนวนลูกค้า
from customers
group by Country
HAVING count(*) <5
order by [จำนวนลูกค้า] desc

--ชื่อประเทศ เมือง และจำนวนลูกค้าในแต่ละเมือง--- ที่มีลูกค้ามากกว่า 1 ราย
Select country, city , count(*) as จำนวนลูกค้า
from customers
group by Country, city
HAVING count(*) > 1

--ต้องการข้อมูลจำนวนใบสั่งซื้อที่ส่งไปในแต่ละประเทศ --orders มีมากกว่า  100 รายการ
Select shipCountry, count(*) จำนวนใบสั่งซื้อ
from Orders
GROUP BY ShipCountry
having count(*)>100

--ต้องการจำนวนใบสั่งซื้อที่ส่งไปในแต่ละประเทศเฉพาะในปี 1997 
-- ในประเทศที่มีจำนวนน้อยกว่า 5 รายการ
Select ShipCountry, count(*) จำนวนใบสั่งซื้อ
from orders
where YEAR(OrderDate) = 1997
group by ShipCountry
HAVING count(*)<5

--ต้องการรหัสสินค้า จำนวนที่ขายได้ทั้งหมด ราคาสูงสุด ราคาต่ำสุด ราคาเฉลี่ย
select productID, sum(Quantity) as จำนวนที่ขายได้,
       max(UnitPrice) ราคาสูงสุด, MIN(UnitPrice) ราคาต่ำสุด,
       AVG(UnitPrice) ราคาเฉลี่ย
from [Order Details]
GROUP BY ProductID
having sum(Quantity)>1000
order by ProductID

--ต้องการรหัสใบสั่งซื้อ  และยอดขายรวมในแต่ละใบสั่งซื้อ [order details]
select orderID, sum(UnitPrice * Quantity * (1-Discount)) as TotalPrice
from [Order Details]
GROUP BY orderID







