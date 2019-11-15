-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 15 Novembre 2019 à 14:19
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `starshipneo_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `game_account`
--

CREATE TABLE `game_account` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_mail` varchar(100) NOT NULL,
  `account_pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_coord`
--

CREATE TABLE `game_coord` (
  `id` int(10) UNSIGNED NOT NULL,
  `coordx` smallint(5) NOT NULL,
  `coordy` smallint(5) NOT NULL,
  `coordz` smallint(5) NOT NULL,
  `sector_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_language`
--

CREATE TABLE `game_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_language_content`
--

CREATE TABLE `game_language_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `str_key` varchar(64) NOT NULL,
  `content` varchar(255) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_object`
--

CREATE TABLE `game_object` (
  `id` int(10) UNSIGNED NOT NULL,
  `weigth` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_object_type`
--

CREATE TABLE `game_object_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_sector`
--

CREATE TABLE `game_sector` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `circular` tinyint(1) UNSIGNED NOT NULL,
  `only2d` tinyint(1) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_ship`
--

CREATE TABLE `game_ship` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `article` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `shield_current` int(10) UNSIGNED NOT NULL,
  `shield_total` int(10) UNSIGNED NOT NULL,
  `hull_current` int(10) UNSIGNED NOT NULL,
  `hull_total` int(10) UNSIGNED NOT NULL,
  `bay_total` int(10) UNSIGNED NOT NULL,
  `coord_id` int(10) UNSIGNED NOT NULL,
  `state` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_ship_baycontent`
--

CREATE TABLE `game_ship_baycontent` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `ship_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_ship_type`
--

CREATE TABLE `game_ship_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_station`
--

CREATE TABLE `game_station` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `coord_id` int(10) UNSIGNED NOT NULL,
  `docking_options` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `game_station_type`
--

CREATE TABLE `game_station_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `game_account`
--
ALTER TABLE `game_account`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_coord`
--
ALTER TABLE `game_coord`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_language`
--
ALTER TABLE `game_language`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_language_content`
--
ALTER TABLE `game_language_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `str_key` (`str_key`);

--
-- Index pour la table `game_object`
--
ALTER TABLE `game_object`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Index pour la table `game_object_type`
--
ALTER TABLE `game_object_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_sector`
--
ALTER TABLE `game_sector`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_ship`
--
ALTER TABLE `game_ship`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `game_ship_baycontent`
--
ALTER TABLE `game_ship_baycontent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `ship_id` (`ship_id`);

--
-- Index pour la table `game_ship_type`
--
ALTER TABLE `game_ship_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_station`
--
ALTER TABLE `game_station`
  ADD PRIMARY KEY (`id`),
  ADD KEY `station_type` (`type_id`);

--
-- Index pour la table `game_station_type`
--
ALTER TABLE `game_station_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `game_account`
--
ALTER TABLE `game_account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_coord`
--
ALTER TABLE `game_coord`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_language`
--
ALTER TABLE `game_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_language_content`
--
ALTER TABLE `game_language_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_object`
--
ALTER TABLE `game_object`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_object_type`
--
ALTER TABLE `game_object_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_sector`
--
ALTER TABLE `game_sector`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_ship`
--
ALTER TABLE `game_ship`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_ship_baycontent`
--
ALTER TABLE `game_ship_baycontent`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_ship_type`
--
ALTER TABLE `game_ship_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_station`
--
ALTER TABLE `game_station`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `game_station_type`
--
ALTER TABLE `game_station_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
