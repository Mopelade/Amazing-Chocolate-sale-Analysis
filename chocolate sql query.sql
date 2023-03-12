select * from sales;

select saledate, Amount, boxes from sales
where amount >2000 and boxes < 100;

select p.salesperson,count(*)as 'shipment count' from sales s
join people p on s.spid = p.spid
where saledate between '2022-01-01'and '2022-01-31'
group by p.salesperson;

select pr.product, sum(s.boxes) as 'total boxes', sum(amount) as'total amount'
from sales s
join products pr on pr.pid = s.pid
where pr.product in ('milk bars', 'Eclairs') 
group by pr.product;


select pr.product, sum(boxes) as 'total boxes', sum(amount) as 'total amount'
from sales s
join products pr on pr.pid = s.pid
where pr.product in ('milk Bars','Eclairs')and s.saledate between '2022-02-01' and '2022-02-07'
group by pr.product;

select *,
Case when  
weekday(saledate)=2 then 'wednesday shipment' else'' end as 'w shipment' from sales
where customers < 100 and boxes < 100;

select *, weekday(saledate) as 'wednesday shipment' from sales
where customers < 100 and boxes < 100 and weekday(saledate) = 2;



select * from people;

select distinct p.salesperson , s.spid from sales s
join  people p on p.spid = s.spid
where saledate between '2022-01-01' and '2022-01-07';


select p.Salesperson from people p
where p.spid not in (select distinct s.spid from sales s where s.saledate between '2022-01-01' and '2022-01-07'
);

select year(saledate)'year', month(saledate) 'month', count(*)'times we shipped 1k boxes' from sales where boxes>1000
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);

select * from geo;
select Year(saledate)'year', month(s.saledate) as 'month', g.geo, sum(boxes) as 'total boxes' from sales S
join geo G on G.GeoID = s.GeoID
where g.geo in ('india', 'australia')
Group by g.geo,month(s.saledate),Year(saledate)
;
select Year(saledate)'year', month(saledate) 'month',
sum(case when g.geo ='india' = 1 then boxes else 0 end)'india boxes',
sum(case when g.geo ='australia' = 1 then boxes else 0 end)'australia boxes' from sales s 
join geo G on G.GeoID = s.GeoID
group by Year(saledate), month(saledate)
order by Year(saledate), month(saledate);

select Year(saledate)'year', month(saledate) 'month', pr.product, g.geo,
if(sum(boxes)>1, 'yes','no') 'status' from sales s
join geo G on G.GeoID = s.GeoID
join products pr on pr.pid = s.pid
where pr.product ='after Nines' and g.geo='new zealand'
group by Year(saledate), month(saledate)
order by Year(saledate), month(saledate);


select * from sales;
select s.*, pr.product, pr.category, pr.cost_per_box from sales s
 join products pr on pr.PID = s.PID;
 
 select pr.Product, sum(s.amount)
 from sales s
 join products pr on pr.PID = s.PID
 group by pr.product
 order by sum(s.amount) desc
 limit 10;
 
  select pr.Product, sum(s.amount)
 from sales s
 join products pr on pr.PID = s.PID
 group by pr.product
 order by sum(s.amount) asc 
 limit 5;

 
 select  sum(s.amount), year(s.saledate) as year
 from sales s
 where year(s.saledate) = 2022
 group by year(s.saledate);


select p.Salesperson, s.amount,
case
 when amount >= 15000 then 'add 10% to salary'
when amount < 15000 then 'add 5% to salary'
else 'add 2% to salary'
 end  as 'sales bonus' from sales s
 join people p on p.SPID = s.SPID
 

