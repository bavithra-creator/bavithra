
CREATE DATABASE shopdb;
use shopdb;

create table Orders (
order_id int primary key,
customer_name varchar(50),
order_date date,
Amount decimal (10,2)
);

insert into Orders values
(11, "Sam", "2025-04-02", 14536),
(12, "Hiya", "2024-09-01", 18765),
(13, "Kavin", "2021-05-05", 23879);

create table Deleted_orders (
order_id int ,
customer_name varchar(50),
order_date date,
Amount decimal (10,2), 
deleted_date datetime
);

DELIMITER //

CREATE TRIGGER after_order_delete after delete on orders for each row
begin
	insert into Deleted_orders (order_id, customer_name, order_date, Amount, deleted_date)
    values (old.order_id, old. customer_name, old. order_date, old. Amount, now());
end;
//

DELIMITER ;

DELETE from orders where order_id = 12;

select * from deleted_orders;

-- DCL COMMANDS -- 

create user 'JA @ localhost' identified by 'password444';

-- Grant select access (Reporting access)
grant select on shopdb. * to 'JA @ localhost';

-- if access needs to removed --
revoke select on shopdb. * from 'JA @ localhost';

-- TCL COMMANDS --

CREATE TABLE bankaccounts (
account_no int primary key,
holder_name varchar (100),
Balance decimal(10,2)
);

insert into bankaccounts values
(675432, "Athira", "500000"),
(567483, "Vijay Joseph", "1000000"),
(786542, "Dhanush", "300000");

select * from bankaccounts;

start transaction;

-- withdraw from Athira
update bankaccounts
set balance = balance - 10000 where account_no = 675432;

-- DEPOSIT TO Dhanush
update bankaccounts
set balance = balance + 10000 where account_no = 786542;

-- if everything is correct 
COMMIT;

-- If something went wrong 
rollback;

-- Optional Savepoint 
savepoint after_withdraw;
