DROP DATABASE IF EXISTS `FilmSphere`;
CREATE DATABASE `FilmSphere` DEFAULT CHARACTER SET utf8;
USE 'FilmSphere';
CREATE TABLE IF NOT EXISTS `ServerCDN` (
    `id` INT AUTO_INCREMENT,
    `Larghezza_banda` INT NOT NULL,
    `Max_capacita_trasmissione` INT NOT NULL,
    `Stato_di-accettazione` BOOLEAN DEFAULT TRUE;
    `Detiene` CHAR(2) NOT NULL,
    `Posizione` POINT,

    --Chiavi
    PRIMARY KEY (`id`),
    FOREIGN KEY (`Detiene`) REFERENCES `Regione_geografica`(`Nome`),

    -- Vincoli di dominio
    CHECK (`Max_capacita_trasmissione` > 0),
    CHECK (`Larghezza_banda` > 0.0),
    CHECK (ST_X(`Posizione`) BETWEEN -180.00 AND 180.00), -- Contollo longitudine
    CHECK (ST_Y(`Posizione`) BETWEEN -90.00 AND 90.00), -- Controllo latitudine
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Connessioni_cdn` (
    `Server` INT,
    `Cliente` VARCHAR(320),
    `Trasmissione_in_uso` INT DEFAULT 0,
    `Larghezza_banda` INT DEFAULT 0,
    `id_film` INT NOT NULL,
    
    --Chiavi
    PRIMARY KEY (`Server`,`Cliente`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Server`) REFERENCES `ServerCDN`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Regione_geografica` (
    `Nome` CHAR(2) NOT NULL,--ISO 31166-1 ALPHA-2
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
    CHECK (`ValoreDistanza` BETWEEN 0.0 AND 40075.0)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;