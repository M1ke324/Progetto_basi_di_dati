USE `FilmSphere`;

DROP PROCEDURE IF EXISTS `AggiungiCartaCredito`;

DELIMITER //

CREATE PROCEDURE `AggiungiCartaCredito`(
    IN p_email_utente VARCHAR(320),
    IN p_numero_carta DECIMAL(16,0),
    IN p_anno_scadenza YEAR,
    IN p_mese_scadenza DECIMAL(2,0),
    IN p_cvv DECIMAL(3,0)
)
BEGIN
    DECLARE numero_carta_esistente INT;

    -- Verifica se l'utente esiste
    SELECT COUNT(*) INTO numero_carta_esistente
    FROM `Cliente`
    WHERE `e-mail` = p_email_utente;

    IF numero_carta_esistente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L utente non esiste.';
    ELSE
        -- Imposta tutte le carte esistenti dell'utente come non predefinite
        UPDATE `Carta`
        SET `Default` = FALSE
        WHERE `Cliente` = p_email_utente AND Cliente<>'#############';
        /*
         Senza il secondo controllo palesemente e volutamente inutile il server dava errore
         con la modalità safe update, oltre questa soluzione ce ne era un altra. Questa:
        
        SET SQL_SAFE_UPDATES=0;
        UPDATE `Carta`
        SET `Default` = FALSE
        WHERE `Cliente` = p_email_utente AND Cliente<>'#############';
        SET SQL_SAFE_UPDATES=1;

        ma per sicurezza ho pensato di non disabilitare il safe update.
        Aggiungendo il secondo controllo, anche se inutile viene letto come una selezione sulla
        chiave primaria e il safe update non segnala errori

        */
        -- Inserisce la nuova carta di credito come predefinita
        INSERT INTO `Carta` (`Numero`, `Anno_scadenza`, `Mese_scadenza`, `CVV`, `Default`, `Cliente`)
        VALUES (p_numero_carta, p_anno_scadenza, p_mese_scadenza, p_cvv, TRUE, p_email_utente);
    END IF;
END //

DELIMITER ;
