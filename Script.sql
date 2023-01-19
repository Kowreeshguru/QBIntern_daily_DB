create table employee(
id int primary key,
emp_id int not null,
emp_name varchar(50) not null,
designation varchar(20) not null,
emp_doj date not null,
emp_contact int not null,
emp_mail varchar(50) 
)

create table salary(
id int primary key,
emp_id int not null,
base_pay int not null,
hra int not null,
pf int not null,
allowance int not null,
constraint e_id_pk foreign key(emp_id) references employee(id)
)

create table address (
id int not null primary key,
emp_id int not null,
add_type varchar(10) not null,
add_line varchar(20) not null ,
add_city varchar(15) not null,
add_state varchar(20) not null,
add_pincode integer not null,
CONSTRAINT fk_emp_id FOREIGN KEY (emp_id)
    REFERENCES employee(id) 
)

insert into employee (id,emp_id,emp_name,designation,emp_doj,emp_contact,emp_mail) 
values (6,1006,'ruthsan','manager','1999-03-21',9876543210,'ertyuiokjhgfds');
(2,1002,'kow','dev','2030-08-03',9876543210,'ertyuiokjhgfds'),
(3,1003,'hari','dev','2010-03-21',9876543210,'ertyuiokjhgfds'),
(4,1004,'abi','ui','2000-06-21',9876543210,'ertyuiokjhgfds'),
(5,1005,'suj','ui','2003-03-09',9876543210,'ertyuiokjhgfds');

insert into salary (id,emp_id,base_pay ,hra ,pf ,allowance) values
(1,1,300000,3424,32213,4452),
(2,2,400000,3424,32213,4452),
(3,3,500000,3424,32213,4452),
(4,4,600000,3424,32213,4452),
(5,5,450000,3424,32213,4452);

insert into address (id,emp_id,add_type,add_line,add_city,add_state,add_pincode) values
(1,1,'residential','line1','cbe','tn',324544),
(2,1,'permanent','line2','dpi','tn',636701),
(3,2,'residential','line3','cbe','tn',078722),
(4,3,'permanent','line4','bglr','kar',542878),
(5,5,'permanent','line5','slm','tn',887237),
(6,5,'residential','line6','hyb','ap',748993);

alter table salary drop column pf;
alter table salary add column pf int not null;
alter table address alter column add_type type varchar(15);

select emp_name from employee;
select emp_name,emp_contact from employee;
select * from employee;

select * from employee e where designation = 'manager';
select * from employee e where designation != 'manager';

select * from address where add_type ='residential' order by emp_id desc;
select emp_name as name from employee order by name asc;

select concat(emp_name,designation) from employee where lower(emp_name) like lower('A%');
select upper(substring(designation,1,4)) from employee e ; 

select * from employee e 
where emp_doj like '2000%';
WHERE emp_doj  BETWEEN '2000-01-01' AND '2005-12-31';

select *,base_pay+hra+pf+allowance as salary from salary s ;

select designation,count(1) from employee group by designation having count(designation)>2 ;

drop table address; 

-- join --
create view emp_salary as
select e.emp_id ,e.emp_name ,a.add_city  
from employee as e 
full join address as a on e.id = a.emp_id ;
where a.add_type ='permanent';

select * from emp_salary ;

select * from employee
where designation = 'ui' or designation = 'dev' limit 5 offset 2;

select * from employee e where id in(select id from salary s )

select emp_name from employee union select add_state from address a ;