CREATE TABLE IF NOT EXISTS `Cliente` (
    `e-mail` VARCHAR(320) NOT NULL, --Lunghezza massima e-mail
    `Nome` VARCHAR(50) NOT NULL,
    `Cognome` VARCHAR(50) NOT NULL,
    `Data_di_nascita` DATE NOT NULL,
    `Password` VARCHAR(50) NOT NULL,
    `Critico` BOOLEAN DEFAULT FALSE,
    `situa` VARCHAR(2) NOT NULL,

    -- Chiavi
    PRIMARY KEY (`e-mail`),
    FOREIGN KEY (`situa`) REFERENCES `Regione_geografica`(`Nome`) ON UPDATE CASCADE ON DELETE CASCADE,
)
CREATE TABLE IF NOT EXISTS `Visualizzazioni`(
    `Cliente` VARCHAR(320) NOT NULL,
    `Film` /*TO DO*/,
    `Numero_visualizzazioni` TINYINT DEFAULT 1, --max 255

    --chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
) 

CREATE TABLE IF NOT EXISTS `Download`(
    `Cliente` VARCHAR(320) NOT NULL,
    `Film` /*TO DO*/,

    --chiavi
    PRIMARY KEY (`Cliente`,`Film`),
    FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`e-mail`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`Film`) REFERENCES `Film`(`id`) ON UPDATE CASCADE ON DELETE CASCADE,
)

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
)

CREATE TABLE IF NOT EXISTS `Abbonamenti` (
    `Tipologia` VARCHAR(8) NOT NULL,
    `Risoluzione_max` VARCHAR(15) NOT NULL,
    `Ore_max` SMALLINT, --NULL=illimitato
    `Gigabyte_download` TINYINT, --NULL=illimitato
    `Prezzo` FLOAT(4,2) DEFAULT 0.0 NOT NULL,

    --Chiavi
    PRIMARY KEY (`Tipologia`),
) 

CREATE TABLE IF NOT EXISTS `Fatturazione`(
    `Carta` DECIMAL (16,0) NOT NULL,
    `Abbonamenti` VARCHAR(8) NOT NULL,
    `Validità` /*TO DO*/,
    `Data_scadenza` DATE DEFAULT /*TO DO DATA ODIERNA*/,
    `Data_sottoscrizione` DATE DEFAULT /*TO DO DATA ODIERNA*/,

    --Chiavi
    PRIMARY KEY (`Carta`,`Abbonamenti`),
    FOREIGN KEY (`Carta`) REFERENCES `Carta`(`Numero`),
)

CREATE TABLE IF NOT EXISTS `Dispositivo`(
    `Marchio` VARCHAR(50) NOT NULL,
    `Modello` VARCHAR(50) NOT NULL,
    `Risoluzione` /*TO DO*/,
    `Rapporto_schermo` /*TO DO*/,

    --chaivi
    PRIMARY KEY (`Marchio`,`modello`),
)

CREATE TABLE IF NOT EXISTS `Log_connessioni`(
    `Cliente` /*TO DO*/,
    `Marchio_Dispositivo` /*TO DO*/,
    `Modello_Dispositivo` /*TO DO*/,
    `indirizzo_ip` /*TO DO*/,
    `idCDN`/*TO DO*/,
    `ora_data_fine_connessione` /*TO DO*/,
    `ora_data_inizio_connessione` /*TO DO*/,

    --Chiavi
    PRIMARY KEY (`Cliente`,`Marchio_Dispositivo`,`Modello_Dispositivo`),
    FOREIGN KEY (`Marchio_Dispositivo`) REFERENCES `Dispositivo`(`Marchio`),
    FOREIGN KEY (`Modello_Dispositivo`) REFERENCES `Dispositivo`(`Modello`),
    FOREIGN KEY (`idCDN`) REFERENCES `ServerCDN`(`id`),
) 

CREATE TABLE IF NOT EXISTS `Formati_Supportati`(
    `Marchio_Dispositivo` /*TO DO*/,
    `Modello_Dispositivo`/*TO DO*/,
    `Formati`/*TO DO*/,

    --Chiavi
    PRIMARY KEY (`Marchio_Dispositivo`,`Modello_Dispositivo`,`Formati`),
    FOREIGN KEY (`Marchio_Dispositivo`) REFERENCES `Dispositivo`(`marchio`),
    FOREIGN KEY (`Modello_Dispositivo`) REFERENCES `Dispositivo`(`modello`),
    FOREIGN KEY (`Formati`) REFERENCES `Formati`(`Nome`),

)