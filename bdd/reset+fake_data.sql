use masterproject ; 

DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS own;
DROP TABLE IF EXISTS have_access;
DROP TABLE IF EXISTS Responses;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Questions;
DROP TABLE IF EXISTS Questionnaires;
DROP TABLE IF EXISTS Emails;

CREATE TABLE Questionnaires (
   id_questionnaire INT NOT NULL AUTO_INCREMENT,
   tally_id_questionnaire VARCHAR(6),
   name_questionnaire VARCHAR(100),
   date_creation_questionnaire DATE,
   PRIMARY KEY(id_questionnaire)
);

CREATE TABLE Questions (
   id_question INT NOT NULL AUTO_INCREMENT,
   tally_id_question VARCHAR(6),
   label_question VARCHAR(1000),
   type_question VARCHAR(50),
   is_mandatory BOOLEAN,
   PRIMARY KEY(id_question)
);

CREATE TABLE Users (
   id_user INT NOT NULL AUTO_INCREMENT,
   tally_id_user VARCHAR(6),
   firstname_user VARCHAR(50),
   lastname_user VARCHAR(50),
   email_user VARCHAR(100),
   phone_user VARCHAR(10),
   username_user VARCHAR(100),
   password_user VARCHAR(100),
   is_admin BOOLEAN,
   PRIMARY KEY(id_user)
);

CREATE TABLE Responses (
   id_response INT NOT NULL AUTO_INCREMENT,
   tally_id_responses VARCHAR(6),
   date_soumission DATE,
   id_user INT NOT NULL,
   id_questionnaire INT NOT NULL,
   PRIMARY KEY(id_response),
   FOREIGN KEY(id_user) REFERENCES Users(id_user),
   FOREIGN KEY(id_questionnaire) REFERENCES Questionnaires(id_questionnaire)
);

CREATE TABLE have_access (
   id_questionnaire INT,
   id_user INT,
   PRIMARY KEY(id_questionnaire, id_user),
   FOREIGN KEY(id_questionnaire) REFERENCES Questionnaires(id_questionnaire),
   FOREIGN KEY(id_user) REFERENCES Users(id_user)
);

CREATE TABLE own (
   id_questionnaire INT,
   id_question INT,
   PRIMARY KEY(id_questionnaire, id_question),
   FOREIGN KEY(id_questionnaire) REFERENCES Questionnaires(id_questionnaire),
   FOREIGN KEY(id_question) REFERENCES Questions(id_question)
);

CREATE TABLE results (
   id_question INT,
   id_response INT,
   results VARCHAR(100),
   PRIMARY KEY(id_question, id_response),
   FOREIGN KEY(id_question) REFERENCES Questions(id_question),
   FOREIGN KEY(id_response) REFERENCES Responses(id_response)
);

CREATE TABLE Emails (
   id_email INT NOT NULL AUTO_INCREMENT,
   email VARCHAR(100),
   PRIMARY KEY(id_email)
);

-- Contraintes d'unicité
ALTER TABLE Emails ADD CONSTRAINT unique_email UNIQUE (email);

-- Insertion des données de test
INSERT INTO Users (firstname_user, lastname_user, email_user, is_admin, username_user, password_user) VALUES ('admin', 'admin', 'myselfmindwork@gmail.com', 1, 'admin', '6a158d9847a80e99511b2a7866233e404b305fdb7c953a30deb65300a57a0655');
INSERT INTO Emails (email) VALUES ('myselfmindwork@gmail.com');

-- Insertion des questionnaires
INSERT INTO Questionnaires (tally_id_questionnaire, name_questionnaire, date_creation_questionnaire) VALUES ('mKelxz', 'My self, My mind, My work', '2023-06-23');

-- Insertion des questions
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('688P2P', 'Quel est ton niveau d''études ?', 'DROPDOWN', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('zxxdDa', 'Souhaites-tu répondre au sondage anonymement ?', 'MULTIPLE_CHOICE', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('rjjY6v', 'Quel est ton prénom ?', 'INPUT_TEXT', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('BzzeXN', 'Quel est ton nom ?', 'INPUT_TEXT', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('lbb4bV', 'Souhaites-tu être contacté(e) ?', 'MULTIPLE_CHOICE', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('LZZoKy', 'Ton adresse e-mail :', 'INPUT_EMAIL', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('0QQA89', 'Ton numéro de téléphone :', 'INPUT_PHONE_NUMBER', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('pbbzRy', 'Est-ce que je me sens écouté(e) par le personnel de l''école ?', 'RATING', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('5BBVDE', 'Est-ce que je me sens en confiance vis-à-vis du personnel de l''école ?', 'RATING', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('Gxxb4k', 'Est-ce que je me sens en sécurité au sein de l''établissement ?', 'RATING', 0); 
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('A779Xk', 'Je suis stressé(e) en étant à l''école ou en pensant à l''école.', 'LINEAR_SCALE', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('2EEoWV', 'Je subis de la pression venant de mes professeurs.', 'LINEAR_SCALE', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('jaazq4', 'L''école me provoque des maux de tête ou de ventre.', 'LINEAR_SCALE', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('VLLNra', 'Je me sens intégré(e) dans ma classe.', 'LINEAR_SCALE', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('2EEoQA', 'Mes camarades/professeurs me font me sentir inférieur/sans qualités.', 'LINEAR_SCALE', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('xXX6x9', 'Mes camarades/professeurs m''ont déjà jugé(e). Je me suis senti(e) ridiculisé(e)/rabaissé(e).', 'LINEAR_SCALE', 0);
INSERT INTO Questions (tally_id_question, label_question, type_question, is_mandatory) VALUES ('pbr4MB', 'Quelle est ta classe ?', 'DROPDOWN', 0);

-- Insertion des utilisateurs
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('3Uiob9', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('2BLeQg', 'Thomas', 'GENDRON', 'thomas.gendron@efrei.net', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('24Lj7h', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('fg7J45', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('46HGlo', 'Emma', 'THOMAS', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('4JHg7o', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('56g3FR', 'Adam', 'WILSON', 'adam.wilson@example.com', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('ghjDE3', 'Sophie', 'BELLAMY', 'sophie.bellamy@example.com', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('5JHg7o', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('8gHj98', 'Lucas', 'MARTIN', 'lucas.martin@example.com', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('9gHj98', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('7gHj98', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('hg67d6', 'Lea', 'ROUSSEAU', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('hj67d6', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('g6hGr5', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('g6h89d', 'Gabriel', 'LEFEBVRE', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('78f6Ds', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('hg6d4e', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('HJfB87', 'Louise', 'DUBOIS', 'louise.dubois@example.com', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('g5d12S', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('ka9l93', '', '', '', '', 0);
INSERT INTO Users (tally_id_user, firstname_user, lastname_user, email_user, phone_user, is_admin) VALUES ('9hGf3h', 'Arthur', 'GARNIER', 'arthur.garnier@example.com', '', 0);

-- Insertion des réponses
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('f95gsq', '2022-02-01', 2, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('dg62Ge', '2022-02-15', 3, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('g6d2Ge', '2022-03-01', 4, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('WX0GLp', '2022-03-15', 5, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('UwV1Kq', '2022-04-01', 6, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('dEGP38', '2022-04-15', 7, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('W4bTU6', '2022-05-01', 8, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('7Q1exF', '2022-05-15', 9, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('ZvE7ei', '2022-06-01', 10, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('Rfe68b', '2022-06-15', 11, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('yTq66f', '2023-01-01', 12, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('6NtCLE', '2023-01-15', 13, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('3AX1vF', '2023-02-01', 14, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('9EgPw2', '2023-02-15', 15, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('bC0xLu', '2023-03-01', 16, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('tT9hcs', '2023-03-15', 17, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('5pXYCy', '2023-04-01', 18, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('FhRhi8', '2023-04-15', 19, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('7DZahe', '2023-05-01', 20, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('k9QydG', '2023-05-15', 21, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('EjYBu2', '2023-06-01', 22, 1);
INSERT INTO Responses (tally_id_responses, date_soumission, id_user, id_questionnaire) VALUES ('sEkDH2', '2023-06-15', 23, 1);

-- Insertion des lien entre les questions et le questionnaire
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 1);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 2);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 3);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 4);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 5);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 6);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 7);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 8);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 9);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 10);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 11);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 12);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 13);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 14);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 15);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 16);
INSERT INTO own (id_questionnaire, id_question) VALUES (1, 17);

-- -- Insertion des valeurs des réponses
INSERT INTO results (id_question, id_response, results) VALUES (1, 1, '3e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 1, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 1, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 1, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 1, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 1, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 1, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 1, '3');
INSERT INTO results (id_question, id_response, results) VALUES (9, 1, '2');
INSERT INTO results (id_question, id_response, results) VALUES (10, 1, '2');
INSERT INTO results (id_question, id_response, results) VALUES (11, 1, '2');
INSERT INTO results (id_question, id_response, results) VALUES (12, 1, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 1, '2');
INSERT INTO results (id_question, id_response, results) VALUES (14, 1, '2');
INSERT INTO results (id_question, id_response, results) VALUES (15, 1, '1');
INSERT INTO results (id_question, id_response, results) VALUES (16, 1, '2');
INSERT INTO results (id_question, id_response, results) VALUES (17, 1, '3e 4');
INSERT INTO results (id_question, id_response, results) VALUES (1, 2, '5e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 2, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (3, 2, 'Thomas');
INSERT INTO results (id_question, id_response, results) VALUES (4, 2, 'GENDRON');
INSERT INTO results (id_question, id_response, results) VALUES (5, 2, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (6, 2, 'myselfmindwork@gmail.com');
INSERT INTO results (id_question, id_response, results) VALUES (7, 2, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 2, '5');
INSERT INTO results (id_question, id_response, results) VALUES (9, 2, '3');
INSERT INTO results (id_question, id_response, results) VALUES (10, 2, '4');
INSERT INTO results (id_question, id_response, results) VALUES (11, 2, '1');
INSERT INTO results (id_question, id_response, results) VALUES (12, 2, '1');
INSERT INTO results (id_question, id_response, results) VALUES (13, 2, '1');
INSERT INTO results (id_question, id_response, results) VALUES (14, 2, '3');
INSERT INTO results (id_question, id_response, results) VALUES (15, 2, '1');
INSERT INTO results (id_question, id_response, results) VALUES (16, 2, '1');
INSERT INTO results (id_question, id_response, results) VALUES (17, 2, '5e 2');
INSERT INTO results (id_question, id_response, results) VALUES (1, 3, '6e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 3, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 3, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 3, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 3, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 3, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 3, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 3, '4');
INSERT INTO results (id_question, id_response, results) VALUES (9, 3, '3');
INSERT INTO results (id_question, id_response, results) VALUES (10, 3, '3');
INSERT INTO results (id_question, id_response, results) VALUES (11, 3, '3');
INSERT INTO results (id_question, id_response, results) VALUES (12, 3, '3');
INSERT INTO results (id_question, id_response, results) VALUES (13, 3, '3');
INSERT INTO results (id_question, id_response, results) VALUES (14, 3, '3');
INSERT INTO results (id_question, id_response, results) VALUES (15, 3, '2');
INSERT INTO results (id_question, id_response, results) VALUES (16, 3, '3');
INSERT INTO results (id_question, id_response, results) VALUES (17, 3, '6e 1');
INSERT INTO results (id_question, id_response, results) VALUES (1, 4, '3e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 4, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 4, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 4, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 4, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 4, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 4, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 4, '2');
INSERT INTO results (id_question, id_response, results) VALUES (9, 4, '1');
INSERT INTO results (id_question, id_response, results) VALUES (10, 4, '2');
INSERT INTO results (id_question, id_response, results) VALUES (11, 4, '2');
INSERT INTO results (id_question, id_response, results) VALUES (12, 4, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 4, '2');
INSERT INTO results (id_question, id_response, results) VALUES (14, 4, '1');
INSERT INTO results (id_question, id_response, results) VALUES (15, 4, '2');
INSERT INTO results (id_question, id_response, results) VALUES (16, 4, '2');
INSERT INTO results (id_question, id_response, results) VALUES (17, 4, '3e 4');
INSERT INTO results (id_question, id_response, results) VALUES (1, 5, '4e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 5, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (3, 5, 'Emma');
INSERT INTO results (id_question, id_response, results) VALUES (4, 5, 'THOMAS');
INSERT INTO results (id_question, id_response, results) VALUES (5, 5, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (6, 5, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 5, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 5, '3');
INSERT INTO results (id_question, id_response, results) VALUES (9, 5, '4');
INSERT INTO results (id_question, id_response, results) VALUES (10, 5, '2');
INSERT INTO results (id_question, id_response, results) VALUES (11, 5, '2');
INSERT INTO results (id_question, id_response, results) VALUES (12, 5, '3');
INSERT INTO results (id_question, id_response, results) VALUES (13, 5, '3');
INSERT INTO results (id_question, id_response, results) VALUES (14, 5, '1');
INSERT INTO results (id_question, id_response, results) VALUES (15, 5, '3');
INSERT INTO results (id_question, id_response, results) VALUES (16, 5, '2');
INSERT INTO results (id_question, id_response, results) VALUES (17, 5, '4e 3');
INSERT INTO results (id_question, id_response, results) VALUES (1, 6, '5e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 6, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 6, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 6, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 6, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 6, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 6, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 6, '3');
INSERT INTO results (id_question, id_response, results) VALUES (9, 6, '3');
INSERT INTO results (id_question, id_response, results) VALUES (10, 6, '4');
INSERT INTO results (id_question, id_response, results) VALUES (11, 6, '2');
INSERT INTO results (id_question, id_response, results) VALUES (12, 6, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 6, '2');
INSERT INTO results (id_question, id_response, results) VALUES (14, 6, '2');
INSERT INTO results (id_question, id_response, results) VALUES (15, 6, '3');
INSERT INTO results (id_question, id_response, results) VALUES (16, 6, '1');
INSERT INTO results (id_question, id_response, results) VALUES (17, 6, '5e 2');
INSERT INTO results (id_question, id_response, results) VALUES (1, 7, '6e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 7, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (3, 7, 'Adam');
INSERT INTO results (id_question, id_response, results) VALUES (4, 7, 'WILSON');
INSERT INTO results (id_question, id_response, results) VALUES (5, 7, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (6, 7, 'adam.wilson@example.com');
INSERT INTO results (id_question, id_response, results) VALUES (7, 7, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 7, '4');
INSERT INTO results (id_question, id_response, results) VALUES (9, 7, '2');
INSERT INTO results (id_question, id_response, results) VALUES (10, 7, '4');
INSERT INTO results (id_question, id_response, results) VALUES (11, 7, '1');
INSERT INTO results (id_question, id_response, results) VALUES (12, 7, '1');
INSERT INTO results (id_question, id_response, results) VALUES (13, 7, '1');
INSERT INTO results (id_question, id_response, results) VALUES (14, 7, '2');
INSERT INTO results (id_question, id_response, results) VALUES (15, 7, '2');
INSERT INTO results (id_question, id_response, results) VALUES (16, 7, '2');
INSERT INTO results (id_question, id_response, results) VALUES (17, 7, '6e 1');
INSERT INTO results (id_question, id_response, results) VALUES (1, 8, '3e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 8, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (3, 8, 'Sophie');
INSERT INTO results (id_question, id_response, results) VALUES (4, 8, 'BELLAMY');
INSERT INTO results (id_question, id_response, results) VALUES (5, 8, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (6, 8, 'sophie.bellamy@example.com');
INSERT INTO results (id_question, id_response, results) VALUES (7, 8, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 8, '3');
INSERT INTO results (id_question, id_response, results) VALUES (9, 8, '2');
INSERT INTO results (id_question, id_response, results) VALUES (10, 8, '2');
INSERT INTO results (id_question, id_response, results) VALUES (11, 8, '3');
INSERT INTO results (id_question, id_response, results) VALUES (12, 8, '3');
INSERT INTO results (id_question, id_response, results) VALUES (13, 8, '3');
INSERT INTO results (id_question, id_response, results) VALUES (14, 8, '1');
INSERT INTO results (id_question, id_response, results) VALUES (15, 8, '3');
INSERT INTO results (id_question, id_response, results) VALUES (16, 8, '1');
INSERT INTO results (id_question, id_response, results) VALUES (17, 8, '3e 4');
INSERT INTO results (id_question, id_response, results) VALUES (1, 9, '4e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 9, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 9, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 9, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 9, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 9, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 9, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 9, '2');
INSERT INTO results (id_question, id_response, results) VALUES (9, 9, '3');
INSERT INTO results (id_question, id_response, results) VALUES (10, 9, '4');
INSERT INTO results (id_question, id_response, results) VALUES (11, 9, '1');
INSERT INTO results (id_question, id_response, results) VALUES (12, 9, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 9, '3');
INSERT INTO results (id_question, id_response, results) VALUES (14, 9, '1');
INSERT INTO results (id_question, id_response, results) VALUES (15, 9, '3');
INSERT INTO results (id_question, id_response, results) VALUES (16, 9, '4');
INSERT INTO results (id_question, id_response, results) VALUES (17, 9, '4e 3');
INSERT INTO results (id_question, id_response, results) VALUES (1, 10, '5e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 10, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (3, 10, 'Lucas');
INSERT INTO results (id_question, id_response, results) VALUES (4, 10, 'MARTIN');
INSERT INTO results (id_question, id_response, results) VALUES (5, 10, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (6, 10, 'lucas.martin@example.com');
INSERT INTO results (id_question, id_response, results) VALUES (7, 10, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 10, '2');
INSERT INTO results (id_question, id_response, results) VALUES (9, 10, '1');
INSERT INTO results (id_question, id_response, results) VALUES (10, 10, '2');
INSERT INTO results (id_question, id_response, results) VALUES (11, 10, '3');
INSERT INTO results (id_question, id_response, results) VALUES (12, 10, '1');
INSERT INTO results (id_question, id_response, results) VALUES (13, 10, '1');
INSERT INTO results (id_question, id_response, results) VALUES (14, 10, '3');
INSERT INTO results (id_question, id_response, results) VALUES (15, 10, '2');
INSERT INTO results (id_question, id_response, results) VALUES (16, 10, '1');
INSERT INTO results (id_question, id_response, results) VALUES (17, 10, '5e 2');
INSERT INTO results (id_question, id_response, results) VALUES (1, 11, '6e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 11, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 11, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 11, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 11, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 11, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 11, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 11, '4');
INSERT INTO results (id_question, id_response, results) VALUES (9, 11, '4');
INSERT INTO results (id_question, id_response, results) VALUES (10, 11, '3');
INSERT INTO results (id_question, id_response, results) VALUES (11, 11, '2');
INSERT INTO results (id_question, id_response, results) VALUES (12, 11, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 11, '2');
INSERT INTO results (id_question, id_response, results) VALUES (14, 11, '3');
INSERT INTO results (id_question, id_response, results) VALUES (15, 11, '1');
INSERT INTO results (id_question, id_response, results) VALUES (16, 11, '1');
INSERT INTO results (id_question, id_response, results) VALUES (17, 11, '6e 1');
INSERT INTO results (id_question, id_response, results) VALUES (1, 12, '3e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 12, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 12, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 12, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 12, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 12, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 12, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 12, '3');
INSERT INTO results (id_question, id_response, results) VALUES (9, 12, '2');
INSERT INTO results (id_question, id_response, results) VALUES (10, 12, '2');
INSERT INTO results (id_question, id_response, results) VALUES (11, 12, '3');
INSERT INTO results (id_question, id_response, results) VALUES (12, 12, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 12, '1');
INSERT INTO results (id_question, id_response, results) VALUES (14, 12, '1');
INSERT INTO results (id_question, id_response, results) VALUES (15, 12, '2');
INSERT INTO results (id_question, id_response, results) VALUES (16, 12, '3');
INSERT INTO results (id_question, id_response, results) VALUES (17, 12, '3e 4');
INSERT INTO results (id_question, id_response, results) VALUES (1, 13, '4e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 13, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (3, 13, 'Lea');
INSERT INTO results (id_question, id_response, results) VALUES (4, 13, 'ROUSSEAU');
INSERT INTO results (id_question, id_response, results) VALUES (5, 13, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (6, 13, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 13, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 13, '2');
INSERT INTO results (id_question, id_response, results) VALUES (9, 13, '3');
INSERT INTO results (id_question, id_response, results) VALUES (10, 13, '3');
INSERT INTO results (id_question, id_response, results) VALUES (11, 13, '2');
INSERT INTO results (id_question, id_response, results) VALUES (12, 13, '1');
INSERT INTO results (id_question, id_response, results) VALUES (13, 13, '2');
INSERT INTO results (id_question, id_response, results) VALUES (14, 13, '3');
INSERT INTO results (id_question, id_response, results) VALUES (15, 13, '1');
INSERT INTO results (id_question, id_response, results) VALUES (16, 13, '2');
INSERT INTO results (id_question, id_response, results) VALUES (17, 13, '4e 3');
INSERT INTO results (id_question, id_response, results) VALUES (1, 14, '5e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 14, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 14, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 14, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 14, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 14, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 14, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 14, '1');
INSERT INTO results (id_question, id_response, results) VALUES (9, 14, '1');
INSERT INTO results (id_question, id_response, results) VALUES (10, 14, '1');
INSERT INTO results (id_question, id_response, results) VALUES (11, 14, '1');
INSERT INTO results (id_question, id_response, results) VALUES (12, 14, '1');
INSERT INTO results (id_question, id_response, results) VALUES (13, 14, '1');
INSERT INTO results (id_question, id_response, results) VALUES (14, 14, '2');
INSERT INTO results (id_question, id_response, results) VALUES (15, 14, '3');
INSERT INTO results (id_question, id_response, results) VALUES (16, 14, '1');
INSERT INTO results (id_question, id_response, results) VALUES (17, 14, '5e 2');
INSERT INTO results (id_question, id_response, results) VALUES (1, 15, '6e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 15, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 15, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 15, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 15, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 15, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 15, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 15, '3');
INSERT INTO results (id_question, id_response, results) VALUES (9, 15, '4');
INSERT INTO results (id_question, id_response, results) VALUES (10, 15, '4');
INSERT INTO results (id_question, id_response, results) VALUES (11, 15, '2');
INSERT INTO results (id_question, id_response, results) VALUES (12, 15, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 15, '3');
INSERT INTO results (id_question, id_response, results) VALUES (14, 15, '3');
INSERT INTO results (id_question, id_response, results) VALUES (15, 15, '2');
INSERT INTO results (id_question, id_response, results) VALUES (16, 15, '3');
INSERT INTO results (id_question, id_response, results) VALUES (17, 15, '6e 1');
INSERT INTO results (id_question, id_response, results) VALUES (1, 16, '3e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 16, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (3, 16, 'Gabriel');
INSERT INTO results (id_question, id_response, results) VALUES (4, 16, 'LEFEBVRE');
INSERT INTO results (id_question, id_response, results) VALUES (5, 16, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (6, 16, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 16, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 16, '4');
INSERT INTO results (id_question, id_response, results) VALUES (9, 16, '2');
INSERT INTO results (id_question, id_response, results) VALUES (10, 16, '2');
INSERT INTO results (id_question, id_response, results) VALUES (11, 16, '1');
INSERT INTO results (id_question, id_response, results) VALUES (12, 16, '1');
INSERT INTO results (id_question, id_response, results) VALUES (13, 16, '1');
INSERT INTO results (id_question, id_response, results) VALUES (14, 16, '3');
INSERT INTO results (id_question, id_response, results) VALUES (15, 16, '2');
INSERT INTO results (id_question, id_response, results) VALUES (16, 16, '1');
INSERT INTO results (id_question, id_response, results) VALUES (17, 16, '3e 4');
INSERT INTO results (id_question, id_response, results) VALUES (1, 17, '4e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 17, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 17, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 17, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 17, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 17, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 17, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 17, '2');
INSERT INTO results (id_question, id_response, results) VALUES (9, 17, '2');
INSERT INTO results (id_question, id_response, results) VALUES (10, 17, '3');
INSERT INTO results (id_question, id_response, results) VALUES (11, 17, '1');
INSERT INTO results (id_question, id_response, results) VALUES (12, 17, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 17, '2');
INSERT INTO results (id_question, id_response, results) VALUES (14, 17, '1');
INSERT INTO results (id_question, id_response, results) VALUES (15, 17, '2');
INSERT INTO results (id_question, id_response, results) VALUES (16, 17, '4');
INSERT INTO results (id_question, id_response, results) VALUES (17, 17, '4e 3');
INSERT INTO results (id_question, id_response, results) VALUES (1, 18, '5e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 18, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 18, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 18, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 18, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 18, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 18, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 18, '3');
INSERT INTO results (id_question, id_response, results) VALUES (9, 18, '3');
INSERT INTO results (id_question, id_response, results) VALUES (10, 18, '4');
INSERT INTO results (id_question, id_response, results) VALUES (11, 18, '3');
INSERT INTO results (id_question, id_response, results) VALUES (12, 18, '1');
INSERT INTO results (id_question, id_response, results) VALUES (13, 18, '1');
INSERT INTO results (id_question, id_response, results) VALUES (14, 18, '2');
INSERT INTO results (id_question, id_response, results) VALUES (15, 18, '3');
INSERT INTO results (id_question, id_response, results) VALUES (16, 18, '2');
INSERT INTO results (id_question, id_response, results) VALUES (17, 18, '5e 2');
INSERT INTO results (id_question, id_response, results) VALUES (1, 19, '6e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 19, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (3, 19, 'Louise');
INSERT INTO results (id_question, id_response, results) VALUES (4, 19, 'DUBOIS');
INSERT INTO results (id_question, id_response, results) VALUES (5, 19, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (6, 19, 'louise.dubois@example.com');
INSERT INTO results (id_question, id_response, results) VALUES (7, 19, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 19, '4');
INSERT INTO results (id_question, id_response, results) VALUES (9, 19, '4');
INSERT INTO results (id_question, id_response, results) VALUES (10, 19, '4');
INSERT INTO results (id_question, id_response, results) VALUES (11, 19, '2');
INSERT INTO results (id_question, id_response, results) VALUES (12, 19, '3');
INSERT INTO results (id_question, id_response, results) VALUES (13, 19, '2');
INSERT INTO results (id_question, id_response, results) VALUES (14, 19, '1');
INSERT INTO results (id_question, id_response, results) VALUES (15, 19, '1');
INSERT INTO results (id_question, id_response, results) VALUES (16, 19, '3');
INSERT INTO results (id_question, id_response, results) VALUES (17, 19, '6e 1');
INSERT INTO results (id_question, id_response, results) VALUES (1, 20, '3e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 20, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 20, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 20, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 20, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 20, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 20, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 20, '1');
INSERT INTO results (id_question, id_response, results) VALUES (9, 20, '2');
INSERT INTO results (id_question, id_response, results) VALUES (10, 20, '2');
INSERT INTO results (id_question, id_response, results) VALUES (11, 20, '1');
INSERT INTO results (id_question, id_response, results) VALUES (12, 20, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 20, '3');
INSERT INTO results (id_question, id_response, results) VALUES (14, 20, '1');
INSERT INTO results (id_question, id_response, results) VALUES (15, 20, '3');
INSERT INTO results (id_question, id_response, results) VALUES (16, 20, '3');
INSERT INTO results (id_question, id_response, results) VALUES (17, 20, '3e 4');
INSERT INTO results (id_question, id_response, results) VALUES (1, 21, '4e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 21, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (3, 21, '');
INSERT INTO results (id_question, id_response, results) VALUES (4, 21, '');
INSERT INTO results (id_question, id_response, results) VALUES (5, 21, '');
INSERT INTO results (id_question, id_response, results) VALUES (6, 21, '');
INSERT INTO results (id_question, id_response, results) VALUES (7, 21, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 21, '3');
INSERT INTO results (id_question, id_response, results) VALUES (9, 21, '2');
INSERT INTO results (id_question, id_response, results) VALUES (10, 21, '3');
INSERT INTO results (id_question, id_response, results) VALUES (11, 21, '2');
INSERT INTO results (id_question, id_response, results) VALUES (12, 21, '2');
INSERT INTO results (id_question, id_response, results) VALUES (13, 21, '3');
INSERT INTO results (id_question, id_response, results) VALUES (14, 21, '2');
INSERT INTO results (id_question, id_response, results) VALUES (15, 21, '3');
INSERT INTO results (id_question, id_response, results) VALUES (16, 21, '4');
INSERT INTO results (id_question, id_response, results) VALUES (17, 21, '4e 3');
INSERT INTO results (id_question, id_response, results) VALUES (1, 22, '5e');
INSERT INTO results (id_question, id_response, results) VALUES (2, 22, 'Non');
INSERT INTO results (id_question, id_response, results) VALUES (3, 22, 'Arthur');
INSERT INTO results (id_question, id_response, results) VALUES (4, 22, 'GARNIER');
INSERT INTO results (id_question, id_response, results) VALUES (5, 22, 'Oui');
INSERT INTO results (id_question, id_response, results) VALUES (6, 22, 'arthur.garnier@example.com');
INSERT INTO results (id_question, id_response, results) VALUES (7, 22, '');
INSERT INTO results (id_question, id_response, results) VALUES (8, 22, '2');
INSERT INTO results (id_question, id_response, results) VALUES (9, 22, '3');
INSERT INTO results (id_question, id_response, results) VALUES (10, 22, '2');
INSERT INTO results (id_question, id_response, results) VALUES (11, 22, '1');
INSERT INTO results (id_question, id_response, results) VALUES (12, 22, '1');
INSERT INTO results (id_question, id_response, results) VALUES (13, 22, '1');
INSERT INTO results (id_question, id_response, results) VALUES (14, 22, '3');
INSERT INTO results (id_question, id_response, results) VALUES (15, 22, '2');
INSERT INTO results (id_question, id_response, results) VALUES (16, 22, '1');
INSERT INTO results (id_question, id_response, results) VALUES (17, 22, '5e 2');