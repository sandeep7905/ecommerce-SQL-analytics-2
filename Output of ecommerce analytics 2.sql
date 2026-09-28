select * from orders2;

select * from customers2;

select * from products2;

--all customr name an city 
select customer_name, city from customers2;

--display that orders details those have 500+ sales
select * from orders2
where sales > 500;
select min(sales) from orders2 where sales > 500;

--Top 10 highest prist value
select * from products2
order by price desc limit 10;

--find that orders where discount is greater or equal to 0.10(10%)
select * from orders2
where discount >= 10;

--display all name and category of products that cost per unit > 500
select product_name , category from products2
where cost_per_unit <500;

--GROUP BY AND AGGREGATE FUNCTIONS
--Total products of total categories
select category, count(product_id)
from products2 group by category;

--overall total sales and how much profit
select sum(sales) as total_sales,sum(profit) as total_profit
from orders2;

--how much orders placed by each customer id
select customer_id , count(order_id)
from orders2 group by customer_id;

--average sales discount of each product categoty
select p.category, avg(o.sales), avg(o.discount)
from orders2 as o
join products2 as p
on o.product_id = p.product_id
group by p.category;

--highest profit generated product id
select product_id, sum(profit) as tatal_profit
from orders2 group by product_id
order by tatal_profit desc
limit 5;

--display customer id that placed 5+ orders------INCOMPLETE
select customer_id, count(order_id)
from orders2 group by customer_id
having count(order_id) > 5;

--display that category name their total sales is 10000
select p.category , sum(o.sales)
from orders2 as o
join products2 as p
on o.product_id = p.product_id
group by category
having sum(o.sales) > 10000000;

--display that product id sold 50+ order quantity-----INCOMPLETE
select product_id, count(quantity)
from orders2
group by product_id
having count(quantity)> 1;

--DISPLAY customer name or city combine corresponding customers with all orders
	select c.customer_name, 
	c.city,
    o.Order_ID,
    o.Order_Date,
    o.Customer_ID,
    c.Customer_Name,
    c.City,
    o.Sales,
    o.Profit
FROM orders2 AS o
JOIN customers2 AS c 
    ON o.Customer_ID = c.Customer_ID;

--DISPLAY that PRODUCT NAME AND FIND THEIR TOTAL SALES THAT have SALE MINIMUM 1 TIME
select p.product_name, sum(o.sales)
from orders2 as o
join products2 as p
on o.product_id = p.product_id
group by p.product_name
order by sum(o.sales);

--display sum details
select o.order_id, o.order_date, c.customer_name, c.city, 
		p.product_name, p.category, o.sales, o.profit
		from customers2 as c
		join orders2 as o
		on c.customer_id = o.customer_id
		join products2 as p
		on o.product_id = p.product_id;

--display total sales from all city
select c.city, sum(o.sales) as total_sales
from customers2 as c
join orders2 as o
on c.customer_id = o.customer_id
group by c.city;

--display how much profit from each segment---doubt in segment
select c.segment, sum(o.profit)
from  orders2 as o
join customers2 as c
on c.customer_id = o. customer_id
group by c.segment
order by sum(o.profit) desc;

select * from customers2
where city = 'City';
delete from customers2 where city='City';

