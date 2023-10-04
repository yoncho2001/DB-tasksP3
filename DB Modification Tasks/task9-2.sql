CREATE DATABASE task9
GO
USE task9
GO



CREATE TABLE product(
  maker char(1)  ,
  model varchar(4)  ,
  type varchar(7)  
);


CREATE TABLE printer(
  code int  ,
  model varchar(4)  ,  
  price float 
);

insert into product values('D','1288','Printer');
insert into printer values(1,'1276','n','Laser',400);