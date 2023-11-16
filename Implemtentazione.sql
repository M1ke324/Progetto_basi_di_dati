DROP DATABASE IF EXISTS `FilmSphere`;
CREATE DATABASE `FilmSphere` DEFAULT CHARACTER SET utf8;
USE `FilmSphere`;

-- ------------- --
-- AreaContenuti --
-- ------------- --
CREATE TABLE IF NOT EXISTS `Film` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `Anno_di_produzione` YEAR NOT NULL,
    `Descrizione` TEXT,
    `Rating_media` FLOAT,
    `Durata` DECIMAL(10,2) NOT NULL,
    `Titolo` TEXT NOT NULL,
    `Prodotto` CHAR(2),
    
    -- Chiavi
    PRIMARY KEY(`id`),
    CHECK (`Rating_media` BETWEEN 0.0 AND  10.0)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Recensioni_utenti` (
    `Cliente` VARCHAR(320),
    `Film`  INT,
    `Rating` FLOAT,
    `Descrizione` TEXT,

    --   Chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,

    --   Vincoli
    CHECK (`Rating` BETWEEN 0.00 AND  10.00)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Recensioni_critici` (
    `Cliente` VARCHAR(320),
    `Film`  INT,
    `Rating` FLOAT,
    `Descrizione` TEXT,

    --   Chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,

    --   Vincoli
    CHECK (`Rating` BETWEEN 0.00 AND  10.00)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Genere` (
    `Nome` VARCHAR(100),
    `Media` FLOAT,

    --   Chiavi
    PRIMARY KEY (`Nome`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Appartiene`(
    `Genere` VARCHAR(100),
    `Film` INT,

    --   Chiavi
    PRIMARY KEY (`Genere`,`Film`),
    FOREIGN KEY (`Genere`) REFERENCES `Genere`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Premi`(
    `Nome` VARCHAR(100),
    `importanza` FLOAT,

    --   Chiavi
    PRIMARY KEY (`Nome`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Premi_film`(
    `Premi` VARCHAR(100),
    `Film` INT,

    -- Chiavi
    PRIMARY KEY (`Premi`,`Film`),
    FOREIGN KEY (`Premi`) REFERENCES `Premi`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Registi_Attori` (
    `id` INT AUTO_INCREMENT,
    `Nome` VARCHAR(100) NOT NULL,
    `Cognome` VARCHAR (100) NOT NULL,
    `Data_di_nascita` DATE,

    -- Chiavi
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Registi`(
    `Registi` INT,
    `Rating` FLOAT,

    --  Chiavi
    PRIMARY KEY (`Registi`),
    FOREIGN KEY (`Registi`) REFERENCES `Registi_Attori`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,

    --  Vincoli
    CHECK (`Rating` BETWEEN 0.00 AND  10.00)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Attori` (
    `Attori` INT,
    `Rating` FLOAT,

    --  Chiavi
    PRIMARY KEY (`Attori`),
    FOREIGN KEY (`Attori`) REFERENCES `Registi_Attori`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,

    --  Vincoli
    CHECK (`Rating` BETWEEN 0.00 AND  10.00)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Premi_registi`(
    `Registi` INT,
    `Premi` VARCHAR(100),

    --  Chiavi
    PRIMARY KEY (`Registi`,`Premi`),
    FOREIGN KEY (`Registi`) REFERENCES `Registi`(`Registi`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Premi`) REFERENCES `Premi`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Premi_attori`(
    `Attori` INT,
    `Premi` VARCHAR(100),

    --  Chiavi
    PRIMARY KEY (`Attori`,`Premi`),
    FOREIGN KEY (`Attori`) REFERENCES `Attori`(`Attori`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Premi`) REFERENCES `Premi`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Direzione`(
    `Registi` INT,
    `Film` INT,

    --  Chiavi
    PRIMARY KEY (`Registi`,`Film`),
    FOREIGN KEY (`Registi`) REFERENCES `Registi_Attori`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Recitazione`(
    `Attori` INT,
    `Film` INT,

    --  Chiavi
    PRIMARY KEY (`Attori`,`Film`),
    FOREIGN KEY (`Attori`) REFERENCES `Registi_Attori`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Lingue` (
    `Nome` CHAR(3), --  ISO 639

    --  Chiavi
    PRIMARY KEY(`Nome`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Sottotitolati`(
    `Tracking` VARCHAR(260),
    `Lingua` CHAR(3),

    --  Chiavi
    PRIMARY KEY(`Tracking`,`Lingua`),
    FOREIGN KEY (`Lingua`) REFERENCES `Lingue`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Doppiati` (
    `Tracking` VARCHAR(260),
    `Lingua` CHAR(3),

    -- Chiavi
    PRIMARY KEY (`Tracking`,`Lingua`),
    FOREIGN KEY (`Lingua`) REFERENCES `Lingue`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- ------------- --
-- AreaStreaming --
-- ------------- --

CREATE TABLE IF NOT EXISTS `ServerCDN` (
    `id` INT AUTO_INCREMENT,
    `Larghezza_banda` INT NOT NULL,
    `Max_capacita_trasmissione` INT NOT NULL,
    `Stato_di-accettazione` BOOLEAN DEFAULT TRUE,
    `Detiene` CHAR(2) NOT NULL,
    `Posizione` POINT,

    -- Chiavi
    PRIMARY KEY (`id`),

    -- Vincoli di dominio
    CHECK (`Max_capacita_trasmissione` > 0),
    CHECK (`Larghezza_banda` > 0.0),
    CHECK (ST_X(`Posizione`) BETWEEN -180.00 AND 180.00), -- Contollo longitudine
    CHECK (ST_Y(`Posizione`) BETWEEN -90.00 AND 90.00) -- Controllo latitudine
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Connessioni_cdn` (
    `Server` INT,
    `Cliente` VARCHAR(320),
    `Trasmissione_in_uso` INT DEFAULT 0,
    `Larghezza_banda` INT DEFAULT 0,
    `id_film` INT NOT NULL,
    
    -- Chiavi
    PRIMARY KEY (`Server`,`Cliente`),
    FOREIGN KEY (`Server`) REFERENCES `ServerCDN`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Regione_geografica` (
    `Nome` CHAR(2) NOT NULL,-- ISO 31166-1 ALPHA-2
    PRIMARY KEY (`Nome`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Distanza` (
    -- Associazione tra Paese e Server
    `ServerCDN` INT NOT NULL,
    `Regione_geografica` CHAR(2) NOT NULL,
    `Distanza` INT DEFAULT 0,

    -- Chiavi
    PRIMARY KEY (`ServerCDN`,`Regione_geografica`),
    FOREIGN KEY (`Regione_geografica`) REFERENCES `Regione_geografica`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`ServerCDN`) REFERENCES `ServerCDN`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,

    -- Vincoli
    CHECK (`Distanza` BETWEEN 0.0 AND 40075.0)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- ------------ --
-- Area Formati --
-- ------------ --

CREATE TABLE IF NOT EXISTS `Formati`(
    `Nome` VARCHAR(4) PRIMARY KEY -- Estenzioni
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Audio`(
    `Nome` VARCHAR(4),
    `Qualita` VARCHAR(10) NOT NULL,

    -- Chiavi
    PRIMARY KEY(`Nome`),
    FOREIGN KEY (`Nome`) REFERENCES `Formati`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Video` (
    `Nome` VARCHAR(4),
    `Qualita` VARCHAR(20) NOT NULL,
    `Bitrate` VARCHAR(20) NOT NULL,
    `Rapporto_aspetto` VARCHAR(10) NOT NULL,
    `Risoluzione` VARCHAR(10) NOT NULL,

    -- Chiavi
    PRIMARY KEY(`Nome`),
    FOREIGN KEY (`Nome`) REFERENCES `Formati`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Restrizioni`(
    `Film` INT,
    `Formato` VARCHAR(4),
    `Regione` VARCHAR(2),

    -- Chiavi
    PRIMARY KEY(`Film`,`Formato`,`Regione`),
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Formato`) REFERENCES `Formati`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Tracking` (
    `Path` VARCHAR(260), -- limite path per windows, per Unix/Linux è spesso superiore a 4000 caratteri
    `Lunghezza` FLOAT NOT NULL,
    `Data_rilascio` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `Formati` VARCHAR(4),
    `Film` INT,
    `Dimensione` FLOAT NOT NULL,

    -- Chiavi
    PRIMARY KEY(`Path`),
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Formati`) REFERENCES `Formati`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Formati_disponibili` (
    `Abbonamenti` VARCHAR(8),
    `Formati`  VARCHAR(4),

    -- Chiavi
    PRIMARY KEY (`Abbonamenti`,`Formati`),
    FOREIGN KEY (`Formati`) REFERENCES `Formati`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- ---------- --
-- AreaUtenti --
-- ---------- --

CREATE TABLE IF NOT EXISTS `Cliente` (
    `e-mail` VARCHAR(320) NOT NULL, -- Lunghezza massima e-mail
    `Nome` VARCHAR(50) NOT NULL,
    `Cognome` VARCHAR(50) NOT NULL,
    `Data_di_nascita` DATE NOT NULL,
    `Password` VARCHAR(50) NOT NULL,
    `Critico` BOOLEAN DEFAULT FALSE,
    `situa` CHAR(2) NOT NULL,

    -- Chiavi
    PRIMARY KEY (`e-mail`),
    FOREIGN KEY (`situa`) REFERENCES `Regione_geografica`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,

    -- Vincoli
    CHECK (`e-mail` LIKE '%_@__%.__%')
    -- Controlla che contenga almeno un carattere prima e dopo il sombbolo '@' seguito da un punto 
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Visualizzazioni`(
    `Cliente` VARCHAR(320),
    `Film` INT,
    `Numero_visualizzazioni` TINYINT DEFAULT 1, -- max 255

    -- chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Download`(
    `Cliente` VARCHAR(320),
    `Film` INT,

    -- chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Carta` (
    `Numero` DECIMAL (16,0) NOT NULL,
    `Anno_scadenza` YEAR  NOT NULL,
    `Mese_scadenza` DECIMAL (2,0) NOT NULL,
    `CVV` DECIMAL(3,0) NOT NULL,
    `Default` BOOLEAN DEFAULT FALSE,
    `Cliente` VARCHAR(320) NOT NULL,

    -- chiavi
    PRIMARY KEY (`Numero`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,

    -- Vincoli
    CHECK (`Mese_scadenza`<13  AND `Mese_scadenza`>0)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Abbonamenti` (
    `Tipologia` VARCHAR(8) NOT NULL,
    `Risoluzione_max` VARCHAR(15), -- NULL=tutte
    `Ore_max` SMALLINT, -- NULL=illimitato
    `Gigabyte_download` TINYINT, -- NULL=illimitato
    `Prezzo` FLOAT(4,2) DEFAULT 0.0 NOT NULL,

    -- Chiavi
    PRIMARY KEY (`Tipologia`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Fatturazione`(
    `Carta` DECIMAL (16,0) NOT NULL,
    `Abbonamenti` VARCHAR(8) NOT NULL,
    `Validità` BOOLEAN DEFAULT TRUE,
    `Data_scadenza` DATE NOT NULL,
    `Data_sottoscrizione` DATE /*TO DO DEFAULT CURRENT_DATE*/,

    -- Chiavi
    PRIMARY KEY (`Carta`,`Abbonamenti`,`Data_sottoscrizione`),
    FOREIGN KEY (`Carta`) REFERENCES `Carta`(`Numero`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Abbonamenti`) REFERENCES `Abbonamenti`(`Tipologia`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Dispositivo`(
    `Marchio` VARCHAR(50),
    `Modello` VARCHAR(50),
    `Risoluzione` VARCHAR(20) NOT NULL,
    `Rapporto_schermo` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`Marchio`,`Modello`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Log_connessioni`(
    `Marchio_Dispositivo` VARCHAR(50),
    `Modello_Dispositivo` VARCHAR(50),
    `Cliente` VARCHAR(320),
    `idCDN` INT,
    `indirizzo_ip` INT UNSIGNED,
    `ora_data_inizio_connessione` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `ora_data_fine_connessione` DATETIME,

    -- Chiavi
    PRIMARY KEY (`Marchio_Dispositivo`,`Modello_Dispositivo`,`Cliente`,`ora_data_inizio_connessione`),
    FOREIGN KEY (`Marchio_Dispositivo`,`Modello_Dispositivo`) REFERENCES `Dispositivo`(`Marchio`,`Modello`) ON UPDATE CASCADE ON DELETE CASCADE
    -- FOREIGN KEY (`idCDN`) REFERENCES `ServerCDN`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Formati_Supportati`(
    `Marchio_Dispositivo` VARCHAR(50),
    `Modello_Dispositivo`VARCHAR(50),
    `Formati` VARCHAR(4),

    -- Chiavi
    PRIMARY KEY (`Marchio_Dispositivo`,`Modello_Dispositivo`,`Formati`),
    FOREIGN KEY (`Marchio_Dispositivo`,`Modello_Dispositivo`) REFERENCES `Dispositivo`(`Marchio`,`Modello`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Formati`) REFERENCES `Formati`(`Nome`)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -------------- --
-- Chiavi esterne --
-- -------------- --
ALTER TABLE `Film`
ADD FOREIGN KEY (`Prodotto`) REFERENCES `Regione_geografica`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `Recensioni_utenti`
ADD FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `Recensioni_critici`
ADD FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `Sottotitolati`
ADD FOREIGN KEY (`Tracking`) REFERENCES `Tracking`(`Path`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `Doppiati`
ADD FOREIGN KEY (`Tracking`) REFERENCES `Tracking`(`Path`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `ServerCDN`
ADD FOREIGN KEY (`Detiene`) REFERENCES `Regione_geografica`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `Connessioni_cdn`
ADD FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `Restrizioni`
ADD FOREIGN KEY (`Regione`) REFERENCES `Regione_geografica`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `Formati_disponibili`
ADD FOREIGN KEY (`Abbonamenti`) REFERENCES `Abbonamenti`(`Tipologia`) ON UPDATE CASCADE ON DELETE CASCADE;


-- ------- --
-- TRIGGER --
-- ------- --

DELIMITER //

CREATE TRIGGER before_insert_Log_connessioni
BEFORE INSERT ON `Log_connessioni` FOR EACH ROW
BEGIN
    DECLARE idExists INT;

    -- Controlla se l'idCDN esiste nella tabella ServerCDN
    SELECT COUNT(*) INTO idExists
    FROM `ServerCDN`
    WHERE `id` = NEW.idCDN;

    -- Se l'id non esiste, genera un errore
    IF idExists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'idCDN non presente in ServerCDN';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_Connessioni_cdn
BEFORE INSERT ON `Connessioni_cdn` FOR EACH ROW
BEGIN
    DECLARE idExists INT;

    -- Controlla se l'id_film esiste nella tabella Film
    SELECT COUNT(*) INTO idExists
    FROM `Film`
    WHERE `id` = NEW.id_film;

    -- Se l'id_film non esiste, genera un errore
    IF idExists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'id_film non presente in Film';
    END IF;
END //

DELIMITER ;