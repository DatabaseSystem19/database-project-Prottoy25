select count(*) from department;
select avg(salary) from teacher;
select max(salary) from teacher;
select min(salary) from teacher;
select sum(salary) from teacher;
select * from department where dept_name like 'E%';
1.set serveroutput on
declare 
dept_name department.dept_name%type;
faculty department.faculty%type;
begin
select dept_name,faculty into dept_name,faculty from department where dept_name='CSE';
dbms_output.put_line(' DEPT_name: '||dept_name || ' faculty :'|| faculty);
end;
/
2.set serveroutput on
declare 
teacher_id teacher.teacher_id%type;
name teacher.name%type;
dept_name teacher.dept_name%type;
salary teacher.salary%type;
begin
select teacher_id,name,dept_name,salary into teacher_id,name,dept_name,salary from teacher where salary=92000;
dbms_output.put_line(' teacher_id : ' || teacher_id || ' name  : ' || name || ' dept_name  : ' || dept_name || ' salary  : ' || salary);
end;
/
CREATE OR REPLACE PROCEDURE proc2(
 var1 in varchar2,
 var2 out varchar2

)
AS
  t_show CHAR(30);
BEGIN
  t_show := 'From procedure: ';
  select faculty into var2 from department where dept_name like var1;
  dbms_output.put_line(' dept_name : ' || var1 || ' faculty : ' || var2 );
END;
/

set serveroutput on
declare 
faculty department.faculty%type:='CSE';
dept_name department.dept_name%type;
begin
proc2(faculty,dept_name);
end;
/
---------------------------------------------------------------------------
set serveroutput on
create or replace function fun(var1 in varchar) return varchar AS
value department.dept_name%type;
begin
  select dept_name into value from department where dept_name=var1; 
   return value;
end;
/
set serveroutput on
declare
var1 department.faculty%type:='CSE';
value varchar(20);
begin
value:=fun(var1);
dbms_output.put_line(value);
end;
/