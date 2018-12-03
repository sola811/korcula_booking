drop database if exists korcula_booking;
create database korcula_booking character set utf8 collate utf8_general_ci;
use korcula_booking;

SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0; 

create table user(
user_id int not null primary key auto_increment,
first_name varchar(100) not null,
last_name varchar(100) not null,
passport_number int not null,
email_address varchar(50) not null,
country varchar(50) not null,
city varchar(50) not null
);

create table booking(
order_number int not null primary key auto_increment,
user_id int not null,
rental_location_id int not null,
order_date datetime,
order_total_amount decimal(18,2) not null,
arrival_date datetime,
departure_date datetime,
card_type varchar (50) not null,
card_number int not null,
host_rating int not null,
guest_rating int not null,
rating int not null
);

create table host(
host_id int not null primary key auto_increment,
user_id int not null
);

create table rental_location(
rental_location_id int not null primary key auto_increment,
host_id int not null,
location varchar(50) not null,
location_description varchar(1000),
apartment_description varchar(1000),
review varchar(600),
cancellation_policy varchar(1000) not null
);

create table photo(
photo_number int not null primary key auto_increment,
rental_location_id int not null,
photo_description varchar(100),
photo_path varchar(255)
);



ALTER TABLE booking ADD FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE booking ADD FOREIGN KEY (rental_location_id) REFERENCES rental_location(rental_location_id);
ALTER TABLE host ADD FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE rental_location ADD FOREIGN KEY (host_id) REFERENCES host(host_id);
ALTER TABLE photo ADD FOREIGN KEY (rental_location_id) REFERENCES rental_location(rental_location_id);


INSERT INTO user(user_id,first_name,last_name,passport_number,email_address,country,city) values
(101,'Sean','Smith',31195855,'seansmith@gmail.com','USA','New York'),
(102,'Willian','Brown',21584355,'wbrown@gmail.com','USA','Chicago'),
(103,'Jeff','Williams',158363791,'jeffwilliams@gmail.com','USA','Winston Salem'),
(104,'Peter','Jones',4447251,'pjones@gmail.com','USA','Seattle'),
(105,'Mirej','Botica',5852715,'mbotica@gmail.com','Hrvatska','Korčula'),
(106,'Sonya','Barnes',71163355,'sonyabarnes@gmail.com','USA','Laurel'),
(107,'Luka','Miller',8372514,'lmiller@gmail.com','Hrvatska','Korčula'),
(108,'Greg','Taylor',8432567,'gregtaylor@gmail.com','Australia','Victoria');

INSERT INTO booking(order_number,user_id,rental_location_id,order_date,order_total_amount,arrival_date,departure_date,card_type,card_number,host_rating,guest_rating,rating) values
(3001,101,2001,'2018-3-30',2678,'2018-02-07','2018-06-07','Visa',5457623898234113,5,5,5),
(3002,102,2001,'2018-05-05',1404,'2018-09-07','2018-11-07','Visa',441712345678942,5,5,5),
(3003,103,2001,'2018-15-01',4233,'2018-12-08','2018-19-08','Visa',4000123456689010,5,5,5),
(3004,104,2002,'2018-03-02',4220,'2018-03-09','2018-06-09','Visa',4199520703456789,5,5,5),
(3005,106,2002,'2018-13-04',6071,'2018-20-08','2018-24-08','Mastercard',5412750123450987,5,5,5),
(3006,108,2002,'2017-11-04',9137,'2018-16-06','2018-23-06','Amex',7253325678951245,5,5,5);

INSERT INTO host(host_id,user_id) values
(10111,105),
(10112,107);

INSERT INTO rental_location(rental_location_id,host_id,location,location_description,apartment_description,review,cancellation_policy) values
(2001,10111,'Korčula','This apartment is truly “My piece of palace” in a beautiful medieval Ismaelli palace right in the heart of the Old Town of Korčula. So...
Location. Surroundings. It cant get any better!If you want to have peaceful nights but then again to be in a vicinity of just everything that you need and must see in Korčula, 
if you want to experience staying in a modern apartment within 16th century palace - dont look any further. Welcome to “My piece of palace!','Sleeping room with walk-in closet, kitchen with many appliances including dish washer, living room with a sofa, cable TV, Wi-Fi, bathroom with a bath tub and a washing machine. 
Set of chairs and a small table on the balcony for a chill out.','The accommodate is ideally located and all communication was excellent. much larger than expected and all amenities were provided. Very highly recommended.','Moderate - Free cancellation for 48 hours.After that, cancel up to 5 days before check-in and get a full refund, minus the service fee.'),
(2002,10112,'Korčula','New Apartment NONA KATA is situated in center of town, near the main square. It consist of one living room with kitchen, bathroom and bedroom for 2 persons. On the floor above there is a terrace with wonderful view. WI-FI, air-conditioner.','Besides additional sheet equipment, dishwasher machine and washing machine.','Great place in town. Very clean and cute apt with amazing patio! Loved it!','Moderate - Free cancellation for 48 hours. After that, cancel up to 5 days before check-in and get a full refund, minus the service fee.');

INSERT INTO photo(photo_number,rental_location_id,photo_description,photo_path) values
(1,2001,'Terrace','C:\users\ivansolic\documents\korcula_booking\images\terrace.png'),
(2,2002,'Living room','C:\users\ivansolic\documents\korcula_booking\images\living room.png');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;
SET SQL_NOTES=@OLD_SQL_NOTES;