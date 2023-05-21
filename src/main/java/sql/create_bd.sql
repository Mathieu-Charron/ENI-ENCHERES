USE [ENI-ENCHERE]

DROP TABLE IF EXISTS BIDS
DROP TABLE IF EXISTS WITHDRAWALS
DROP TABLE IF EXISTS SOLD_ITEMS
DROP TABLE IF EXISTS USERS
DROP TABLE IF EXISTS CATEGORIES

/*****************************
CATEGORIES
******************************/
CREATE TABLE CATEGORIES (
categoryId INTEGER IDENTITY(1,1) NOT NULL,
label VARCHAR(30) NOT NULL
)

ALTER TABLE CATEGORIES ADD CONSTRAINT category_pk PRIMARY KEY (categoryId)

INSERT INTO CATEGORIES (label)
VALUES ('Informatique'), ('Ameublement'), ('Vêtement'), ('Sport&Loisirs');


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
	password VARCHAR(255) NOT NULL,
	credit INTEGER NOT NULL,
	administrator bit NOT NULL
)

ALTER TABLE USERS ADD CONSTRAINT user_pk PRIMARY KEY (userId)

INSERT INTO USERS (username, lastName, firstName, email, phone, street, postalCode, city, password, credit, administrator)
VALUES ('johnDoe', 'Doe', 'John', 'johndoe@example.com', '1234567890', '123 Main St', '12345', 'New York', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1000, 0),
('janeSmith', 'Smith', 'Jane', 'janesmith@example.com', '9876543210', '456 Oak Ave', '67890', 'Los Angeles', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 6000, 1),
('user1', 'Lastname1', 'Firstname1', 'user1@example.com', '1234567890', '123 Street', '12345', 'City1', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 300, 0),
('user2', 'Lastname2', 'Firstname2', 'user2@example.com', '9876543210', '456 Avenue', '67890', 'City2', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 0, 0),
('user3', 'Lastname3', 'Firstname3', 'user3@example.com', '5555555555', '789 Road', '54321', 'City3', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1300, 0),
('user4', 'Lastname4', 'Firstname4', 'user4@example.com', '1111111111', '987 Lane', '09876', 'City4', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 3250, 1),
('user5', 'Lastname5', 'Firstname5', 'user5@example.com', '2222222222', '654 Boulevard', '54321', 'City5', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 666, 0),
('user6', 'Lastname6', 'Firstname6', 'user6@example.com', '3333333333', '321 Drive', '12345', 'City6', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 999, 0),
('user7', 'Lastname7', 'Firstname7', 'user7@example.com', '4444444444', '159 Street', '67890', 'City7', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1, 0),
('user8', 'Lastname8', 'Firstname8', 'user8@example.com', '9999999999', '753 Avenue', '09876', 'City8', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 500, 0);


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
	userId INTEGER,
	categoryId INTEGER NOT NULL
)

ALTER TABLE SOLD_ITEMS ADD CONSTRAINT sold_items_pk PRIMARY KEY (soldItemId)

ALTER TABLE SOLD_ITEMS
ADD CONSTRAINT sold_items_category_fk FOREIGN KEY (categoryId) REFERENCES CATEGORIES (categoryId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE SOLD_ITEMS
ADD CONSTRAINT sold_items_user_fk FOREIGN KEY (userId) REFERENCES USERS (userId)
ON DELETE SET NULL
ON UPDATE NO ACTION

INSERT INTO SOLD_ITEMS (itemName, description, startDate, endDate, initialPrice, userId, categoryId)

VALUES ('iPhone X', 'Used iPhone X in good condition', CAST( GETDATE() AS Date ) , '2023-05-10', 450, 1, 1),
('Leather Jacket', 'Black leather jacket, size M', '2023-05-03', '2023-05-08', 80, 2, 2),
('Montre intelligente', 'Montre intelligente neuve avec fonctionnalités de suivi fitness', '2023-06-15', '2023-06-20', 200, 3, 1),
('Lunettes de soleil de designer', 'Lunettes de soleil élégantes avec protection UV', '2023-06-10', '2023-06-15', 150, 4, 2),
('Vinyles vintage', 'Collection de vinyles classiques', '2023-06-01', '2023-06-07', 100, 5, 3),
('Appareil photo numérique', 'Appareil photo numérique haute résolution avec plusieurs objectifs', '2023-06-05', '2023-06-12', 300, 6, 1),
('Écouteurs sans fil', 'Écouteurs Bluetooth avec technologie de réduction du bruit', '2023-06-08', '2023-06-14', 120, 7, 2),
('Console de jeu', 'Dernière console de jeu avec des graphismes avancés', '2023-05-11', '2023-06-18', 400, 8, 3),
('Équipement de fitness', 'Ensemble complet d''équipement d''entraînement pour la maison', '2023-06-20', '2023-06-26', 250, 9, 1),
('Sac à main de designer', 'Sac à main de luxe en cuir noir', '2023-06-13', '2023-06-19', 350, 10, 2),
('Montre ancienne', 'Rare montre de poche antique du 19e siècle', '2023-05-07', '2023-06-14', 180, 1, 3),
('Ordinateur portable', 'Ordinateur portable puissant avec une grande vitesse de traitement', '2023-06-10', '2023-06-17', 700, 2, 1),
('Vélo de montagne', 'Vélo de montagne robuste pour les aventures en plein air', '2023-06-18', '2023-06-25', 450, 3, 2),
('Logiciel de design graphique', 'Logiciel professionnel pour les graphistes', '2023-06-05', '2023-06-12', 150, 4, 3),
('Enceinte Bluetooth portable', 'Enceinte compacte avec connectivité sans fil', '2023-06-08', '2023-06-15', 80, 5, 1),
('Figurines de collection', 'Figurines en édition limitée de films populaires', '2023-06-11', '2023-06-18', 200, 6, 2),
('Batterie de cuisine', 'Ensemble de batterie de cuisine en acier inoxydable de haute qualité', '2023-06-17', '2023-06-24', 300, 7, 3),
('Sac à dos de randonnée', 'Sac à dos spacieux avec plusieurs compartiments', '2023-06-14', '2023-06-21', 100, 8, 1),
('Piano numérique', 'Piano numérique de taille standard avec des touches lestées', '2023-06-03', '2023-06-10', 500, 9, 2),
('Appareil photo vintage', 'Appareil photo argentique classique en excellent état', '2023-06-09', '2023-06-16', 250, 10, 3),
('Écouteurs sans fil', 'Écouteurs sans fil élégants avec une longue autonomie de batterie', '2023-06-12', '2023-06-19', 120, 1, 1),
('Robe de designer', 'Robe de designer élégante pour les occasions spéciales', '2023-06-16', '2023-06-23', 350, 2, 2),
('Ensemble de romans classiques', 'Collection d''œuvres littéraires intemporelles', '2023-06-06', '2023-06-13', 80, 3, 3),
('Système home cinéma', 'Configuration complète de home cinéma avec son surround', '2023-06-14', '2023-06-21', 600, 4, 1),
('Montre de sport', 'Montre de sport résistante à l''eau avec suivi GPS', '2023-06-18', '2023-06-25', 150, 5, 2),
('Tourne-disque vintage', 'Tourne-disque antique avec haut-parleurs intégrés', '2023-06-09', '2023-06-16', 200, 6, 3),
('Souris et clavier de jeu', 'Accessoires de jeu hautes performances', '2023-04-12', '2023-06-19', 100, 7, 1),
('Équipement de gym à domicile', 'Système de gym à domicile tout-en-un pour des séances d''entraînement complètes', '2023-06-19', '2023-06-26', 400, 8, 2),
('Portefeuille de designer', 'Portefeuille de designer luxueux en cuir véritable', '2023-06-15', '2023-06-22', 180, 9, 3),
('Système de sécurité domotique', 'Système de sécurité avancé avec caméras de surveillance', '2023-06-05', '2023-06-12', 300, 10, 1),
('Table à manger et chaises', 'Ensemble de meubles de salle à manger élégants pour votre maison', '2023-06-10', '2023-06-17', 500, 1, 2),
('Guitare électrique', 'Guitare électrique professionnelle avec amplificateur', '2023-06-17', '2023-06-24', 350, 2, 3),
('Chargeur sans fil', 'Chargeur sans fil pratique pour les smartphones', '2023-03-13', '2023-06-20', 50, 3, 1);


DECLARE @Today DATE = CAST(GETDATE() AS DATE);
DECLARE @StartDateOffset INT;
DECLARE @EndDateOffset INT;

-- Boucle pour ajouter 20 lignes
DECLARE @Counter INT = 1;
WHILE @Counter <= 20
BEGIN
    -- Génération d'un nombre aléatoire pour les offsets de startDate et endDate
    SET @StartDateOffset = ABS(CHECKSUM(NEWID())) % 30;
    SET @EndDateOffset = ABS(CHECKSUM(NEWID())) % 30;
    
    -- Insertion de la nouvelle ligne avec les valeurs générées
    INSERT INTO SOLD_ITEMS (itemName, description, startDate, endDate, initialPrice, userId, categoryId)
    VALUES (
        'Item ' + CAST(@Counter AS VARCHAR(10)),
        'Description of item ' + CAST(@Counter AS VARCHAR(10)),
        DATEADD(DAY, -@StartDateOffset, @Today),
        DATEADD(DAY, @EndDateOffset, @Today),
        ABS(CHECKSUM(NEWID())) % 500 + 50,
        ABS(CHECKSUM(NEWID())) % 10 + 1,
        ABS(CHECKSUM(NEWID())) % 4 + 1
    );

    SET @Counter = @Counter + 1;
END;


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
	userId INTEGER
)

ALTER TABLE BIDS ADD CONSTRAINT bid_pk PRIMARY KEY (bidId)

ALTER TABLE BIDS
ADD CONSTRAINT bid_user_fk FOREIGN KEY (userId) REFERENCES USERS (userId)
ON DELETE SET NULL
ON UPDATE NO ACTION

ALTER TABLE BIDS
ADD CONSTRAINT bid_item_fk FOREIGN KEY (soldItemId) REFERENCES SOLD_ITEMS (soldItemId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

INSERT INTO BIDS (bidDate, bidAmount, soldItemId, userId)
VALUES ('2023-05-05 10:30:00', 480, 1, 2),
('2023-05-07 14:45:00', 90, 2, 1),
('2023-05-05 10:30:00', 480, 1, 2),
('2023-05-07 14:45:00', 90, 2, 1),
('2023-06-06 11:15:00', 520, 3, 3),
('2023-06-09 09:30:00', 200, 4, 4),
('2023-11-06 16:00:00', 150, 5, 5),
('2023-13-06 13:45:00', 300, 6, 6),
('2023-15-06 10:30:00', 180, 7, 7),
('2023-18-06 14:00:00', 400, 8, 8),
('2023-20-06 11:30:00', 250, 9, 9),
('2023-23-06 15:45:00', 350, 10, 10),
('2023-26-06 12:15:00', 270, 11, 1),
('2023-29-06 10:45:00', 320, 12, 2),
('2023-07-02 14:30:00', 150, 13, 3),
('2023-07-05 09:00:00', 280, 14, 4),
('2023-07-08 11:45:00', 220, 15, 5),
('2023-07-10 10:15:00', 400, 16, 6),
('2023-13-07 14:30:00', 180, 17, 7),
('2023-16-07 12:00:00', 350, 18, 8),
('2023-19-07 10:30:00', 240, 19, 9),
('2023-22-07 15:00:00', 320, 20, 10),
('2023-25-07 11:45:00', 290, 21, 1),
('2023-28-07 09:30:00', 370, 22, 2),
('2023-30-07 13:15:00', 200, 23, 3),
('2023-08-03 10:45:00', 330, 24, 4),
('2023-08-06 11:30:00', 250, 25, 5),
('2023-08-09 10:00:00', 420, 26, 6),
('2023-08-12 13:45:00', 170, 27, 7),
('2023-15-08 12:00:00', 380, 28, 8),
('2023-18-08 10:30:00', 260, 29, 9),
('2023-21-08 14:00:00', 350, 30, 10),
('2023-24-08 11:00:00', 310, 31, 1),
('2023-27-08 09:30:00', 420, 32, 2),
('2023-30-08 13:45:00', 180, 33, 3),
('2023-09-02 11:15:00', 390, 10, 4),
('2023-09-05 10:45:00', 290, 19, 5),
('2023-09-08 10:00:00', 450, 30, 6),
('2023-09-11 13:30:00', 220, 5, 7),
('2023-14-09 12:00:00', 370, 8, 8),
('2023-17-09 10:30:00', 280, 8, 9),
('2023-20-09 14:15:00', 320, 23, 10),
('2023-23-09 11:45:00', 330, 12, 1),
('2023-26-09 10:30:00', 480, 22, 2),
('2023-29-09 12:00:00', 210, 1, 3),
('2023-10-02 11:30:00', 400, 4, 4),
('2023-10-05 10:00:00', 270, 26, 5),
('2023-10-08 09:30:00', 430, 14, 6),
('2023-10-11 13:00:00', 230, 7, 7),
('2023-14-10 11:30:00', 380, 28, 8),
('2023-17-10 10:00:00', 310, 10, 9),
('2023-20-10 14:45:00', 360, 5, 10);