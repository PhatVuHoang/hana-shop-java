create database Assignment1_VuHoangPhat
go
use Assignment1_VuHoangPhat
go

create table tblUser
(
	userID varchar(20) primary key,
	password varchar(20),
	fullname nvarchar(50),
	phoneNo varchar(10),
	email varchar(50),
	isAdmin bit
)
go
create table tblCategory
(
	categoryID int primary key,
	categoryName nvarchar(50)
)
go
create table tblProduct
(
	productID int identity(1,1) primary key,
	imageProduct varchar(1000),
	nameProduct nvarchar(50),
	descriptionProduct nvarchar(1000),
	price float,
	quantity int,
	createDate date,
	invalidDate date,
	categoryID int foreign key (categoryID) references tblCategory(categoryID),
	status bit
)
go
create table tblInvoice
(
	InvoiceID int identity(1,1) primary key,
	fullname nvarchar(50),
	phone varchar(10),
	email varchar(100),
	address nvarchar(100),
	dateOrder date
)
go
create table tblInvoiceDetail
(
	InvoiceID int foreign key (InvoiceID) references tblInvoice(InvoiceID),
	productID int foreign key (productID) references tblProduct(productID),
	productName varchar(50),
	quantity int,
	price float
)
go
create table tblHistoryModifier
(
	nameAdmin varchar(50),
	dateModify date,
	actionModify varchar(50),
	IdProduct int
)
go

insert into tblUser(userID,password,fullname,phoneNo,email,isAdmin)
values('phatvh','123456789','Vu Hoang Phat', '0989998395','phatvhse140209@fpt.edu.vn',1)
go
insert into tblUser(userID,password,fullname,phoneNo,email,isAdmin)
values('hoaitq','123456789','Thai Quoc Hoai', '0987654321','hoaitqse140980@fpt.edu.vn',0)
go
insert into tblUser(userID,password,fullname,phoneNo,email,isAdmin)
values('hungnp','123456789','Nguyen Phi Hung', '0912345678','hungnpse140205@fpt.edu.vn',0)
go
insert into tblUser(userID,password,fullname,phoneNo,email,isAdmin)
values('test','123456','Tester', '0912345678','tester@fpt.edu.vn',0)
go
insert into tblUser(userID,password,fullname,phoneNo,email,isAdmin)
values('admin','123456','Admin', '0912345678','Admin@fpt.edu.vn',0)
go

--INSERT CATEGORY--
insert into tblCategory(categoryID,categoryName)
values(1,'Cup Cake')
insert into tblCategory(categoryID,categoryName)
values(2,'Donut')
insert into tblCategory(categoryID,categoryName)
values(3,'Butter')

--INSERT PRODUCT--
--INSERT CAKE--
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cup Cake Product 1', 'description', 100, 10,'1/13/2021','1/25/2022',1,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cup Cake Product 2', 'description', 100, 10,'1/13/2021','1/25/2022',1,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 3', 'description', 100, 10,'1/13/2021','1/25/2022',2,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 4', 'description', 100, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 5', 'description', 50, 10,'1/13/2021','1/25/2022',2,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 6', 'description', 200, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 7', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 8', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 9', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 10', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 11', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 12', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 13', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 14', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 15', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 16', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 17', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 18', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 19', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 20', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 21', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 22', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 23', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 24', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 25', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 26', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 27', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 28', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 29', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 30', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 31', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 32', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 33', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 34', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 35', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 36', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 37', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 38', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 39', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 40', 'description', 500, 10,'1/13/2021','1/25/2022',3,1)
insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity,createDate,invalidDate,categoryID,status)
values('https://www.bettycrocker.com.au/-/media/platform-images/Betty-Crocker/Australia/products-new/new-batch-two/supermoist-vanilla-cupcake-mix-610.ashx','Cake Product 40', 'description', 500, 10,'1/13/2021','1/16/2021',3,1)


