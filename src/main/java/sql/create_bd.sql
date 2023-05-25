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
('AntoineMoreau', 'Moreau', 'Antoine', 'antoinemoreau@example.com', '0607080910', '35 Avenue du Général de Gaulle', '67000', 'Strasbourg', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 999, 0),
('EmmaGirard', 'Girard', 'Emma', 'emmagirard@example.com', '0601020304', '40 Rue de la République', '69002', 'Lyon', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1, 0),
('HugoRoux', 'Roux', 'Hugo', 'hugoroux@example.com', '0607080910', '45 Boulevard Haussmann', '75008', 'Paris', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 500, 0),
('JulietteLefebvre', 'Lefebvre', 'Juliette', 'juliettelefebvre@example.com', '0601020304', '50 Avenue des Champs-Élysées', '75016', 'Paris', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 200, 0),
('MaximeMercier', 'Mercier', 'Maxime', 'maximemercier@example.com', '0607080910', '55 Rue de la Liberté', '13001', 'Marseille', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 3500, 1),
('ManonGarnier', 'Garnier', 'Manon', 'manongarnier@example.com', '0601020304', '60 Boulevard des Alpes', '06000', 'Nice', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 850, 0),
('GabrielChevalier', 'Chevalier', 'Gabriel', 'gabrielchevalier@example.com', '0607080910', '65 Rue Victor Hugo', '59000', 'Lille', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1250, 0),
('ClaraGuerin', 'Guerin', 'Clara', 'claraguerin@example.com', '0601020304', '70 Avenue de la Gare', '33000', 'Bordeaux', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 400, 0),
('EnzoMeyer', 'Meyer', 'Enzo', 'enzomeyer@example.com', '0607080910', '75 Rue Saint-Michel', '67000', 'Strasbourg', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 700, 0),
('ChloéRenaud', 'Renaud', 'Chloé', 'chloerenaud@example.com', '0601020304', '80 Boulevard Voltaire', '75011', 'Paris', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 100, 0),
('ThéoLemoine', 'Lemoine', 'Théo', 'theolemoine@example.com', '0607080910', '85 Rue du Faubourg Saint-Antoine', '75012', 'Paris', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 950, 0),
('LéaBarbier', 'Barbier', 'Léa', 'leabarbier@example.com', '0601020304', '90 Avenue des Lilas', '13002', 'Marseille', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 2200, 1);


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

VALUES ('iPhone X', 'iPhone X utilisé en bonne condition', CAST( GETDATE() AS Date ) , '2023-05-10', 450, 1, 1),
('Veste en cuir', 'Veste en cuir noir, taille M', '2023-05-03', '2023-05-08', 80, 2, 3),
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


-- Catégorie : Informatique
INSERT INTO SOLD_ITEMS (itemName, description, startDate, endDate, initialPrice, userId, categoryId)
VALUES 
('Ordinateur portable HP', 'Un ordinateur portable puissant avec un processeur Intel Core i5, 8 Go de RAM et un disque dur de 512 Go.', 
'2023-05-10', '2023-06-20', 1500, 1, 1),

('Imprimante sans fil Canon', 'Une imprimante sans fil compacte avec une résolution d''impression élevée et une connectivité facile.', 
'2023-05-15', '2023-06-25', 200, 2, 1),

('Clavier mécanique RGB', 'Un clavier mécanique rétroéclairé avec des touches programmables et une réponse rapide.', 
'2023-05-05', '2023-06-15', 100, 3, 1),

-- Catégorie : Ameublement
('Canapé d''angle moderne', 'Un canapé d''angle en cuir noir avec un design moderne, confortable et spacieux.', 
'2023-05-08', '2023-06-18', 1200, 4, 2),

('Table basse en bois massif', 'Une table basse robuste en bois massif avec un plateau spacieux et des pieds élégants.', 
'2023-05-12', '2023-06-22', 300, 5, 2),

('Lampadaire design', 'Un lampadaire moderne avec un abat-jour en tissu et une base en acier inoxydable.', 
'2023-05-20', '2023-06-30', 150, 6, 2),

-- Catégorie : Vêtement
('Chemise en coton pour homme', 'Une chemise décontractée en coton avec un col boutonné, des manches longues et un motif à carreaux.', 
'2023-05-05', '2023-06-15', 50, 7, 3),

('Robe d''été fleurie', 'Une robe d''été légère avec un imprimé floral, des bretelles réglables et une ceinture assortie.', 
'2023-05-18', '2023-06-28', 80, 8, 3),

('Chaussures de sport', 'Des chaussures de sport confortables avec une semelle amortissante et un design respirant.', 
'2023-05-10', '2023-06-20', 70, 9, 3),

-- Catégorie : Sport&Loisirs
('Tapis de yoga antidérapant', 'Un tapis de yoga en caoutchouc naturel antidérapant, confortable et résistant.', 
'2023-05-07', '2023-06-17', 30, 10, 4),

('Sac à dos de randonnée', 'Un sac à dos spacieux avec plusieurs compartiments, une armature solide et des bretelles ajustables.', 
'2023-05-14', '2023-06-24', 50, 11, 4),

('Raquette de tennis pro', 'Une raquette de tennis haut de gamme avec une construction en graphite et une excellente prise en main.', 
'2023-05-21', '2023-06-30', 200, 12, 4);




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
(2, '321 Rue du Marché', '49100', 'Angers'),
(3, '1 Rue de la Paix', '75001', 'Paris'),
(4, '15 Rue du Commerce', '69001', 'Lyon'),
(5, '35 Rue Sainte-Catherine', '33000', 'Bordeaux'),
(6, '20 Rue des Fleurs', '54000', 'Nancy'),
(7, '10 Rue Paradis', '13001', 'Marseille'),
(8, '5 Rue de la Liberté', '35000', 'Rennes'),
(9, '25 Rue Nationale', '59000', 'Lille'),
(10, '18 Rue des Juifs', '67000', 'Strasbourg'),
(11, '8 Rue des Champs', '57000', 'Metz'),
(12, '30 Rue du Port', '44000', 'Nantes'),
(13, '22 Rue des Arts', '86000', 'Poitiers'),
(14, '17 Rue des Halles', '80000', 'Amiens'),
(15, '9 Rue de la Libération', '21000', 'Dijon'),
(16, '12 Rue Pasteur', '25000', 'Besançon'),
(17, '33 Rue des Écoles', '67000', 'Strasbourg'),
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
(34, '18 Rue de la Poste', '25000', 'Besançon'),
(35, '5 Rue de la Fontaine', '67000', 'Strasbourg'),
(36, '10 Rue du Marché', '34000', 'Montpellier'),
(37, '24 Rue des Prés', '35000', 'Rennes'),
(38, '1 Rue de la Croix', '59000', 'Lille'),
(39, '16 Rue des Violettes', '75000', 'Paris'),
(40, '9 Rue du Moulin', '69000', 'Lyon'),
(41, '32 Rue de la Mairie', '33000', 'Bordeaux'),
(42, '14 Rue du Quoicou', '54000', 'Nancy'),
(43, '28 Rue des Chênes', '13001', 'Marseille'),
(44, '7 Rue des Alouettes', '35000', 'Rennes'),
(45, '25 Rue des Primevères', '59000', 'Lille');
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
VALUES
-- Bids for 'iPhone X'
('2023-10-05 09:30:00', 500, 1, 3),
('2023-11-05 14:15:00', 550, 1, 4),
('2023-11-05 15:30:00', 600, 1, 5),
('2023-12-05 10:45:00', 520, 1, 6),
('2023-13-05 13:20:00', 550, 1, 7),
-- Bids for 'Leather Jacket'
('2023-03-05 12:00:00', 90, 2, 1),
('2023-04-05 09:45:00', 100, 2, 2),
('2023-05-05 14:30:00', 110, 2, 3),
('2023-06-05 16:00:00', 95, 2, 4),
('2023-07-05 11:15:00', 120, 2, 5),
-- Bids for 'Montre intelligente'
('2023-15-06 13:30:00', 210, 3, 2),
('2023-15-06 14:00:00', 220, 3, 3),
('2023-16-06 10:30:00', 250, 3, 4),
('2023-17-06 11:45:00', 230, 3, 5),
('2023-17-06 15:15:00', 240, 3, 6),
-- Bids for 'Lunettes de soleil de designer'
('2023-10-06 10:00:00', 160, 4, 1),
('2023-11-06 14:45:00', 180, 4, 2),
('2023-12-06 09:30:00', 200, 4, 3),
('2023-13-06 11:00:00', 170, 4, 4),
('2023-14-06 13:30:00', 190, 4, 5),
-- Bids for 'Vinyles vintage'
('2023-01-06 15:45:00', 110, 5, 4),
('2023-02-06 12:30:00', 120, 5, 5),
('2023-03-06 14:00:00', 130, 5, 6),
('2023-04-06 10:15:00', 115, 5, 7),
('2023-05-06 09:45:00', 140, 5, 8),
-- Bids for 'Appareil photo numérique'
('2023-05-06 12:00:00', 280, 6, 5),
('2023-06-06 09:30:00', 300, 6, 6),
('2023-07-06 14:45:00', 320, 6, 7),
('2023-08-06 10:30:00', 290, 6, 8),
-- Bids for 'Chaussures de course'
('2023-25-05 11:30:00', 80, 7, 2),
('2023-25-05 12:45:00', 90, 7, 3),
('2023-26-05 09:15:00', 100, 7, 4),
('2023-27-05 14:30:00', 85, 7, 5),
('2023-28-05 10:00:00', 110, 7, 6),
-- Bids for 'Sac à dos de randonnée'
('2023-20-05 13:00:00', 140, 8, 1),
('2023-21-05 11:15:00', 150, 8, 2),
('2023-22-05 14:30:00', 160, 8, 3),
('2023-23-05 09:45:00', 135, 8, 4),
('2023-24-05 12:30:00', 570, 8, 5),
-- Bids for 'Ordinateur portable'
('2023-08-06 15:30:00', 700, 9, 3),
('2023-09-06 11:45:00', 750, 9, 4),
('2023-10-06 13:00:00', 800, 9, 5),
('2023-11-06 09:15:00', 720, 9, 6),
('2023-12-06 12:30:00', 770, 9, 7),
-- Bids for 'Montre-bracelet en acier inoxydable'
('2023-30-05 14:45:00', 320, 10, 2),
('2023-31-05 10:00:00', 350, 10, 3),
('2023-01-06 11:15:00', 380, 10, 4),
('2023-02-06 15:30:00', 330, 10, 5),
('2023-03-06 09:45:00', 360, 10, 6),
('2023-06-05 10:30:00', 500, 11, 3),
('2023-07-05 14:45:00', 520, 11, 4),
('2023-08-05 11:30:00', 540, 11, 5),
('2023-09-05 09:15:00', 510, 11, 6),
('2023-10-05 12:00:00', 530, 11, 7),
-- Bids for 'Lampadaire design'
('2023-21-05 13:00:00', 170, 12, 1),
('2023-22-05 11:15:00', 190, 12, 2),
('2023-23-05 14:30:00', 200, 12, 3),
('2023-24-05 09:45:00', 180, 12, 4),
('2023-25-05 12:30:00', 210, 12, 5),
-- Bids for 'Chemise en coton pour homme'
('2023-06-05 15:30:00', 60, 13, 2),
('2023-07-05 11:45:00', 65, 13, 3),
('2023-08-05 13:00:00', 70, 13, 4),
('2023-09-05 09:15:00', 62, 13, 5),
('2023-10-05 12:30:00', 68, 13, 6),
-- Bids for 'Robe d'été fleurie'
('2023-19-05 14:45:00', 90, 14, 3),
('2023-20-05 10:00:00', 95, 14, 4),
('2023-21-05 11:15:00', 100, 14, 5),
('2023-22-05 15:30:00', 92, 14, 6),
('2023-23-05 09:45:00', 98, 14, 7),
-- Bids for 'Tapis de yoga antidérapant'
('2023-09-05 13:00:00', 40, 15, 1),
('2023-10-05 11:15:00', 45, 15, 2),
('2023-11-05 14:30:00', 50, 15, 3),
('2023-12-05 09:45:00', 42, 15, 4),
('2023-13-05 12:30:00', 48, 15, 5),
-- Bids for 'Sac à dos de randonnée'
('2023-24-05 13:00:00', 120, 16, 2),
('2023-25-05 11:15:00', 130, 16, 3),
('2023-26-05 14:30:00', 140, 16, 4),
('2023-27-05 09:45:00', 115, 16, 5),
('2023-28-05 12:30:00', 150, 16, 6),
-- Bids for 'Ordinateur portable HP'
('2023-01-06 15:30:00', 900, 17, 2),
('2023-02-06 11:45:00', 950, 17, 3),
('2023-03-06 13:00:00', 1000, 17, 4),
('2023-04-06 09:15:00', 920, 17, 5),
('2023-05-06 12:30:00', 970, 17, 6),
-- Bids for 'Montre-bracelet en acier inoxydable'
('2023-28-05 14:45:00', 400, 18, 3),
('2023-29-05 10:00:00', 430, 18, 4),
('2023-30-05 11:15:00', 460, 18, 5),
('2023-31-05 15:30:00', 410, 18, 6),
('2023-01-06 09:45:00', 440, 18, 7);



select * from SOLD_ITEMS