create database sql_task1;
create table Customer(TransactionID int PRIMARY key);
load data infile 'D:/IMS Proschool/Business Analytics/SQL/Project-20190724/Customer.csv' into table Customer;
drop table customer;
select * from customer;
select * from item;
select count(distinct CustomerID) from customer;
select count(distinct CustomerID) from item;
select * from customer where name not like 'A%' and name not like 'B%' and name not like 'C%' order by name;
select retail_price from item where Retail_Price between 15 and 90 order by Retail_Price;
select * from customer order by customerid desc;
select min(retail_price)  as 'minimum price' from item;
select avg(retail_price) from item;
select sum(retail_price) as 'Total retail price' from item;
select count(*) as 'Number of customers from California' from customer where Shipping_State = 'California';
select count(*) from item where Loyalty_Discount > 0.08;
select avg(retail_price) from item;
alter table item add Average_price double;
update item set Average_price = (select a from(select avg(retail_price) as a from item as t) as result);
alter table customer add primary key (CustomerID);
ALTER TABLE item ADD CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
select count(*) as 'Transactions from Texas' from customer where shipping_state = 'Texas';
select shipping_state, count(*) as Total from customer group by shipping_state order by Total desc limit 1;
select S, max(Total) as T from (select shipping_state as S, count(*) as Total from customer group by shipping_state order by shipping_state desc) as T;