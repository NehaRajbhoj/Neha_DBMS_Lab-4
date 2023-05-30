--
-- 1)	You are required to create tables for supplier,customer,category,product,supplier_pricing,order,
-- rating to store the data for the E-commerce with the schema definition given below.
--
-- 2)   You are required to develop SQL based programs (Queries) to facilitate the Admin team of 
--      the E-Commerce company to retrieve the data in summarized format 
--      The Data Retrieval needs are described below.
--
-- 3) 	Insert the following data in the table created above
--

CREATE DATABASE E_commerce;
--
-- Table structure for table 'category'
--
create table if not exists `category` (
  `cat_id` int(5) not null default '0',
  `cat_name` varchar(20) default null,
  primary key (`cat_id`)
)

--
-- Dumping data for table `category`
--
insert into `category` (`cat_id`, `cat_name`) values
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONIC'),
(5, 'CLOTHES');

--
-- table structure for table 'product'
--
create table if not exists `product` (
  `pro_id` int(5) not null default '0',
  `pro_name` varchar(20) not null default 'Dummy',
  `pro_desc` varchar(60) default null,
  `cat_id` int(5) default null,
  primary key (`pro_id`),
  key `cat_id` (`cat_id`)
)
--
-- Dumping data for table `product`
--
insert into `product` (`pro_id`, `pro_name`, `pro_desc`, `cat_id`) values
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);


--
-- Table structure for table `supplier`
--
create table if not exists `supplier` (
  `supp_id` int(5) not null default '0',
  `supp_name` varchar(50) default null,
  `supp_city` varchar(50) default null,
  `supp_phone` varchar(50) default null,
  primary key (`supp_id`)
)
--
-- Dumping data for table `supplier`
--
insert into `supplier` (`supp_id`, `supp_name`, `supp_city`, `supp_phone`) values
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

--
-- Table structure for table `supplier_pricing`
--
create table if not exists `supplier_pricing` (
  `pricing_id` int(5)not null default '0',
  `pro_id` int(5) default null,
  `supp_id` int(5) default null,
  `supp_price` int(5) default null,
  primary key (`pricing_id`),
  key `pro_id` (`pro_id`),
  key `supp_id` (`supp_id`)
) 
--
-- Dumping data for table `supplier_pricing`
--
insert into `supplier_pricing` (`pricing_id`, `pro_id`, `supp_id`, `supp_price`) values
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

--
-- Table structure for table `customer`
--
create table if not exists `customer` (
  `cus_id` int(5) not null default '0',
  `cus_name` varchar(20) default null,
  `cus_phone` varchar(10) default null,
  `cus_city` varchar(30) default null,
  `cus_gender` char(1) default null,
  primary key (`cus_id`)
)
--
-- Dumping data for table `customer`
--
insert into `customer` (`cus_id`, `cus_name`, `cus_phone`, `cus_city`, `cus_gender`) values
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

--
-- Table structure for table `orders`
--
create table if not exists `orders` (
  `ord_id` int(5) not null default '0',
  `ord_amount` int(5) not null default '0',
  `ord_date` date default null,
  `cus_id` int(5) default null,
  `pricing_id` int(5) default null,
  primary key (`ord_id`),
  key `cus_id` (`cus_id`),
  key `pricing_id` (`pricing_id`)
)
--
-- Dumping data for table `orders`
--
insert into `orders` (`ord_id`,`ord_amount`, `ord_date`, `cus_id`, `pricing_id`) values
(101, 1500 , '2021-10-06', 2, 1),
(102, 1000 , '2021-10-12', 3, 5),
(103, 30000 , '2021-09-16', 5, 2),
(104, 1500 , '2021-10-05', 1, 1),
(105, 3000 ,'2021-08-16', 4, 3),
(106, 1450 ,'2021-08-18', 1, 9),
(107, 789 ,'2021-09-01', 3, 7),
(108, 780 ,'2021-09-07', 5, 6),
(109, 3000 ,'2021-09-10', 5, 3),
(110, 2500 ,'2021-09-10', 2, 4),
(111, 1000 ,'2021-09-15', 4, 5),
(112, 789 ,'2021-09-16', 4, 7),
(113, 31000 ,'2021-09-16', 1, 8),
(114, 1000 ,'2021-09-16', 3, 5),
(115, 3000 ,'2021-09-16', 5, 3),
(116, 99 ,'2021-09-17', 2, 14);

--
-- Table structure for table `rating`
--
create table if not exists `rating` (
  `rat_id` int(5) not null default '0',
  `ord_id` int(5) default null,
  `rat_ratstars` int(5) default null,
  primary key (`rat_id`),
  key `ord_id` (`ord_id`)
)

--
-- Dumping data for table `rating`
--
insert into `rating` (`rat_id`, `ord_id`, `rat_ratstars`) values
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

--
-- 4)	Display the total number of customers based on gender 
--      who have placed individual orders of worth at least Rs.3000.
--

select cus_gender, count(distinct cus_id) 
from customer
left join (orders)
using (cus_id)
where ord_amount >= 3000
group by cus_gender;

--
-- 5)  	Display all the orders along with product name ordered by 
--      a customer having Customer_Id=2
--

select ord_id, pro_name
from customer
join orders
using ( cus_id )
join supplier_pricing
using ( pricing_id )
join product
using ( pro_id )
where cus_id = 2;


--
-- 6) 	Display the Supplier details who can supply more than one product.
--

select supp_id, supp_name ,supp_city ,supp_phone
from supplier
join supplier_pricing
using ( supp_id )
join product
using ( pro_id )
group by supp_id
having count( supp_id ) >1

--
-- 7)	Find the least expensive product from each category 
--      and print the table with category id, name, product name 
--      and price of the product
-- 

select
    c.cat_id,
    c.cat_name,
    p1.pro_name,
    sp.supp_price
from
    category c
join
    product p1 USING (cat_id)
join
    supplier_pricing sp USING (pro_id)
where
    sp.supp_price = (
        select
            min(supp_price)
        from
            supplier_pricing
        where
            pro_id = p1.pro_id
    )
group by
    c.cat_id;




--
-- 8)	Display the Id and Name of the Product ordered after “2021-10-05”.
--
select pro_id, pro_name
from product
join supplier_pricing
using ( pro_id )
join orders
using ( pricing_id )
where ord_date > '2021-10-05';

--
-- 9)	Display customer name and gender whose names start or end with character 'A'.
--

select cus_name , cus_gender
from customer 
where cus_name like 'a%'
or 
cus_name like  '%a';

--
-- 10)	Create a stored procedure to display supplier id, name,
--      Rating(Average rating of all the products sold by every customer) and
--      Type_of_Service.
--      For Type_of_Service, If rating =5, 
--      print “Excellent Service”   ,If rating >4 print “Good Service”, 
--      If rating >2 print “Average Service”     else print “Poor Service”.
--      Note that there should be one rating per supplier.
--
--

create procedure GetSupplierInfo()

    select
        s.supp_id,
        s.Supp_name,
        avg(r.rat_ratstars) as AverageRating,
        case
            when avg(r.rat_ratstars) = 5 then 'Excellent Service'
            when avg(r.rat_ratstars) > 4 then 'Good Service'
            when avg(r.rat_ratstars) > 2 then 'Average Service'
            else 'Poor Service'
        end as Type_of_Service
    from
        supplier s
    inner join
        supplier_pricing p ON s.Supp_id = p.supp_id
        inner join
        orders o ON p.pricing_id = o.pricing_id
        inner join
        rating r on o.ord_id = r.ord_id
    group by
        s.supp_id ,
       s.supp_name ;



