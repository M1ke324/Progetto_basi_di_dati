DROP DATABASE IF EXISTS `FilmSphere`;
CREATE DATABASE `FilmSphere` DEFAULT CHARACTER SET utf8;
USE 'FilmSphere';
CREATE TABLE IF NOT EXISTS `Cliente` (
    `e-mail` VARCHAR(320) NOT NULL, --Lunghezza massima e-mail
    `Nome` VARCHAR(50) NOT NULL,
    `Cognome` VARCHAR(50) NOT NULL,
    `Data_di_nascita` DATE NOT NULL,
    `Password` VARCHAR(50) NOT NULL,
    `Critico` BOOLEAN DEFAULT FALSE,
    `situa` CHAR(2) NOT NULL,

    --Chiavi
    PRIMARY KEY (`e-mail`),
    FOREIGN KEY (`situa`) REFERENCES `Regione_geografica`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,

    --Vincoli
    CHECK (`e-mail` LIKE '%_@__%.__%')
    --Controlla che contenga almeno un carattere prima e dopo il sombbolo '@' seguito da un punto 
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `Visualizzazioni`(
    `Cliente` VARCHAR(320),
    `Film` INT,
    `Numero_visualizzazioni` TINYINT DEFAULT 1, --max 255

    --chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Download`(
    `Cliente` VARCHAR(320),
    `Film` INT,

    --chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Carta` (
    `Numero` DECIMAL (16,0) NOT NULL,
    `Anno_scadenza` YEAR  NOT NULL,
    `Mese_scadenza` DECIMAL (2,0) NOT NULL,
    `CVV` DECIMAL(3,0) NOT NULL,
    `Default` BOOLEAN DEFAULT FALSE,
    `Cliente` VARCHAR(320) NOT NULL,

    --chiavi
    PRIMARY KEY (`Cliente`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,

    --Vincoli
    CHECK (`Mese_scadenza`<13) AND (`Mese_scadenza`>0);
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Abbonamenti` (
    `Tipologia` VARCHAR(8) NOT NULL,
    `Risoluzione_max` VARCHAR(15) NOT NULL,
    `Ore_max` SMALLINT, --NULL=illimitato
    `Gigabyte_download` TINYINT, --NULL=illimitato
    `Prezzo` FLOAT(4,2) DEFAULT 0.0 NOT NULL,

    --Chiavi
    PRIMARY KEY (`Tipologia`),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Fatturazione`(
    `Carta` DECIMAL (16,0) NOT NULL,
    `Abbonamenti` VARCHAR(8) NOT NULL,
    `Validità` BOOLEAN DEFAULT TRUE,
    `Data_scadenza` DATE NOT NULL,
    `Data_sottoscrizione` DATE DEFAULT CURRENT_DATE,

    --Chiavi
    PRIMARY KEY (`Carta`,`Abbonamenti`),
    FOREIGN KEY (`Carta`) REFERENCES `Carta`(`Numero`),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Dispositivo`(
    `Marchio` VARCHAR(50) NOT NULL,
    `Modello` VARCHAR(50) NOT NULL,
    `Risoluzione` VARCHAR(20) NOT NULL,
    `Rapporto_schermo` VARCHAR(20) NOT NULL,

    --chaivi
    PRIMARY KEY (`Marchio`,`modello`),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Log_connessioni`(
    `Cliente` VARCHAR(320),
    `Marchio_Dispositivo` VARCHAR(50),
    `Modello_Dispositivo` VARCHAR(50),
    `idCDN`INT,
    `indirizzo_ip` BINARY(4),
    `ora_data_fine_connessione` DATETIME NOT NULL,
    `ora_data_inizio_connessione` DATETIME DEFAULT CURRENT_TIMESTAMP,

    --Chiavi
    PRIMARY KEY (`Cliente`,`Marchio_Dispositivo`,`Modello_Dispositivo`),
    FOREIGN KEY (`Marchio_Dispositivo`) REFERENCES `Dispositivo`(`Marchio`),
    FOREIGN KEY (`Modello_Dispositivo`) REFERENCES `Dispositivo`(`Modello`),
    FOREIGN KEY (`idCDN`) REFERENCES `ServerCDN`(`id`),
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Formati_Supportati`(
    `Marchio_Dispositivo` VARCHAR(50),
    `Modello_Dispositivo`VARCHAR(50),
    `Formati` VARCHAR(4),

    --Chiavi
    PRIMARY KEY (`Marchio_Dispositivo`,`Modello_Dispositivo`,`Formati`),
    FOREIGN KEY (`Marchio_Dispositivo`) REFERENCES `Dispositivo`(`marchio`),
    FOREIGN KEY (`Modello_Dispositivo`) REFERENCES `Dispositivo`(`modello`),
    FOREIGN KEY (`Formati`) REFERENCES `Formati`(`Nome`),

) ENGINE = InnoDB DEFAULT CHARSET=latin1;