-- Création de la base de données
CREATE DATABASE ga_digital;

-- Utilisation de la base de données
USE ga_digital;

-- Création de la table Professeur
CREATE TABLE Professeur (
    Professeur_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255),
    Prénom VARCHAR(255),
    Email VARCHAR(255),
    Téléphone VARCHAR(15),
    -- Ajoutez d'autres attributs pertinents ici
);

-- Création de la table Module
CREATE TABLE Module (
    Module_ID INT AUTO_INCREMENT PRIMARY KEY,
    NomDuModule VARCHAR(255),
    Description TEXT,
    Filière_ID INT,
    -- Ajoutez d'autres attributs pertinents ici
);

-- Création de la table Filière
CREATE TABLE Filière (
    Filière_ID INT AUTO_INCREMENT PRIMARY KEY,
    NomDeLaFilière VARCHAR(255),
    Description TEXT,
    -- Ajoutez d'autres attributs pertinents ici
);

-- Création de la table Étudiant
CREATE TABLE Étudiant (
    Étudiant_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255),
    Prénom VARCHAR(255),
    DateDeNaissance DATE,
    Email VARCHAR(255),
    Filière_ID INT,
    -- Ajoutez d'autres attributs pertinents ici
);

-- Création de la table Séance de Cours
CREATE TABLE SéanceDeCours (
    SeanceCours_ID INT AUTO_INCREMENT PRIMARY KEY,
    Module_ID INT,
    Professeur_ID INT,
    DateDeDébut DATE,
    DateDeFin DATE,
    JourDeLaSemaine VARCHAR(10),
    HeureDeDébut TIME,
    HeureDeFin TIME,
    SalleDeCours VARCHAR(255),
    -- Ajoutez d'autres attributs pertinents ici
);

-- Création de la table Absence
CREATE TABLE Absence (
    Absence_ID INT AUTO_INCREMENT PRIMARY KEY,
    Étudiant_ID INT,
    SeanceCours_ID INT,
    MotifDeLabsence VARCHAR(255),
    Commentaire TEXT,
    StatutDeLabsence VARCHAR(20),
    -- Ajoutez d'autres attributs pertinents ici
);

-- Création de la table Enseigne
CREATE TABLE Enseigne (
    Enseigne_ID INT AUTO_INCREMENT PRIMARY KEY,
    Professeur_ID INT,
    Module_ID INT,
    -- Ajoutez d'autres attributs pertinents ici
);




-- Définition des clés étrangères pour les tables
ALTER TABLE Module
ADD FOREIGN KEY (Filière_ID) REFERENCES Filière(Filière_ID);

ALTER TABLE Étudiant
ADD FOREIGN KEY (Filière_ID) REFERENCES Filière(Filière_ID);

ALTER TABLE SéanceDeCours
ADD FOREIGN KEY (Module_ID) REFERENCES Module(Module_ID);

ALTER TABLE SéanceDeCours
ADD FOREIGN KEY (Professeur_ID) REFERENCES Professeur(Professeur_ID);

ALTER TABLE Absence
ADD FOREIGN KEY (Étudiant_ID) REFERENCES Étudiant(Étudiant_ID);

ALTER TABLE Absence
ADD FOREIGN KEY (SeanceCours_ID) REFERENCES SéanceDeCours(SeanceCours_ID);

ALTER TABLE Enseigne
ADD FOREIGN KEY (Professeur_ID) REFERENCES Professeur(Professeur_ID);

ALTER TABLE Enseigne
ADD FOREIGN KEY (Module_ID) REFERENCES Module(Module_ID);
