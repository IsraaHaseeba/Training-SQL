create database restaurants;
use restaurants;

create table restaurant(R_id int primary key, name varchar(30));
create table category(PID int primary key IDENTITY(1,1), C_id int , R_id int, unique (C_id,R_id), C_name varchar(30),  FOREIGN KEY (R_id) REFERENCES restaurant (R_id));
create table item(I_id int primary key IDENTITY(1,1), I_name varchar(30), price float);

--create table Rest_Cat(R_id int, C_id int, id int primary key IDENTITY(1,1),
--					FOREIGN KEY (R_id) REFERENCES restaurant (R_id),
--					FOREIGN KEY (C_id) REFERENCES category (C_id));
create table cat_item(Cat_item int primary key IDENTITY(1,1),PID int, I_id int, 
					FOREIGN KEY (PID) REFERENCES category (PID), 
					FOREIGN KEY (I_id) REFERENCES item (I_id));

select * from restaurant;
select * from category;
select * from item;
select * from cat_item;

--drop table restaurant;
--drop table category;
--drop table item;
--drop table cat_item;

insert into  restaurant values(1, 'rest_1'),(2, 'rest_2'), (3, 'rest_3'), (4, 'rest_4'), (5, 'rest_5'), (6, 'rest_6'), (7, 'rest_7');

insert into  category values( 1, 1, 'breakfast'), (2, 1, 'meals'), (3, 1, 'sandwiches'), (4,1,  'desserts'),
							(1, 2, 'breakfast'), (2, 2, 'meals'), (3, 2, 'sandwiches'), (4, 2, 'desserts'),
							(1, 3,  'breakfast'), (4, 3,'desserts'),
							(1, 4, 'breakfast'), (2,4, 'meals'), (4, 4,'desserts');

-----
insert into item values('Egg', 2.0), ('Potato waffel', 12.0), ('soft waffle', 10.0), 
						('Pizza', 40.0), ('Fish', 50.0),
						('Burger', 20.0), ('Italian', 15.0), 
						('crepe', 16.0), ('cheesecake', 15.0);
insert into cat_item values(1,1), (1,2),
						  (3,1), (3,2), (3,3),
						  (4,1), (4,2), (4,3), (4,4);
insert into cat_item values(1,5), (1,6),
						  (5,8), (5,9), (6,1), (6,3), (7, 4), (8,6), (8,7), (9,8);
insert into cat_item values(10,5), (11,6);



---------------------------------NOTE:---------------------------------------------------------------------

			-- There might be some repeated items among categories, it's just a dummy example

-----------------------------------------------------------------------------------------------------------



------------------------------------view
create view Restaurant_Items As
  
select   r.name, ci.I_id
			
from restaurant as r ,cat_item as ci inner join category as c 
			on c.PID = ci.PID
			where c.R_id = r.R_id


select* from Restaurant_Items;
--drop view Restaurant_Items;



-------------------------- rest that has more than 5 categories.
select r.name, count(c.C_id) as numberOFCategories
from restaurant as r, category as c
where c.R_id = r.R_id
group by c.R_id, r.name
having count(c.C_id) > 3 -- it should be 5 but to fit my sample i put it 3



----------------------------- avg items per cat
create table avgItemPerCat(summ int);
--drop table avgItemPerCat;

INSERT INTO avgItemPerCat 
select  count(ci.I_id) as numberOFItemsPerCategory
from cat_item as ci inner join category as c
on   ci.PID = c.PID
group by  ci.PID;

select avg(summ) from avgItemPerCat as avgg;



----------------------------------------# items per res
select r.name, numOfItems = (select count(ci.I_id)
			from cat_item as ci inner join category as c 
			on c.PID = ci.PID
			where c.R_id = r.R_id
			group by c.R_id)
			
from restaurant as r 




------------------------------------------L,M,avg price per res
select r.name, avgPrice = (select avg(i.price)
			from   category as c inner join cat_item as ci
			inner join item as i
			on i.I_id = ci.I_id
			on c.PID = ci.PID
			where c.R_id = r.R_id
			group by c.R_id), 

			minPrice = (select min(i.price)
			from   category as c inner join cat_item as ci
			inner join item as i
			on i.I_id = ci.I_id
			on c.PID = ci.PID
			where c.R_id = r.R_id
			group by c.R_id),

			maxPrice = (select max(i.price)
			from   category as c inner join cat_item as ci
			inner join item as i
			on i.I_id = ci.I_id
			on c.PID = ci.PID
			where c.R_id = r.R_id
			group by c.R_id)
			
from restaurant as r 



------------------------------------- 3rd highest price per rest

select r.name, HighestItem = (SELECT i.price
			from   category as c inner join cat_item as ci
			inner join item as i 
			on i.I_id = ci.I_id
			on c.PID = ci.PID
			where c.R_id = r.R_id
			ORDER BY i.price desc  OFFSET 2 ROWS 
			FETCH NEXT 1 ROWS ONLY
			)
from restaurant as r 

 

----- indexing
--create clustered index PriceIDX
--on item (price desc)









