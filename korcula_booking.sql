drop database if exists korcula_booking;
create database korcula_booking character set utf8 collate utf8_general_ci;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < f:\skriptapp18.sql
use korcula_booking;

create table user(
account_id int not null primary key auto_increment,
first_name varchar(100) not null,
last_name varchar(100) not null,
passport_number int not null,
email_address varchar(50) not null,
country varchar(50) not null,
city varchar(50) not null
);

create table booking(
order_number int not null primary key auto_increment,
account_id int not null,
rental_location_id int not null,
order_date datetime,
order_total_amount decimal(5,2) not null,
arrival_date datetime,
departure_date datetime,
card_type varchar (50) not null,
card_number int not null,
rating int not null,
review varchar (600),
cancellation_policy varchar(1000) not null
);

create table host(
host_id int not null primary key auto_increment,
account_id int not null
);

create table rental_location(
rental_location_id int not null primary key auto_increment,
host_id int not null,
location varchar(50) not null,
rating int not null,
review varchar(600)
);

create table photo(
photo_number int not null primary key auto_increment,
rental_location_id int not null,
photo_description varchar(100)
);



ALTER TABLE booking ADD FOREIGN KEY (account_id) REFERENCES user(account_id);
ALTER TABLE booking ADD FOREIGN KEY (rental_location_id) REFERENCES rental_location(rental_location_id);
ALTER TABLE host ADD FOREIGN KEY (account_id) REFERENCES user(account_id);
ALTER TABLE rental_location ADD FOREIGN KEY (host_id) REFERENCES host(host_id);
ALTER TABLE photo ADD FOREIGN KEY (rental_location_id) REFERENCES rental_location(rental_location_id);