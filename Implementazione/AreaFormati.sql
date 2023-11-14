DROP DATABASE IF EXISTS `FilmSphere`;
CREATE DATABASE `FilmSphere` DEFAULT CHARACTER SET utf8;
USE 'FilmSphere';
CREATE TABLE IF NOT EXISTS `Formati`(
    `Nome` VARCHAR(4), --tipo file
    --chiavi
    PRIMARY KEY(`Nome`),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Audio`(
    `Nome` VARCHAR(4),
    `Qualita` VARCHAR(10) NOT NULL,

    --Chiavi
    PRIMARY KEY(`Nome`),
    FOREIGN KEY (`Nome`) REFERENCES `Formati`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Video` (
    `Nome` VARCHAR(4),
    `Qualita` VARCHAR(20) NOT NULL,
    `Bitrate` VARCHAR(20) NOT NULL,
    `Rapporto_aspetto` VARCHAR(10) NOT NULL,
    `Risoluzione` VARCHAR(10) NOT NULL,

    --chiavi
    PRIMARY KEY(`Nome`),
    FOREIGN KEY (`Nome`) REFERENCES `Formati`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Restrizioni`(
    `Film` INT,
    `Formato` VARCHAR(4),
    `Regione` VARCHAR(2),

    --Chiavi
    PRIMARY KEY(`Film`,`Formato`,`Regione`),
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Formato`) REFERENCES `Formati`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Regione`) REFERENCES `Regione`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Tracking` (
    `Path` VARCHAR(260) --limite path per windows, per Unix/Linux è spesso superiore a 4000 caratteri
    `Lunghezza` FLOAT NOT NULL,
    `Data_rilascio` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `Formati` VARCHAR(4),
    `Film` INT,
    `Dimensione` FLOAT,

    --Chiavi
    PRIMARY KEY(`Path`),
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Formati`) REFERENCES `Formato`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Formati_disponibili` (
    `Abbonamenti` VARCHAR(8),
    `Formati`  VARCHAR(4),

    --Chiavi
    PRIMARY KEY (`Abbonamenti`,`Formati`),
    FOREIGN KEY (`Abbonamenti`) REFERENCES `Abbonamenti`(`Tipologia`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Formati`) REFERENCES `Formato`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;