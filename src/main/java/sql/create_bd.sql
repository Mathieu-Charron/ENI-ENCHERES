USE [ENI-ENCHERE]

DROP TABLE BIDS
DROP TABLE WITHDRAWALS
DROP TABLE SOLD_ITEMS
DROP TABLE USERS
DROP TABLE CATEGORIES
/*****************************
CATEGORIES
******************************/
CREATE TABLE CATEGORIES (
categoryId INTEGER IDENTITY(1,1) NOT NULL,
label VARCHAR(30) NOT NULL
)

ALTER TABLE CATEGORIES ADD CONSTRAINT category_pk PRIMARY KEY (categoryId)

INSERT INTO CATEGORIES (label)
VALUES ('Informatique'), ('Meuble'), ('Livre');


/*****************************
USERS
******************************/
CREATE TABLE USERS (
	userId INTEGER IDENTITY(1,1) NOT NULL,
	username VARCHAR(30) NOT NULL,
	lastName VARCHAR(30) NOT NULL,
	firstName VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(15),
	street VARCHAR(30) NOT NULL,
	postalCode VARCHAR(10) NOT NULL,
	city VARCHAR(50) NOT NULL,
	password VARCHAR(30) NOT NULL,
	credit INTEGER NOT NULL,
	administrator bit NOT NULL
)

ALTER TABLE USERS ADD CONSTRAINT user_pk PRIMARY KEY (userId)

INSERT INTO USERS (username, lastName, firstName, email, phone, street, postalCode, city, password, credit, administrator)
VALUES ('johnDoe', 'Doe', 'John', 'johndoe@example.com', '1234567890', '123 Main St', '12345', 'New York', 'password123', 100, 0),
('janeSmith', 'Smith', 'Jane', 'janesmith@example.com', '9876543210', '456 Oak Ave', '67890', 'Los Angeles', 'password456', 200, 1);


/*****************************
SOLD_ITEMS
******************************/
CREATE TABLE SOLD_ITEMS (
	soldItemId INTEGER IDENTITY(1,1) NOT NULL,
	itemName VARCHAR(30) NOT NULL,
	description VARCHAR(300) NOT NULL,
	startDate DATE NOT NULL,
	endDate DATE NOT NULL,
	initialPrice INTEGER,
	salePrice INTEGER,
	userId INTEGER NOT NULL,
	categoryId INTEGER NOT NULL
)

ALTER TABLE SOLD_ITEMS ADD CONSTRAINT sold_items_pk PRIMARY KEY (soldItemId)

ALTER TABLE SOLD_ITEMS
ADD CONSTRAINT sold_items_category_fk FOREIGN KEY (categoryId) REFERENCES CATEGORIES (categoryId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE SOLD_ITEMS
ADD CONSTRAINT sold_items_user_fk FOREIGN KEY (userId) REFERENCES USERS (userId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

INSERT INTO SOLD_ITEMS (itemName, description, startDate, endDate, initialPrice, salePrice, userId, categoryId)
VALUES ('iPhone X', 'Used iPhone X in good condition', '2023-05-01', '2023-05-10', 500, 450, 1, 1),
('Leather Jacket', 'Black leather jacket, size M', '2023-05-03', '2023-05-08', 100, 80, 2, 2);


/*****************************
WITHDRAWALS
******************************/
CREATE TABLE WITHDRAWALS (
	soldItemId INTEGER NOT NULL,
	street VARCHAR(30) NOT NULL,
	postalCode VARCHAR(15) NOT NULL,
	city VARCHAR(30) NOT NULL
)

ALTER TABLE WITHDRAWALS ADD CONSTRAINT withdrawal_pk PRIMARY KEY (soldItemId)

ALTER TABLE WITHDRAWALS
ADD CONSTRAINT withdrawal_item_fk FOREIGN KEY (soldItemId) REFERENCES SOLD_ITEMS (soldItemId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

INSERT INTO WITHDRAWALS (soldItemId, street, postalCode, city)
VALUES (1, '789 Elm St', '44300', 'Nantes'),
(2, '321 Pine St', '49100', 'Angers');

/*****************************
BIDS
******************************/
CREATE TABLE BIDS (
	bidId INTEGER IDENTITY(1,1) NOT NULL,
	bidDate DATETIME NOT NULL,
	bidAmount INTEGER NOT NULL,
	soldItemId INTEGER NOT NULL,
	userId INTEGER NOT NULL
)

ALTER TABLE BIDS ADD CONSTRAINT bid_pk PRIMARY KEY (bidId)

ALTER TABLE BIDS
ADD CONSTRAINT bid_user_fk FOREIGN KEY (userId) REFERENCES USERS (userId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE BIDS
ADD CONSTRAINT bid_item_fk FOREIGN KEY (soldItemId) REFERENCES SOLD_ITEMS (soldItemId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

INSERT INTO BIDS (bidDate, bidAmount, soldItemId, userId)
VALUES ('2023-05-05 10:30:00', 480, 1, 2),
('2023-05-07 14:45:00', 90, 2, 1);