create table customer (
    customer_num int primary key,
    name varchar(100),
    address varchar(200),
    email varchar(100)
);

alter table customer
add phone_num varchar(20);

insert into customer values (1,'layan ','riyadh','layan@gmail.com','0551234567');
insert into customer values (2,'reem ','jeddah','reem@gmail.com','0569876543');
insert into customer values (3,'noura ','dammam','noura@gmail.com','0543210987');
insert into customer values (4,'sara','khobar','sara@gmail.com','0555678901');
insert into customer values (5,'huda','makkah','huda@gmail.com','0532345678');
insert into customer values (6,'maha','abha','maha@gmail.com','0509876543');
insert into customer values (7,'aseel ','tabuk','aseel@gmail.com','0523456789');
insert into customer values (8,'jawaher','jazan','jawaher@gmail.com','0587654321');
insert into customer values (9,'raghad','taif','raghad@gmail.com','0512345678');
insert into customer values (10,'lama ','madinah','lama@gmail.com','0598765432');

select * from customer;
update customer
set address = 'riyadh city'
where customer_num = 1;
delete from customer
where customer_num = 10;
select * from customer
order by name;


create table vehicle (
    plate_number varchar(20) primary key,
    make varchar(100),
    model varchar(100),
    manufacturing_year int,
    customer_num int,
    foreign key (customer_num) references customer(customer_num)
);

alter table vehicle
modify model varchar(20);

insert into vehicle values ('abc123','toyota','camry',2020,1);
insert into vehicle values ('def456','honda','civic',2019,2);
insert into vehicle values ('ghi789','ford','focus',2021,3);
insert into vehicle values ('jkl321','hyundai','civic',2018,4);
insert into vehicle values ('mno654','kia','sportage',2022,5);
insert into vehicle values ('pqr987','nissan','civic',2021,6);
insert into vehicle values ('stu741','chevrolet','malibu',2017,7);
insert into vehicle values ('vwx852','mazda','civic',2023,8);
insert into vehicle values ('yza963','bmw','civic',2020,9);
insert into vehicle values ('bcd159','mercedes','c200',2022,1);

select * from vehicle;
update vehicle
set manufacturing_year = 2024
where plate_number = 'abc123';
select model,count(model) from vehicle
group by model;
select max(manufacturing_year)
from vehicle;


create table technician (
    technician_number int primary key,
    name varchar(100),
    specialization varchar(100),
    phone_number varchar(20)
   
);

alter table technician
add statuss varchar(40);

insert into technician values (1,'razan ','engine repair','0501112233','available');
insert into technician values (2,'dana ','electrical','0512223344','busy');
insert into technician values (3,'shahad ','oil change','0523334455','available');
insert into technician values (4,'abeer ','transmission','0534445566','busy');
insert into technician values (5,'nouf ','general repair','0545556677','available');
insert into technician values (6,'haneen ','tires','0556667788','busy');
insert into technician values (7,'jory ','battery','0567778899','available');
insert into technician values (8,'lina ','air conditioning','0578889900','busy');
insert into technician values (9,'malak ','engine repair','0589990011','available');
insert into technician values (10,'ritaj ','general repair','0590001122','busy');

select * from technician;
update technician
set statuss = 'busy'
where technician_number = 1;
select * from technician;



create table service_order (
    order_num int primary key,
    received_date date,
    problem_description varchar(100),
    order_status varchar(100),
    plate_num_of_vehicle varchar(20),
    technician_number int,
    foreign key (plate_num_of_vehicle) references vehicle(plate_number),
    foreign key (technician_number) references technician(technician_number)
);

alter table service_order
modify order_status varchar(70);

insert into service_order values (101,'2025-05-01','engine problem','pending','abc123',1);
insert into service_order values (102,'2025-05-02','brake issue','completed','def456',2);
insert into service_order values (103,'2025-05-03','oil leakage','in progress','ghi789',3);
insert into service_order values (104,'2025-05-04','battery replacement','completed','jkl321',4);
insert into service_order values (105,'2025-05-05','transmission issue','pending','mno654',5);
insert into service_order values (106,'2025-05-06','flat tire','completed','pqr987',6);
insert into service_order values (107,'2025-05-07','ac maintenance','pending','stu741',7);
insert into service_order values (108,'2025-05-08','engine overheating','in progress','vwx852',8);
insert into service_order values (109,'2025-05-09','oil change','completed','yza963',9);
insert into service_order values (110,'2025-05-10','suspension repair','pending','bcd159',10);

select * from service_order;
update service_order
set order_status = 'completed'
where order_num = 101;
delete from service_order
where order_num = 109;
select * from service_order
order by received_date desc;


create table invoice (
    invoice_num int primary key,
    issue_date date,
    total_amount decimal(10,2),
    payment_method varchar(100),
    order_num int,
    foreign key (order_num) references service_order(order_num)
);

alter table invoice
modify payment_method varchar(50);

insert into invoice values (1,'2025-05-11',1500.00,'cash',101);
insert into invoice values (2,'2025-05-12',700.00,'card',102);
insert into invoice values (3,'2025-05-13',500.00,'cash',103);
insert into invoice values (4,'2025-05-14',900.00,'card',104);
insert into invoice values (5,'2025-05-15',2000.00,'online',105);
insert into invoice values (6,'2025-05-16',300.00,'cash',106);
insert into invoice values (7,'2025-05-17',650.00,'card',107);
insert into invoice values (8,'2025-05-18',1750.00,'online',108);
insert into invoice values (9,'2025-05-19',250.00,'cash',101);
insert into invoice values (10,'2025-05-20',2200.00,'card',102);

select * from invoice;
update invoice
set payment_method = 'online'
where invoice_num = 1;
select max(total_amount) 
from invoice;
select customer.name, vehicle.model
from customer
inner join vehicle
on customer.customer_num = vehicle.customer_num;