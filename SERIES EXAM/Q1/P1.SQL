CREATE DATABASE CUST;
USE CUST;

CREATE TABLE Customer(
cust_id INT NOT NULL,
cust_name varchar(50),
PRIMARY KEY(cust_id)
);

CREATE TABLE Item(
Iid varchar(50),
item_name varchar(50),
price INT not null,
PRIMARY KEY(Iid)
);


CREATE TABLE sale(
bill_no varchar(50),
bill_date DATE,
qty_sold INT NOT NULL,
Iid varchar(50),
cust_id INT NOT NULL,
FOREIGN KEY(Iid) REFERENCES Item(Iid) ON DELETE CASCADE,
FOREIGN KEY(cust_id) REFERENCES   Customer(cust_id) ON DELETE CASCADE
);
 

INSERT INTO Customer VALUES("1","ARYA");
INSERT INTO Customer VALUES("2","ARYAN");
INSERT INTO Customer VALUES("3","VYGA");
INSERT INTO Customer VALUES("4","VYSAKH");
INSERT INTO Customer VALUES("5","ARUN");

INSERT INTO Item VALUES("I101","PHONE",50000);
INSERT INTO Item VALUES("I102","MASK",50);
INSERT INTO Item VALUES("I103","ADAPTER",250);
INSERT INTO Item VALUES("I104","DRESS",500);
INSERT INTO Item VALUES("I105","LAPTOP",55000);


INSERT INTO sale VALUES("B101","2000-03-07",1,"I103",5);
INSERT INTO sale VALUES("B102","2000-04-08",1,"I105",5);
INSERT INTO sale VALUES("B103","2000-05-06",2,"I102",4);
INSERT INTO sale VALUES("B104","2000-03-07",1,"I103",3);
INSERT INTO sale VALUES("B105","2000-03-07",2,"I101",1);
INSERT INTO sale VALUES("B106","2000-08-09",3,"I104",2);


 
 
    
select sale.bill_no,Item.item_name,Item.price,sale.qty_sold,(Item.price * sale.qty_sold) as total 
	from sale,Item 
    where sale.Iid=Item.Iid;
    
select Customer.cust_id,Customer.cust_name,Item.item_name,Item.price from Customer,Item,sale
	where Item.price>200 and Customer.cust_id=sale.cust_id and Item.Iid=sale.Iid;
    
select Customer.cust_name, count(Item.item_name) as NPB from Customer,Item,sale
	where Customer.cust_id=sale.cust_id and Item.Iid=sale.Iid group by sale.cust_id;
    
select Item.item_name from Item,sale where sale.cust_id=5 and Item.Iid=sale.Iid;
 
select sale.Iid,Customer.cust_name
	from sale,Customer,Item 
	where sale.bill_date="2000-08-09" and sale.cust_id=Customer.cust_id and sale.Iid=item.Iid;
    select * from sale;
