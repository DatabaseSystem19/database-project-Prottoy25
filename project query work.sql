set serveroutput on
declare
cursor c is select name from student where dept_name in(select dept_name from teacher where salary in(select max(salary) from teacher));
name student.name%type;
begin
for i in c loop
dbms_output.put_line(i.name);
end loop;
end;
/