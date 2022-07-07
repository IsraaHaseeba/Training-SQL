create database school;

--create table students(st_id int not null primary key, st_name varchar(30));
--create table subjects(sub_id int not null primary key, sub_name varchar(30));

insert into students values (1, 'Israa'), (2, 'Huda'), (3, 'Sami'), (4, 'Lian'), (5, 'Raed'), (6, 'Hani');
select * from students;

insert into subjects values (1, 'Math'), (2, 'Arabic'), (3, 'English'), (4, 'Science'), (5, 'Biology'), (6, 'Physics'), (7, 'Chemistry'), (8, 'IT'), (9, 'History'), (10, 'Geography');
select * from subjects;

--create table mark (st_id int not null, sub_id int not null, mark int,  PRIMARY KEY (st_id,sub_id),
	--			FOREIGN KEY (st_id) REFERENCES students (st_id),
		--		FOREIGN KEY (st_id) REFERENCES subjects (sub_id));
select * from mark;
insert into mark values (4,1,70), (4,2,25), (4,3,26),(4,4,80), (4,5,80),(4,6,80),(4,7,80),(4,8,80),(4,9,80),(4,10,80),
						(1,1,50), (1,2,70), (1,3,80),(1,4,80), (1,5,80),(1,6,80),(1,7,80),(1,8,80),(1,9,80),(1,10,80),
						(2,1,30), (2,2,70), (2,3,80),(2,4,20), (2,5,40),(2,6,80),(2,7,75),(2,8,54),(2,9,60),(2,10,80),
						(5,1,70), (5,2,80), (5,3,80),(5,4,80), (5,5,80),(5,6,80),(5,7,80),(5,8,80),(5,9,80),(5,10,80),
						(6,1,70), (6,2,70), (6,3,75),(6,4,80), (6,5,95),(6,6,65),(6,7,80),(6,8,80),(6,9,80),(6,10,80),
						(3,1,100), (3,2,49), (3,3,49),(3,4,49), (3,5,100),(3,6,49),(3,7,100),(3,8,100),(3,9,100),(3,10,100);





-- solution 1 - all students
select st.st_name as Name, st.st_id, avg(m.mark) as Average,
status =  CASE  (select count(m.mark) from mark as m where m.mark<50 and st.st_id = m.st_id )
         WHEN  0  THEN 'Pass'  
         WHEN 1  THEN 'Incomplete' 
		 WHEN 2  THEN 'Incomplete' 
         else  'Fail'  
      END  
from students as st
INNER JOIN mark as m
on st.st_id = m.st_id
group by m.st_id, st.st_name, st.st_id

ORDER BY Average desc
;

-- -- solution 2
select top 3 st.st_name as Name, st.st_id, avg(m.mark) as Average,
status =  CASE  (select count(m.mark) from mark as m where m.mark<50 and st.st_id = m.st_id )
         WHEN  0  THEN 'Pass'  
         WHEN 1  THEN 'Incomplete' 
		 WHEN 2  THEN 'Incomplete' 
         else  'Fail'  
      END  
from students as st
INNER JOIN mark as m
on st.st_id = m.st_id
group by m.st_id, st.st_name, st.st_id
having ((select count(m.mark) from mark as m where m.mark<50 and st.st_id = m.st_id ) = 0 )
ORDER BY Average desc 
;



