DROP DATABASE IF EXISTS `FilmSphere`;
CREATE DATABASE `FilmSphere` DEFAULT CHARACTER SET utf8;
USE 'FilmSphere';
CREATE TABLE IF NOT EXISTS `Film` (
    `id` INT AUTO_INCREMENT,
    `Anno_di_produzione` YEAR NOT NULL,
    `Descrizione` TEXT,
    `Rating_media` DECIMAL(4,2),
    `Durata` DECIMAL(10,2) NOT NULL,
    `Titolo` TEXT NOT NULL,
    `Prodotto` CHAR(2),

    --Chiavi
    PRIMARY KEY(`id`),
    FOREIGN KEY (`Prodotto`) REFERENCES `Regione_geografica`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,

    --Vincoli
    CHECK (`Rating_media` BETWEEN 0.00 AND 10.00),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Recensioni_utenti` (
    `Cliente` VARCHAR(320),
    `Film`  INT,
    `Rating` DECIMAL(4,2),
    `Descrizione` TEXT,

    --Chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,

    --Vincoli
    CHECK (`Rating` BETWEEN 0.00 AND 10.00),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Recensioni_critici` (
    `Cliente` VARCHAR(320),
    `Film`  INT,
    `Rating` DECIMAL(4,2),
    `Descrizione` TEXT,

    --Chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,

    --Vincoli
    CHECK (`Rating` BETWEEN 0.00 AND 10.00),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Genere` (
    `Nome` VARCHAR(100),
    `Media` DECIMAL(4,2),

    --Chiavi
    PRIMARY KEY (`Nome`),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Appartiene`(
    `Genere` VARCHAR(100),
    `Film` INT,

    --Chiavi
    PRIMARY KEY (`Genere`,`Film`),
    FOREIGN KEY (`Genere`) REFERENCES `Genere`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Premi`(
    `Nome` VARCHAR(100),
    `importanza` DECIMAL (4,2),

    --Chiavi
    PRIMARY KEY (`Nome`),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Premi_film`(
    `Premi` VARCHAR(100),
    `Film` INT,

    --Chiavi
    PRIMARY KEY (`Premi`,`Film`),
    FOREIGN KEY (`Premi`) REFERENCES `Premi`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Registi_Attori` (
    `id` INT AUTO_INCREMENT,
    `Nome` VARCHAR(100) NOT NULL,
    `Cognome` VARCHAR (100) NOT NULL,
    `Data_di_nascita` DATE,

    --Chiavi
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Registi`(
    `Registi` INT,
    `Rating` DECIMAL(4,2),

    --Chiavi
    PRIMARY KEY (`Registi`),
    FOREIGN KEY (`Registi`) REFERENCES `Registi_Attori`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,

    --Vincoli
    CHECK (`Rating` BETWEEN 0.00 AND 10.00),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Attori` (
    `Attori` INT,
    `Rating` DECIMAL(4,2),

    --Chiavi
    PRIMARY KEY (`Attori`),
    FOREIGN KEY (`Attori`) REFERENCES `Registi_Attori`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,

    --Vincoli
    CHECK (`Rating` BETWEEN 0.00 AND 10.00),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Premi_registi`(
    `Registi` INT,
    `Premi` VARCHAR(100),

    --Chiavi
    PRIMARY KEY (`Registi`,`Premi`),
    FOREIGN KEY (`Registi`) REFERENCES `Registi_Attori`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Premi`) REFERENCES `Premi`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Premi_attori`(
    `Attori` INT,
    `Premi` VARCHAR(100),

    --Chiavi
    PRIMARY KEY (`Attori`,`Premi`),
    FOREIGN KEY (`Attori`) REFERENCES `Registi_Attori`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Premi`) REFERENCES `Premi`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Direzione`(
    `Registi` INT,
    `Film` INT,

    --Chiavi
    PRIMARY KEY (`Registi`,`Film`),
    FOREIGN KEY (`Registi`) REFERENCES `Registi`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Recitazione`(
    `Attori` INT,
    `Film` INT,

    --Chiavi
    PRIMARY KEY (`Attori`,`Film`),
    FOREIGN KEY (`Attori`) REFERENCES `Attori`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Lingue` (
    `Nome` CHAR(3), --ISO 639

    --Chiavi
    PRIMARY KEY(`Nome`),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Sottotitolati`(
    `Tracking` VARCHAR(260),
    `Lingua` CHAR(3),

    --Chiavi
    PRIMARY KEY(`Tracking`,`Lingua`),
    FOREIGN KEY (`Lingua`) REFERENCES `Lingua`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Tracking`) REFERENCES `Tracking`(`Path`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Doppiati`(
    `Tracking` VARCHAR(260),
    `Lingua` CHAR(3),

    --Chiavi
    PRIMARY KEY(`Tracking`,`Lingua`),
    FOREIGN KEY (`Lingua`) REFERENCES `Lingua`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Tracking`) REFERENCES `Tracking`(`Path`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;