MSSQL QUERIES FOR JOINS WITH TABLE CREATIONS
========================================================================================
CREATE DEPARTMENT TABLE
----------------------------------------
create table department (
deptid varchar(10) primary key,
deptname varchar(50) not null
)


CREATE EMPLOYEE TABLE
-------------------------------------
create table employee (
empid varchar(10) primary key,
empname varchar(50) not null,
designation varchar(50),
mgrid varchar(10), 
deptid varchar(10),
constraint fk_dept foreign key (deptid) reference department(deptid)
)

INSERTION OF DATA IN DEPARTMENT TABLE
----------------------------------------------------------------
insert into department (deptid, deptname) values 
('d001', 'R&D'),
('d002', 'Analytics'),
('d003', 'Development'),
('d004', 'Finance')

INSERTION OF DATA IN EMPLOYEE TABLE
----------------------------------------------------------------
insert into employee (empid, empname, designation, mgrid, deptid) values 
('E001', 'Neel', 'Project Lead', 'E008', 'd003'),
('E002', 'Trupti', 'Reporting Analyst', 'E005', 'd002'),
('E003', 'Ayush', 'Data Analyst', 'E009', 'd002'),
('E004', 'Rohan', 'Developer', 'E001', 'd001'),
('E005', 'Minnoli', 'Reporting Executive', 'E009', 'd002'),
('E006', 'Zoha', 'SQL Developer', 'E001', 'd003'),
('E007', 'Asiya', 'Query Analyst', 'E003', 'd001'),
('E008', 'Parth', 'Project Manager', 'E009', 'd003'),
('E009', 'Ved', 'CEO', NULL, NULL)

INNER JOIN(IT CAN USE VARIOUS OPERATORS LIKE '>','<','<=',etc..)
----------------------------------------------------------------------------------------------------------------
select e.empid, e.empname, d.deptid, d.deptname
from employee e inner join department d on e.deptid=d.deptid

OUTER JOIN (LEFT)
----------------------------------------------------------
select e.empid, e.empname, d.deptid, d.deptname
from employee e left outer join department d on e.deptid=d.deptid

OUTER JOIN (RIGHT)
----------------------------------------------------------
select e.empid, e.empname, d.deptid, d.deptname
from employee e right outer join department d on e.deptid=d.deptid

OUTER JOIN (FULL)
----------------------------------------------------------
select e.empid, e.empname, d.deptid, d.deptname
from employee e full outer join department d on e.deptid=d.deptid

SELF JOIN
----------------------------------------------------------
select e.empid,e.empname,e.designation,
m.empname as ManagerName,
m.designation as ManagerRole
from employee e left join employee m on e.mgrid = m.empid

CROSS JOIN
----------------------------------------------------------
select e.empname, e.designation, d.deptname
from employee e cross join department d

EQUI JOIN( ONLY '=' OPERATOR CAN BE USED)
------------------------------------------------------------------------
select e.empid, e.empname, d.deptid, d.deptname
from employee e inner join department d on e.deptid=d.deptid

