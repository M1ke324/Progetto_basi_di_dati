USE `FilmSphere`;

DROP PROCEDURE IF EXISTS GestisciConnessioniCDN;


DELIMITER //

CREATE PROCEDURE GestisciConnessioniCDN()
BEGIN
    DECLARE idCliente VARCHAR(320);
    DECLARE idCDNAttuale INT;
    DECLARE distanzaAttuale INT;
    DECLARE numConnessioni INT;
    DECLARE connessioneIndex INT;
    DECLARE cdnID INT;
    DECLARE cdnDistanza INT;
    DECLARE cdnAccettazione BOOLEAN;

    -- Ottenere il numero totale di connessioni al CDN
    SELECT COUNT(*) INTO numConnessioni FROM `Connessioni_cdn` WHERE `Trasmissione_in_uso` <> 0;

    -- Inizializzazione indici
    SET connessioneIndex = 0;

    -- Loop sulle connessioni
    WHILE connessioneIndex < numConnessioni DO
        -- Incrementa l'indice delle connessioni

        -- Ottieni il cliente e il CDN corrispondente
        SELECT `Cliente`, `Server`
        INTO idCliente, idCDNAttuale
        FROM `Connessioni_cdn`
        WHERE `Trasmissione_in_uso` <> 0
        LIMIT 1
        OFFSET connessioneIndex;

        -- Ottieni la distanza tra l'utente e SERVER CDN
        SELECT `Distanza`
        INTO distanzaAttuale
        FROM `Distanza`
        WHERE `ServerCDN` = idCDNAttuale
        AND `Regione_geografica` = (SELECT `situa` FROM `Cliente` WHERE `e-mail` = idCliente);


        SELECT D.`ServerCDN`, D.`Distanza`, S.`Stato_di-accettazione`
        INTO cdnID, cdnDistanza, cdnAccettazione
        FROM `Distanza` D JOIN ServerCDN S ON D.ServerCDN=S.id 
        WHERE `Regione_geografica` = (SELECT `situa` FROM `Cliente` WHERE `e-mail` = idCliente)
        order by Distanza
        LIMIT 1;
        SELECT cdnID,cdnDistanza;

        -- Se c'è un CDN disponibile con una distanza minore
        IF cdnAccettazione AND cdnDistanza<distanzaAttuale THEN
            -- Aggiorna la connessione con il nuovo CDN
            UPDATE `Connessioni_cdn`
            SET `Server` = cdnID
            WHERE `Cliente` = idCliente AND Cliente<>'#############';
            /*
                Senza il secondo controllo palesemente e volutamente inutile il server dava errore
                con la modalità safe update, oltre questa soluzione ce ne era un altra. Questa:
                
                SET SQL_SAFE_UPDATES=0;
                UPDATE `Connessioni_cdn`
                SET `Server` = cdnID
                WHERE `Cliente` = idCliente AND Cliente<>'#############';
                SET SQL_SAFE_UPDATES=1;

                ma per sicurezza ho pensato di non disabilitare il safe update.
                Aggiungendo il secondo controllo, anche se inutile viene letto come una selezione sulla
                chiave primaria e il safe update non segnala errori

            */
            -- Aggiorna lo stato di accettazione del CDN precedente
            UPDATE `ServerCDN`
            SET `Stato_di-accettazione` = TRUE
            WHERE `id` = idCDNAttuale;
        END IF;
        SET connessioneIndex = connessioneIndex + 1;
    END WHILE;
END //

DELIMITER ;
