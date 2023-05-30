DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS own;
DROP TABLE IF EXISTS have_access;
DROP TABLE IF EXISTS Responses;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Questions;
DROP TABLE IF EXISTS Questionnaires;

CREATE TABLE Questionnaires (
   id_questionnaire INT,
   tally_id_questionnaire INT,
   name_questionnaire VARCHAR(100),
   date_creation_questionnaire DATE,
   PRIMARY KEY(id_questionnaire)
);

CREATE TABLE Questions (
   id_question INT,
   tally_id_question INT,
   label_question VARCHAR(1000),
   type_question VARCHAR(50),
   is_mandatory BOOLEAN,
   PRIMARY KEY(id_question)
);

CREATE TABLE Users (
   id_user INT,
   tally_id_user INT,
   firstname_user VARCHAR(50),
   lastname_user VARCHAR(50),
   is_admin BOOLEAN,
   PRIMARY KEY(id_user)
);

CREATE TABLE Responses (
   id_response INT,
   tally_id_responses INT,
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