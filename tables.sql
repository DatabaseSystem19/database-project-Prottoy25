create table department(
dept_name varchar(20),
faculty varchar(20),
primary key(dept_name)
);
create table student(
student_id number,
name varchar(20),
dept_name varchar(20),
tot_cred number(30,2),
primary key(student_id)
);
create table teacher(
teacher_id number,
name varchar(20),
dept_name varchar(20),
salary number,
primary key(teacher_id)
);
create table course(
course_id number,
title varchar(30),
dept_name varchar(20),
credits number,
primary key(course_id)
);