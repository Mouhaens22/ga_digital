-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20230109.7cde53ed0d
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 01 nov. 2023 à 12:42
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ga_digital`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

CREATE TABLE `absence` (
  `Absence_ID` int(11) NOT NULL,
  `Étudiant_ID` int(11) DEFAULT NULL,
  `SeanceCours_ID` int(11) DEFAULT NULL,
  `MotifDeLabsence` varchar(255) DEFAULT NULL,
  `Commentaire` text DEFAULT NULL,
  `StatutDeLabsence` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `filière`
--

CREATE TABLE `filière` (
  `Filière_ID` int(11) NOT NULL,
  `NomDeLaFilière` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `Module_ID` int(11) NOT NULL,
  `NomDuModule` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Filière_ID` int(11) DEFAULT NULL,
  `Professeur_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `Professeur_ID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prénom` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Téléphone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `séancedecours`
--

CREATE TABLE `séancedecours` (
  `SeanceCours_ID` int(11) NOT NULL,
  `Module_ID` int(11) DEFAULT NULL,
  `DateDeDébut` date DEFAULT NULL,
  `DateDeFin` date DEFAULT NULL,
  `JourDeLaSemaine` varchar(10) DEFAULT NULL,
  `HeureDeDébut` time DEFAULT NULL,
  `HeureDeFin` time DEFAULT NULL,
  `SalleDeCours` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `étudiant`
--

CREATE TABLE `étudiant` (
  `Étudiant_ID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prénom` varchar(255) DEFAULT NULL,
  `DateDeNaissance` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Filière_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`Absence_ID`),
  ADD KEY `Étudiant_ID` (`Étudiant_ID`),
  ADD KEY `SeanceCours_ID` (`SeanceCours_ID`);

--
-- Index pour la table `filière`
--
ALTER TABLE `filière`
  ADD PRIMARY KEY (`Filière_ID`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`Module_ID`),
  ADD KEY `Filière_ID` (`Filière_ID`),
  ADD KEY `prof` (`Professeur_ID`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`Professeur_ID`);

--
-- Index pour la table `séancedecours`
--
ALTER TABLE `séancedecours`
  ADD PRIMARY KEY (`SeanceCours_ID`),
  ADD KEY `Module_ID` (`Module_ID`);

--
-- Index pour la table `étudiant`
--
ALTER TABLE `étudiant`
  ADD PRIMARY KEY (`Étudiant_ID`),
  ADD KEY `Filière_ID` (`Filière_ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absence`
--
ALTER TABLE `absence`
  MODIFY `Absence_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `filière`
--
ALTER TABLE `filière`
  MODIFY `Filière_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `Module_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `Professeur_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `séancedecours`
--
ALTER TABLE `séancedecours`
  MODIFY `SeanceCours_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `étudiant`
--
ALTER TABLE `étudiant`
  MODIFY `Étudiant_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`Étudiant_ID`) REFERENCES `étudiant` (`Étudiant_ID`),
  ADD CONSTRAINT `absence_ibfk_2` FOREIGN KEY (`SeanceCours_ID`) REFERENCES `séancedecours` (`SeanceCours_ID`);

--
-- Contraintes pour la table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`Filière_ID`) REFERENCES `filière` (`Filière_ID`),
  ADD CONSTRAINT `prof` FOREIGN KEY (`Professeur_ID`) REFERENCES `professeur` (`Professeur_ID`);

--
-- Contraintes pour la table `séancedecours`
--
ALTER TABLE `séancedecours`
  ADD CONSTRAINT `séancedecours_ibfk_1` FOREIGN KEY (`Module_ID`) REFERENCES `module` (`Module_ID`);

--
-- Contraintes pour la table `étudiant`
--
ALTER TABLE `étudiant`
  ADD CONSTRAINT `étudiant_ibfk_1` FOREIGN KEY (`Filière_ID`) REFERENCES `filière` (`Filière_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
