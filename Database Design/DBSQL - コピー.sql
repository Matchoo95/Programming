CREATE TABLE OUTLET (
  out_ID INT NOT NULL,
  out_name VARCHAR(45) NOT NULL,
  out_manager VARCHAR(45) NOT NULL,
  out_address VARCHAR(100) NOT NULL,
  out_phone VARCHAR(15) NOT NULL,
  out_email VARCHAR(45) NOT NULL,
PRIMARY KEY (out_ID));

CREATE TABLE ACCOUNT (
  acc_ID INT NOT NULL,
  acc_name VARCHAR(45) NOT NULL,
  acc_manager VARCHAR(45) NOT NULL,
  acc_balance DECIMAL(10, 2) NOT NULL,
  acc_transactionLimit INT NOT NULL,
  acc_creditLimit INT NOT NULL,
  OUTLET_out_ID INT NOT NULL,
PRIMARY KEY (acc_ID),
CONSTRAINT ACCOUNT_otfk_1
  FOREIGN KEY (OUTLET_out_ID)
  REFERENCES OUTLET(out_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);
-- use of NO ACTION as this rejects any delete or update operation
-- this seems more useful than CASCADE as keep all data stored is more useful
-- and NO ACTION is less error prone

-- order is a keyword, so changed to ORDTABLE
CREATE TABLE ORDTABLE (
  ord_ID INT NOT NULL,
  ord_data DATE NOT NULL,
  ord_value VARCHAR(45) NOT NULL,
  OUTLET_out_ID INT NOT NULL,
PRIMARY KEY (ord_ID),
CONSTRAINT ORD_otfk_1
  FOREIGN KEY (OUTLET_out_ID)
  REFERENCES OUTLET(out_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);



CREATE TABLE PUBLISHER (
  publisher_ID INT NOT NULL,
  publisher_name VARCHAR(45) NOT NULL,
  publisher_address VARCHAR(45) NOT NULL,
  publisher_phone VARCHAR(15) NOT NULL,
  publisher_email VARCHAR(45) NOT NULL,
PRIMARY KEY (publisher_ID));


CREATE TABLE PUBLICATION (
  pub_ID INT NOT NULL,
  pub_name VARCHAR(45) NOT NULL,
  pub_price DECIMAL(4, 2) NOT NULL,
  PUBLISHER_publisher_ID INT NOT NULL,
PRIMARY KEY (pub_ID),
CONSTRAINT PUBLICTION_prfk_1
  FOREIGN KEY (PUBLISHER_publisher_ID)
  REFERENCES PUBLISHER(publisher_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);


CREATE TABLE CONTRACT (
  con_number INT NOT NULL,
  con_startDate DATE NOT NULL,
  con_endDate DATE NOT NULL,
  PUBLICATION_pub_ID INT NOT NULL,
PRIMARY KEY (con_number),
CONSTRAINT CONTRACT_pufk_1
  FOREIGN KEY (PUBLICATION_pub_ID)
  REFERENCES PUBLICATION(pub_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);


CREATE TABLE DRIVER (
  dr_ID INT NOT NULL,
  dr_title VARCHAR(15) NOT NULL,
  dr_fname VARCHAR(45) NOT NULL,
  dr_lname VARCHAR(45) NOT NULL,
  dr_DOB DATE NOT NULL,
  dr_licenceNo VARCHAR(45) NOT NULL,
  dr_phone VARCHAR(15) NOT NULL,
  dr_email VARCHAR(45) NOT NULL,
PRIMARY KEY (dr_ID));



CREATE TABLE VEHICLE (
  veh_ID INT NOT NULL,
  veh_reg VARCHAR(15) NOT NULL,
  veh_make VARCHAR(45) NOT NULL,
  veh_model VARCHAR(45) NOT NULL,
  veh_mileage INT NOT NULL,
  veh_MOTdate DATE NOT NULL,
  veh_servicedate DATE NOT NULL,
PRIMARY KEY (veh_ID));


CREATE TABLE DELIVERY (
  del_ID INT NOT NULL,
  VEHICLE_veh_ID INT NOT NULL,
  DRIVER_dr_ID INT NOT NULL,
  del_date DATE NOT NULL,
  del_time TIME NOT NULL,
PRIMARY KEY (del_ID),
CONSTRAINT DELIVERY_vhfk_1
  FOREIGN KEY (VEHICLE_veh_ID)
  REFERENCES VEHICLE(veh_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT DELIVERY_drfk_1
  FOREIGN KEY (DRIVER_dr_ID)
  REFERENCES DRIVER(dr_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);

-- Order is a keyword so changed to ORDEROUT
-- Take another screenshot of this
CREATE TABLE ORDEROUT (
  ORDTABLE_ord_ID INT NOT NULL,
  PUBLICATION_pub_ID INT NOT NULL,
  DELIVERY_del_ID INT NOT NULL,
PRIMARY KEY (ORDTABLE_ord_ID, PUBLICATION_pub_ID),
CONSTRAINT ORDEROUT_oufk_1
  FOREIGN KEY (ORDTABLE_ord_ID)
  REFERENCES ORDTABLE(ord_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT ORDEROUT_pufk_1
  FOREIGN KEY (PUBLICATION_pub_ID)
  REFERENCES PUBLICATION(pub_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT ORDEROUT_defk_1
  FOREIGN KEY (DELIVERY_del_ID)
  REFERENCES DELIVERY(del_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);

-- Return is a keyword, so changed to RETURNITEM
CREATE TABLE RETURNITEM (
  ret_ID INT NOT NULL,
  ret_date DATE NOT NULL,
  ret_weight DECIMAL(4, 2) NOT NULL,
  ret_noOfParcels INT NOT NULL,
  OUTLET_out_ID INT NOT NULL,
  DELIVERY_del_ID INT NOT NULL,
PRIMARY KEY (ret_ID),
CONSTRAINT RETURNITEM_oufk_1
  FOREIGN KEY (OUTLET_out_ID)
  REFERENCES OUTLET(out_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT RETURNITEM_defk_1
  FOREIGN KEY (DELIVERY_del_ID)
  REFERENCES DELIVERY(del_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);

CREATE TABLE ROUTE (
  route_ID INT NOT NULL,
  route_name VARCHAR(45) NOT NULL,
  DELIVERY_VEHICLE_veh_ID INT NOT NULL,
  DELIVERY_DRIVER_dr_ID INT NOT NULL,
PRIMARY KEY (route_ID),
CONSTRAINT ROUTE_defk_1
  FOREIGN KEY (DELIVERY_VEHICLE_veh_ID)
  REFERENCES DELIVERY(VEHICLE_veh_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT ROUTE_drfk_1
  FOREIGN KEY (DELIVERY_DRIVER_dr_ID)
  REFERENCES DELIVERY(DRIVER_dr_ID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);


  INSERT INTO OUTLET VALUES(1,'Bibsons and Inc', 'Jack Bigs', '6 North Road, Brighton, Hampshire', '01923-435544', 'bibsonsandincbusiness@googlemail.com');
  INSERT INTO OUTLET VALUES(2,'Johns and sons', 'Dave Johns', '3 South Road, Brighton, Hampshire', '01943-435984', 'johnsandsonsbusiness@googlemail.com');
  INSERT INTO OUTLET VALUES(3,'Franksons', 'Frank Diddly', '2 West Road, Brighton, Hampshire', '0223-435654', 'franksons@googlemail.com');
  INSERT INTO OUTLET VALUES(4,'Nora and Jane', 'Nora Jones', '1 East Road, Brighton, Hampshire', '01323-435644', 'noraandjane@googlemail.com');
  INSERT INTO OUTLET VALUES(5,'Dave and dave', 'Dave Fields', '3 Silver Street, Taunton, Somerset', '02923-435344', 'daveanddavebusiness@googlemail.com');
  INSERT INTO OUTLET VALUES(6,'Marges Corner shop', 'Margarie Dorothy', '15 Durham Cottages, Stogumber, North Somerset', '04923-435644', 'margaries@googlemail.com');
  INSERT INTO OUTLET VALUES(7,'Geoff and Geoff', 'Geoffrey Greggrins', '15 Wright Avenue, Bristol, Somerset', '04923-423154', 'geoffandgeoff123business@googlemail.com');
  INSERT INTO OUTLET VALUES(8,'Smiths and inc', 'Bruce Smith', '6 Ford Road, Portsmouth, Hampshire', '01523-435344', 'smithsandincbusiness@googlemail.com');
  INSERT INTO OUTLET VALUES(9,'Tedds Mags', 'Tedd Baler', '6 Kanning Way, Portsmouth, Hampshire', '02323-439144', 'teddsmagsportsmouthbusinessemail@googlemail.com');
  INSERT INTO OUTLET VALUES(10,'Adam and sons', 'Adam Dickins', '6 Gold Street, White City, London', '01945-433254', 'adamandsons@googlemail.com');


  INSERT INTO ACCOUNT VALUES(1, 'BibsonsAndInc', 'James Bigs', 432.43, 10, 6000, 1);
  INSERT INTO ACCOUNT VALUES(2, 'JohnsAndSons', 'Freddy Johns', 66943.23, 3432, 7000, 2);
  INSERT INTO ACCOUNT VALUES(3, 'Franksons', 'Frank Biggins', 10.04, 2345, 2000, 3);
  INSERT INTO ACCOUNT VALUES(4, 'NorasNews', 'Nora Jones', 50.02, 673, 1000, 4);
  INSERT INTO ACCOUNT VALUES(5, 'DaveAndDave', 'Dave Roads', 11120.40, 543, 500, 5);
  INSERT INTO ACCOUNT VALUES(6, 'MargariesMagazines', 'Margarie Dorothy', 100.00, 0, 540, 6);
  INSERT INTO ACCOUNT VALUES(7, 'WorldNews', 'Alfred Green', 65200.43, 67, 432, 7);
  INSERT INTO ACCOUNT VALUES(8, 'SmithsAndInc', 'George Smith', 5340.23, 4333, 530, 8);
  INSERT INTO ACCOUNT VALUES(9, 'TechNews', 'Naoki Yamada', 650.04, 7753, 430, 9);
  INSERT INTO ACCOUNT VALUES(10, 'UKNews', 'Rosetta Reeds', 500.05, 453, 265, 10);


  INSERT INTO ORDTABLE VALUES(1, '2015-01-02', '10.00', 1);
  INSERT INTO ORDTABLE VALUES(2, '2015-03-22', '20.00', 2);
  INSERT INTO ORDTABLE VALUES(3, '2015-11-04', '30.00', 3);
  INSERT INTO ORDTABLE VALUES(4, '2015-05-17', '40.00', 4);
  INSERT INTO ORDTABLE VALUES(5, '2015-06-16', '50.00', 5);
  INSERT INTO ORDTABLE VALUES(6, '2015-07-16', '60.00', 6);
  INSERT INTO ORDTABLE VALUES(7, '2015-02-08', '70.00', 7);
  INSERT INTO ORDTABLE VALUES(8, '2015-09-28', '80.00', 8);
  INSERT INTO ORDTABLE VALUES(9, '2015-07-17', '90.00', 9);
  INSERT INTO ORDTABLE VALUES(10, '2015-01-13', '100.00', 10);


  INSERT INTO PUBLISHER VALUES(1, 'Franks Publishers', '64 Golden Road, Bristol, Somerset, TA4 TPR', '04243234123', 'frankspublishersbusiness@googlemail.com');
  INSERT INTO PUBLISHER VALUES(2, 'Noras news', '32 Silver Road, Portsmouth, Hampshire, PO4 9RF', '04325634123', 'norasnewsbusiness@googlemail.com');
  INSERT INTO PUBLISHER VALUES(3, 'Bens Bulletins', '16 Red Road, Taunton, Somerset, TA4 5VG', '04236545123', 'bensbulletinsbusiness@googlemail.com');
  INSERT INTO PUBLISHER VALUES(4, 'Margaries Magazines', '8 Blue Road, Bristol, Somerset, TA4 5ER', '04654734123', 'margariesmagazinesbusiness@googlemail.com');
  INSERT INTO PUBLISHER VALUES(5, 'World News', '4 Yellow Road, Portsmouth, Hampshire, PO4 3WS', '04232983273', 'worldnewsukbusiness@googlemail.com');
  INSERT INTO PUBLISHER VALUES(6, 'Tech News', '2 Green Road, Taunton, Somerset, TA4 4VF', '04432321323', 'technologynewsukbusiness@googlemail.com');
  INSERT INTO PUBLISHER VALUES(7, 'BDC Publishing', '1 Orange Road, Bristol, Somerset, TA4 0PE', '04322543123', 'bdcpublishingukbusiness@googlemail.com');
  INSERT INTO PUBLISHER VALUES(8, 'Wolf America', '2 Black Road, Portsmouth, Hampshire, PO4 8UF', '04987534723', 'wolfamericaukbusiness@googlemail.com');
  INSERT INTO PUBLISHER VALUES(9, 'International Publising', '4 White Road, Taunton, Somerset, TA4 T3E', '04237653223', 'internationalpublishingukbusiness@googlemail.com');
  INSERT INTO PUBLISHER VALUES(10, 'TV and Entertainment Publishing', '8 Multicoloured Road, Bristol, Somerset, TA4 8EF', '05462534823', 'tventertainmentukbusiness@googlemail.com');


  INSERT INTO PUBLICATION VALUES(1, 'Farming Weekly', 4.99, 1);
  INSERT INTO PUBLICATION VALUES(2, 'Gardening Weekly', 2.99, 2);
  INSERT INTO PUBLICATION VALUES(3, 'The Moon', 0.99, 3);
  INSERT INTO PUBLICATION VALUES(4, 'Best Cooking Recipes Monthly', 2.99, 4);
  INSERT INTO PUBLICATION VALUES(5, 'Daily News', 0.99, 5);
  INSERT INTO PUBLICATION VALUES(6, 'Weekly Tech Download', 0.99, 6);
  INSERT INTO PUBLICATION VALUES(7, 'The Daily BDC', 0.99, 7);
  INSERT INTO PUBLICATION VALUES(8, 'Wolf America', 2.99, 8);
  INSERT INTO PUBLICATION VALUES(9, 'World News Daily', 3.99, 9);
  INSERT INTO PUBLICATION VALUES(10, 'TV Listings and News', 1.99, 10);

  INSERT INTO CONTRACT VALUES(1, '2015-02-16', '2020-02-16', 1);
  INSERT INTO CONTRACT VALUES(2, '2014-12-29', '2019-12-29', 2);
  INSERT INTO CONTRACT VALUES(3, '2012-06-06', '2018-06-06', 3);
  INSERT INTO CONTRACT VALUES(4, '2010-03-22', '2017-03-22', 4);
  INSERT INTO CONTRACT VALUES(5, '2011-07-30', '2021-07-30', 5);
  INSERT INTO CONTRACT VALUES(6, '2013-03-28', '2016-03-28', 6);
  INSERT INTO CONTRACT VALUES(7, '2012-03-02', '2018-03-02', 7);
  INSERT INTO CONTRACT VALUES(8, '2011-06-01', '2021-06-01', 8);
  INSERT INTO CONTRACT VALUES(9, '2009-08-11', '2015-08-11', 9);
  INSERT INTO CONTRACT VALUES(10, '2008-10-10', '2016-10-10', 10);

  INSERT INTO DRIVER VALUES(1, 'TITLE1', 'Jim', 'Gregory', '1982-02-17', '0123456', '02135456852', 'jimgregory@googlemail.com');
  INSERT INTO DRIVER VALUES(2, 'TITLE2', 'Jeff', 'Green', '1992-03-13', '0322351', '02431256851', 'jeffgreen@googlemail.com');
  INSERT INTO DRIVER VALUES(3, 'TITLE3', 'Jimmy', 'Bates', '1979-06-30', '0523156', '03235456852', 'jimmybates@googlemail.com');
  INSERT INTO DRIVER VALUES(4, 'TITLE4', 'James', 'Bedding', '1981-07-22', '5123452', '04355456853', 'jamesbedding@googlemail.com');
  INSERT INTO DRIVER VALUES(5, 'TITLE5', 'Jeffrey', 'Trout', '1969-11-08', '8132451', '02135476852', 'jeffreytrout@googlemail.com');
  INSERT INTO DRIVER VALUES(6, 'TITLE6', 'Jem', 'Bartler', '1991-02-01', '3423456', '04155758850', 'jembartler@googlemail.com');
  INSERT INTO DRIVER VALUES(7, 'TITLE7', 'Jeud', 'Flemming', '1988-04-03', '2123443', '02534456852', 'jeudflemming@googlemail.com');
  INSERT INTO DRIVER VALUES(8, 'TITLE8', 'Jedd', 'Dawkins', '1993-07-12', '8675643', '02112356853', 'jedddawkins@googlemail.com');
  INSERT INTO DRIVER VALUES(9, 'TITLE9', 'John', 'Silver', '1976-11-23', '0985743', '02176326854', 'johnsilver@googlemail.com');
  INSERT INTO DRIVER VALUES(10, 'TITLE10', 'Derek', 'Brown', '1985-12-05', '5123453', '02432656852', 'derekbrown@googlemail.com');

  INSERT INTO ORDEROUT VALUES(1, 1, 1);
  INSERT INTO ORDEROUT VALUES(2, 2, 2);
  INSERT INTO ORDEROUT VALUES(3, 3, 3);
  INSERT INTO ORDEROUT VALUES(4, 4, 4);
  INSERT INTO ORDEROUT VALUES(5, 5, 5);
  INSERT INTO ORDEROUT VALUES(6, 6, 6);
  INSERT INTO ORDEROUT VALUES(7, 7, 7);
  INSERT INTO ORDEROUT VALUES(8, 8, 8);
  INSERT INTO ORDEROUT VALUES(9, 9, 9);
  INSERT INTO ORDEROUT VALUES(10, 10, 10);

  INSERT INTO VEHICLE VALUES(1, 'AD3 B32D', 'Peugot', 'XR2', 55342, '2016-02-22', '2016-12-05');
  INSERT INTO VEHICLE VALUES(2, 'XCV DD12', 'BMW', 'VW4', 63451, '2016-04-27', '2016-11-02');
  INSERT INTO VEHICLE VALUES(3, 'KL2 12XE', 'Rover', 'Sports S1', 87654, '2016-12-04', '2016-06-16');
  INSERT INTO VEHICLE VALUES(4, 'U7Y YS3D', 'Rover', 'Sports S1', 43512, '2016-05-30', '2016-06-23');
  INSERT INTO VEHICLE VALUES(5, 'X2D 43SX', 'Peugot', 'XR2', 65424, '2016-09-27', '2016-10-24');
  INSERT INTO VEHICLE VALUES(6, '09D VU3Y', 'BMW', 'VW4', 100432, '2016-12-20', '2016-02-11');
  INSERT INTO VEHICLE VALUES(7, 'PL3 AD4S', 'BMW', 'VW3', 87593, '2016-11-21', '2016-09-02');
  INSERT INTO VEHICLE VALUES(8, 'X12 DQR2', 'Peugot', 'XR2', 97843, '2016-03-05', '2016-10-04');
  INSERT INTO VEHICLE VALUES(9, 'KLW 21SD', 'BMW', 'FF2', 111234, '2016-01-25', '2016-06-22');
  INSERT INTO VEHICLE VALUES(10, 'XAS 215D', 'Rover', 'Transit R1', 40593, '2016-07-22', '2016-01-05');

  INSERT INTO RETURNITEM VALUES(1, '2015-02-11', 64.02, 13, 1, 1);
  INSERT INTO RETURNITEM VALUES(2, '2015-12-12', 32.01, 6, 2, 2);
  INSERT INTO RETURNITEM VALUES(3, '2015-08-22', 16.00, 3, 3, 3);
  INSERT INTO RETURNITEM VALUES(4, '2015-09-30', 45.32, 11, 4, 4);
  INSERT INTO RETURNITEM VALUES(5, '2015-11-02', 32.52, 11, 5, 5);
  INSERT INTO RETURNITEM VALUES(6, '2015-07-11', 54.65, 12, 6, 6);
  INSERT INTO RETURNITEM VALUES(7, '2015-05-05', 67.43, 14, 7, 7);
  INSERT INTO RETURNITEM VALUES(8, '2015-03-16', 62.01, 13, 8, 8);
  INSERT INTO RETURNITEM VALUES(9, '2015-01-19', 27.65, 5, 9, 9);
  INSERT INTO RETURNITEM VALUES(10, '2015-07-30', 11.02, 2, 10, 10);

  INSERT INTO DELIVERY VALUES(1, 1, 1, '2015-11-30', '12:05:23');
  INSERT INTO DELIVERY VALUES(2, 2, 2, '2015-12-20', '14:43:59');
  INSERT INTO DELIVERY VALUES(3, 3, 3, '2015-12-10', '17:59:45');
  INSERT INTO DELIVERY VALUES(4, 4, 4, '2015-09-16', '11:34:43');
  INSERT INTO DELIVERY VALUES(5, 5, 5, '2015-04-23', '10:53:12');
  INSERT INTO DELIVERY VALUES(6, 6, 6, '2015-06-28', '09:12:43');
  INSERT INTO DELIVERY VALUES(7, 7, 7, '2015-08-19', '12:03:21');
  INSERT INTO DELIVERY VALUES(8, 8, 8, '2015-11-03', '12:07:02');
  INSERT INTO DELIVERY VALUES(9, 9, 9, '2015-05-01', '15:32:33');
  INSERT INTO DELIVERY VALUES(10, 10, 10, '2015-03-03', '16:12:07');

  INSERT INTO ROUTE VALUES(1, 'Route 1', 1, 1);
  INSERT INTO ROUTE VALUES(2, 'Route 2', 2, 2);
  INSERT INTO ROUTE VALUES(3, 'Route 3', 3, 3);
  INSERT INTO ROUTE VALUES(4, 'Route 4', 4, 4);
  INSERT INTO ROUTE VALUES(5, 'Route 5', 5, 5);
  INSERT INTO ROUTE VALUES(6, 'Route 6', 6, 6);
  INSERT INTO ROUTE VALUES(7, 'Route 7', 7, 7);
  INSERT INTO ROUTE VALUES(8, 'Route 8', 8, 8);
  INSERT INTO ROUTE VALUES(9, 'Route 9', 9, 9);
  INSERT INTO ROUTE VALUES(10, 'Route 10', 10, 10);


  -- Queries
  -- TODO add a screeshot for each query showing its output
  -- TODO check the relational algebra and finish it
SELECT acc_name, acc_balance FROM ACCOUNT
WHERE acc_balance <= 200;
--JM may want to check each companies balance to see if they're running low
--so that they can warn them before they create a new order
πname, balance(σbalance ≤ 200(ACCOUNT))


SELECT pub_ID, pub_name, pub_price publisher_ID FROM PUBLICATION
WHERE pub_price < 3.00
ORDER BY pub_price;
--customers may want to know which publications are under a certain price
--in this case the price is below 3.00 and organised by price.

SELECT OUTLET.out_name, ORDTABLE.ord_ID
FROM OUTLET
LEFT OUTER JOIN ORDTABLE
ON OUTLET.out_ID=ORDTABLE.OUTLET_out_ID;
--JM may want to see which orders correspond with which businesses, this will
--join the business names with the IDs of their respective orders


SELECT route_ID, route_name FROM ROUTE
WHERE DELIVERY_DRIVER_dr_ID = 2;
--The driver 'Jeff Green' (id = 2) may want to find out which route they
--are taking

UPDATE PUBLICATION
SET pub_name='Farming Monthly'
WHERE pub_name='Farming Weekly';
--A publisher may want to update the name of a publication if it changes in their
--future. In this case 'Farming Weekly' will be changed to 'Farming Monthly'.



--Advanced Queries


SELECT * FROM PUBLICATION
WHERE pub_name LIKE '%News%'
ORDER BY pub_name ASC;
--A customer may wish to search for publications based on a certain keyword in this
--example the customer is search for news related items.

SELECT DELIVERY.del_ID, DELIVERY.del_date, DELIVERY.del_time,
ROUTE.route_name,
DRIVER.dr_fname, DRIVER.dr_lname
FROM DELIVERY
JOIN ROUTE
ON DELIVERY.DRIVER_dr_ID=ROUTE.DELIVERY_DRIVER_dr_ID
JOIN DRIVER
ON ROUTE.DELIVERY_DRIVER_dr_ID=DRIVER.dr_ID
ORDER BY DELIVERY.del_date ASC;
--JM may want information about which drivers where in charge of which deliveries
--this outputs the delivery information as well as the route taken and the drivers'
--first and last name.


--TODO check this and finish it
SELECT DRIVER.dr_lname, COUNT(DELIVERY.del_ID) AS NumberOfDeliveries
FROM DELIVERY
INNER JOIN DRIVER
ON DELIVERY.DRIVER_dr_ID=DRIVER.dr_ID
GROUP BY dr_lname HAVING COUNT(DELIVERY.del_ID > 5);


SELECT pub_name, pub_price FROM PUBLICATION
WHERE pub_price <
(SELECT pub_price FROM PUBLICATION
WHERE pub_name='World News Daily')
ORDER BY pub_price DESC;
--A customer may want to compare prices of one particular product with the rest
--this query searches for products under the price of the product 'World News Daily'
--by using 'World News Daily's price as a parameter in the first SELECT.
--It also displays the results via highest price first and lowest last.




--check string length of out_phone in OUTLET table
