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
VALUES ('Informatique'), ('Ameublement'), ('V�tement'), ('Sport&Loisirs');


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
	street VARCHAR(50) NOT NULL,
	postalCode VARCHAR(10) NOT NULL,
	city VARCHAR(50) NOT NULL,
	password VARCHAR(255) NOT NULL,
	credit INTEGER NOT NULL,
	administrator bit NOT NULL
)

ALTER TABLE USERS ADD CONSTRAINT user_pk PRIMARY KEY (userId)


INSERT INTO USERS (username, lastName, firstName, email, phone, street, postalCode, city, password, credit, administrator)
VALUES
('johnDoe', 'Doe', 'John', 'johndoe@example.com', '1234567890', '123 Main St', '12345', 'New York', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1000, 0),
('janeSmith', 'Smith', 'Jane', 'janesmith@example.com', '9876543210', '456 Oak Ave', '67890', 'Los Angeles', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 6000, 1),
('user1', 'Lastname1', 'Firstname1', 'user1@example.com', '1234567890', '123 Street', '12345', 'City1', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 300, 0),
('JeanDupont', 'Dupont', 'Jean', 'jeandupont@example.com', '0102030405', '1 Rue Principale', '75001', 'Paris', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1000, 0),
('MarieLambert', 'Lambert', 'Marie', 'marielambert@example.com', '0607080910', '5 Avenue des Roses', '69001', 'Lyon', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 6000, 1),
('PierreMartin', 'Martin', 'Pierre', 'pierremartin@example.com', '0601020304', '10 Rue Saint-Jacques', '31000', 'Toulouse', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 300, 0),
('SophieBernard', 'Bernard', 'Sophie', 'sophiebernard@example.com', '0607080910', '15 Boulevard Victor Hugo', '06000', 'Nice', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 0, 0),
('LuciePetit', 'Petit', 'Lucie', 'luciepetit@example.com', '0601020304', '20 Rue de la Paix', '44000', 'Nantes', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1300, 0),
('ThomasDurand', 'Durand', 'Thomas', 'thomasdurand@example.com', '0607080910', '25 Avenue Foch', '33000', 'Bordeaux', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 3250, 1),
('CamilleLeroy', 'Leroy', 'Camille', 'camilleleroy@example.com', '0601020304', '30 Rue Gambetta', '59000', 'Lille', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 666, 0),
('AntoineMoreau', 'Moreau', 'Antoine', 'antoinemoreau@example.com', '0607080910', '35 Avenue du G�n�ral de Gaulle', '67000', 'Strasbourg', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 999, 0),
('EmmaGirard', 'Girard', 'Emma', 'emmagirard@example.com', '0601020304', '40 Rue de la R�publique', '69002', 'Lyon', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1, 0),
('HugoRoux', 'Roux', 'Hugo', 'hugoroux@example.com', '0607080910', '45 Boulevard Haussmann', '75008', 'Paris', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 500, 0),
('JulietteLefebvre', 'Lefebvre', 'Juliette', 'juliettelefebvre@example.com', '0601020304', '50 Avenue des Champs-�lys�es', '75016', 'Paris', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 200, 0),
('MaximeMercier', 'Mercier', 'Maxime', 'maximemercier@example.com', '0607080910', '55 Rue de la Libert�', '13001', 'Marseille', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 3500, 1),
('ManonGarnier', 'Garnier', 'Manon', 'manongarnier@example.com', '0601020304', '60 Boulevard des Alpes', '06000', 'Nice', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 850, 0),
('GabrielChevalier', 'Chevalier', 'Gabriel', 'gabrielchevalier@example.com', '0607080910', '65 Rue Victor Hugo', '59000', 'Lille', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1250, 0),
('ClaraGuerin', 'Guerin', 'Clara', 'claraguerin@example.com', '0601020304', '70 Avenue de la Gare', '33000', 'Bordeaux', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 400, 0),
('EnzoMeyer', 'Meyer', 'Enzo', 'enzomeyer@example.com', '0607080910', '75 Rue Saint-Michel', '67000', 'Strasbourg', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 700, 0),
('Chlo�Renaud', 'Renaud', 'Chlo�', 'chloerenaud@example.com', '0601020304', '80 Boulevard Voltaire', '75011', 'Paris', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 100, 0),
('Th�oLemoine', 'Lemoine', 'Th�o', 'theolemoine@example.com', '0607080910', '85 Rue du Faubourg Saint-Antoine', '75012', 'Paris', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 950, 0),
('L�aBarbier', 'Barbier', 'L�a', 'leabarbier@example.com', '0601020304', '90 Avenue des Lilas', '13002', 'Marseille', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 2200, 1);


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
('Montre intelligente', 'Montre intelligente neuve avec fonctionnalit�s de suivi fitness', '2023-06-15', '2023-06-20', 200, 3, 1),
('Lunettes de soleil de designer', 'Lunettes de soleil �l�gantes avec protection UV', '2023-06-10', '2023-06-15', 150, 4, 2),
('Vinyles vintage', 'Collection de vinyles classiques', '2023-06-01', '2023-06-07', 100, 5, 3),
('Appareil photo num�rique', 'Appareil photo num�rique haute r�solution avec plusieurs objectifs', '2023-06-05', '2023-06-12', 300, 6, 1),
('�couteurs sans fil', '�couteurs Bluetooth avec technologie de r�duction du bruit', '2023-06-08', '2023-06-14', 120, 7, 2),
('Console de jeu', 'Derni�re console de jeu avec des graphismes avanc�s', '2023-05-11', '2023-06-18', 400, 8, 3),
('�quipement de fitness', 'Ensemble complet d''�quipement d''entra�nement pour la maison', '2023-06-20', '2023-06-26', 250, 9, 1),
('Sac � main de designer', 'Sac � main de luxe en cuir noir', '2023-06-13', '2023-06-19', 350, 10, 2),
('Montre ancienne', 'Rare montre de poche antique du 19e si�cle', '2023-05-07', '2023-06-14', 180, 1, 3),
('Ordinateur portable', 'Ordinateur portable puissant avec une grande vitesse de traitement', '2023-06-10', '2023-06-17', 700, 2, 1),
('V�lo de montagne', 'V�lo de montagne robuste pour les aventures en plein air', '2023-06-18', '2023-06-25', 450, 3, 2),
('Logiciel de design graphique', 'Logiciel professionnel pour les graphistes', '2023-06-05', '2023-06-12', 150, 4, 3),
('Enceinte Bluetooth portable', 'Enceinte compacte avec connectivit� sans fil', '2023-06-08', '2023-06-15', 80, 5, 1),
('Figurines de collection', 'Figurines en �dition limit�e de films populaires', '2023-06-11', '2023-06-18', 200, 6, 2),
('Batterie de cuisine', 'Ensemble de batterie de cuisine en acier inoxydable de haute qualit�', '2023-06-17', '2023-06-24', 300, 7, 3),
('Sac � dos de randonn�e', 'Sac � dos spacieux avec plusieurs compartiments', '2023-06-14', '2023-06-21', 100, 8, 1),
('Piano num�rique', 'Piano num�rique de taille standard avec des touches lest�es', '2023-06-03', '2023-06-10', 500, 9, 2),
('Appareil photo vintage', 'Appareil photo argentique classique en excellent �tat', '2023-06-09', '2023-06-16', 250, 10, 3),
('�couteurs sans fil', '�couteurs sans fil �l�gants avec une longue autonomie de batterie', '2023-06-12', '2023-06-19', 120, 1, 1),
('Robe de designer', 'Robe de designer �l�gante pour les occasions sp�ciales', '2023-06-16', '2023-06-23', 350, 2, 2),
('Ensemble de romans classiques', 'Collection d''�uvres litt�raires intemporelles', '2023-06-06', '2023-06-13', 80, 3, 3),
('Syst�me home cin�ma', 'Configuration compl�te de home cin�ma avec son surround', '2023-06-14', '2023-06-21', 600, 4, 1),
('Montre de sport', 'Montre de sport r�sistante � l''eau avec suivi GPS', '2023-06-18', '2023-06-25', 150, 5, 2),
('Tourne-disque vintage', 'Tourne-disque antique avec haut-parleurs int�gr�s', '2023-06-09', '2023-06-16', 200, 6, 3),
('Souris et clavier de jeu', 'Accessoires de jeu hautes performances', '2023-04-12', '2023-06-19', 100, 7, 1),
('�quipement de gym � domicile', 'Syst�me de gym � domicile tout-en-un pour des s�ances d''entra�nement compl�tes', '2023-06-19', '2023-06-26', 400, 8, 2),
('Portefeuille de designer', 'Portefeuille de designer luxueux en cuir v�ritable', '2023-06-15', '2023-06-22', 180, 9, 3),
('Syst�me de s�curit� domotique', 'Syst�me de s�curit� avanc� avec cam�ras de surveillance', '2023-06-05', '2023-06-12', 300, 10, 1),
('Table � manger et chaises', 'Ensemble de meubles de salle � manger �l�gants pour votre maison', '2023-06-10', '2023-06-17', 500, 1, 2),
('Guitare �lectrique', 'Guitare �lectrique professionnelle avec amplificateur', '2023-06-17', '2023-06-24', 350, 2, 3),
('Chargeur sans fil', 'Chargeur sans fil pratique pour les smartphones', '2023-03-13', '2023-06-20', 50, 3, 1);


DECLARE @Today DATE = CAST(GETDATE() AS DATE);
DECLARE @StartDateOffset INT;
DECLARE @EndDateOffset INT;

-- Boucle pour ajouter 20 lignes
DECLARE @Counter INT = 1;
WHILE @Counter <= 20
BEGIN
    -- G�n�ration d'un nombre al�atoire pour les offsets de startDate et endDate
    SET @StartDateOffset = ABS(CHECKSUM(NEWID())) % 30;
    SET @EndDateOffset = ABS(CHECKSUM(NEWID())) % 30;
    
    -- Insertion de la nouvelle ligne avec les valeurs g�n�r�es
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
VALUES (1, '2 Avenue du Port', '44300', 'Nantes'),
(2, '321 Rue du March�', '49100', 'Angers'),
(3, '1 Rue de la Paix', '75001', 'Paris'),
(4, '15 Rue du Commerce', '69001', 'Lyon'),
(5, '35 Rue Sainte-Catherine', '33000', 'Bordeaux'),
(6, '20 Rue des Fleurs', '54000', 'Nancy'),
(7, '10 Rue Paradis', '13001', 'Marseille'),
(8, '5 Rue de la Libert�', '35000', 'Rennes'),
(9, '25 Rue Nationale', '59000', 'Lille'),
(10, '18 Rue des Juifs', '67000', 'Strasbourg'),
(11, '8 Rue des Champs', '57000', 'Metz'),
(12, '30 Rue du Port', '44000', 'Nantes'),
(13, '22 Rue des Arts', '86000', 'Poitiers'),
(14, '17 Rue des Halles', '80000', 'Amiens'),
(15, '9 Rue de la Lib�ration', '21000', 'Dijon'),
(16, '12 Rue Pasteur', '25000', 'Besan�on'),
(17, '33 Rue des �coles', '67000', 'Strasbourg'),
(18, '28 Rue des Oliviers', '34000', 'Montpellier'),
(19, '7 Rue de la Roche', '35000', 'Rennes'),
(20, '21 Rue des Roses', '59000', 'Lille'),
(21, '2 Rue de la Concorde', '75000', 'Paris'),
(22, '14 Rue du Soleil', '69000', 'Lyon'),
(23, '31 Rue de la Gare', '33000', 'Bordeaux'),
(24, '16 Rue Victor Hugo', '54000', 'Nancy'),
(25, '11 Rue de la Scrum', '13001', 'Marseille'),
(26, '6 Rue des Moulins', '35000', 'Rennes'),
(27, '27 Rue Saint-Pierre', '59000', 'Lille'),
(28, '13 Rue des Vignes', '67000', 'Strasbourg'),
(29, '36 Rue des Ormes', '57000', 'Metz'),
(30, '19 Rue de la Plage', '44000', 'Nantes'),
(31, '23 Rue des Pommiers', '86000', 'Poitiers'),
(32, '3 Rue des Lys', '80000', 'Amiens'),
(33, '26 Rue des Cerisiers', '21000', 'Dijon'),
(34, '18 Rue de la Poste', '25000', 'Besan�on'),
(35, '5 Rue de la Fontaine', '67000', 'Strasbourg'),
(36, '10 Rue du March�', '34000', 'Montpellier'),
(37, '24 Rue des Pr�s', '35000', 'Rennes'),
(38, '1 Rue de la Croix', '59000', 'Lille'),
(39, '16 Rue des Violettes', '75000', 'Paris'),
(40, '9 Rue du Moulin', '69000', 'Lyon'),
(41, '32 Rue de la Mairie', '33000', 'Bordeaux'),
(42, '14 Rue du Quoicou', '54000', 'Nancy'),
(43, '28 Rue des Ch�nes', '13001', 'Marseille'),
(44, '7 Rue des Alouettes', '35000', 'Rennes'),
(45, '25 Rue des Primev�res', '59000', 'Lille'),
(46, '11 Rue des Platanes', '67000', 'Strasbourg'),
(47, '33 Rue des Lilas', '57000', 'Metz'),
(48, '20 Rue des �glantiers', '44000', 'Nantes'),
(49, '4 Rue de la R�publique', '86000', 'Poitiers'),
(50, '27 Rue des Mimosas', '80000', 'Amiens'),
(51, 'Rue des Acacias', '44300', 'Nantes'),
(52, 'Avenue de la R�publique', '49100', 'Angers'),
(53, 'Boulevard Gambetta', '75001', 'Paris');
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