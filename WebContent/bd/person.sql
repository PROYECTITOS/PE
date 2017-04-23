CREATE TABLE person (
id int identity primary key,
name varchar(20),
country varchar(20)
)

insert into person (name, country) values ('Mark','123'),
										('Anthony','123')


										select * from person