-- แบบฝึกหัด SQL ใช้ฐานข้อมูล  Minimart
-- 1. สินค้าที่มีราคา 15 บาท
Select * from products where UnitPrice =15
-- 2. สินค้าที่มีจำนวนคงเหลือในสต๊อกต่ำกว่า 250 
Select * from Products where UnitsInStock<250
-- 3. รหัสสินคา ชื่อสินค้าที่เลิกจำหน่ายแล้ว
Select * from Products where Discontinued = 1
-- 4. รหัสสินค้า ชื่อสินค้า ราคา ของสินค้าที่มีราคามากกว่า 100
Select productID, ProductName,UnitPrice from Products where UnitPrice> 100
-- 5. รหัสสินค้า และราคาของยางลบ
Select ProductID,UnitPrice from Products where ProductName = 'ยางลบ'
-- 6. หมายเลขใบเสร็จ วันที่ และ ราคารวม ของใบเสร็จที่ออกก่อนวันที่ 15 ก.พ.
select ReceiptID,ReceiptDate,TotalCash from Receipts where ReceiptDate < '2013-02-15'
-- 7. รหัสสินค้า ชื่อสินค้า ที่มีจำนวนคงเหลือตั้งแต่ 400 ขึ้นไป
Select ProductID, ProductName from Products where UnitsInStock>=400
-- 8. รหัสสินค้า ชื่อสินค้า ราคา และ จำนวนคงเหลือ ของแชมพู,แป้งเด็ก,ดินสอ,ยางลบ
Select productID,ProductName,UnitPrice,UnitsInStock  from Products
where ProductName in ('แชมพู','แป้งเด็ก','ดินสอ','ยางลบ')
-- 9. รายละเอียดของสินค้าประเภทเครื่องเขียน
Select [Description] from Categories where CategoryName = 'เครื่องเขียน'
-- 10. รหัสประเภทสินค้า ชื่อประเภท และรายละเอียดของ สินค้าประเภทเครื่องสำอาง
Select CategoryID,CategoryName,[Description] from Categories
-- 11.คำนำหน้า ชื่อ นามสกุล ของพนักงานที่เป็น Sale Representative
Select title, FirstName,LastName from Employees where [Position] = 'Sale Representative'
-- 12. รหัสพนักงาน ชื่อพนักงาน ชื่อผู้ใช้ รหัสผ่าน ของพนักงานทุกคน
select EmployeeID,title+ FirstName+space(1)+LastName EmployeeName, UserName,[Password]  
from Employees
-- 13. ชื่อผู้ใช้ และรหัสผ่านของพนักงานที่ชื่อก้องนิรันดร์
Select Username, Password from Employees where FirstName = 'ก้องนิรันดร์'
-- 14. รหัสพนักงานที่ออกใบเสร็จหมายเลข 3 
SELECT employeeID from Receipts where ReceiptID = 3
-- 15. รหัสสินค้า ชื่อสินค้า ราคา ของสินค้าที่มีรหัสประเภท 2, 4
Select productID, ProductName unitprice from Products where CategoryID in (2,4)
