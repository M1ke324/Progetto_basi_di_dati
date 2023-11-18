USE `FilmSphere`;

DROP PROCEDURE IF EXISTS PrecaricaFilm;

DELIMITER //

CREATE PROCEDURE precaricaFilm(IN utente_email VARCHAR(320))    
BEGIN
    DECLARE idFilm INT;
    -- dichiarazioni cdnpiulibero
    DECLARE server_id INT;
    DECLARE rowCount INT;
    DECLARE O INT;
    DECLARE id_cdn INT;
    DECLARE banda_massima INT;
    DECLARE capacita_massima INT;
    DECLARE banda_corrente INT;
    DECLARE trasmissione_corrente INT;
    DECLARE banda_max INT;
    DECLARE Trasmissione_max INT;

    DELETE FROM Connessioni_cdn
    WHERE Cliente=utente_email and Cliente<>'###############'; 
    /*
         Senza il secondo controllo palesemente e volutamente inutile il server dava errore
         con la modalità safe update, oltre questa soluzione ce ne era un altra. Questa:
        
        SET SQL_SAFE_UPDATES=0;
        DELETE FROM Connessioni_cdn
        WHERE Cliente=utente_email;
        SET SQL_SAFE_UPDATES=1;

        ma per sicurezza ho pensato di non disabilitare il safe update.
        Aggiungendo il secondo controllo, anche se inutile viene letto come una selezione sulla
        chiave primaria e il safe update non segnala errori

        */

    SELECT Film
    INTO idFilm
    FROM Recensioni_utenti
    WHERE Cliente=utente_email
    ORDER BY Rating DESC
    LIMIT 1;

    IF idFilm IS NULL THEN
        SELECT Film
        INTO idFilm
        FROM Recensioni_critici
        WHERE Cliente=utente_email
        ORDER BY Rating DESC
        LIMIT 1;

        IF idFilm IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'L utente non ha mai specificato una preferenza';
        END IF;
    END IF;

    SELECT film
    INTO idFilm
    FROM Appartiene A JOIN Film F ON A.Film=F.id 
    WHERE Genere =(SELECT G.Nome
        FROM Appartiene A JOIN Genere G ON A.Genere=G.Nome
        WHERE Film= idFilm
        ORDER BY G.Media DESC
        LIMIT 1) and id <> idFilm
    ORDER BY F.Rating_media DESC
    LIMIT 1;

    -- cdnpiulibero
    SET banda_max=0;
    SET Trasmissione_max=0;
    SELECT COUNT(*) INTO rowCount FROM `ServerCDN`WHERE `Stato_di-accettazione`=TRUE;
    SET O =0;
-- Ciclo WHILE per iterare attraverso i server CDN con offset
    WHILE O < rowCount DO
        -- Seleziona un singolo server CDN con offset
        SELECT `id`, `Larghezza_banda`,`Max_capacita_trasmissione`
        INTO id_cdn, banda_massima, capacita_massima
        FROM `ServerCDN`
        WHERE `Stato_di-accettazione`=TRUE
        LIMIT 1 OFFSET O;

        -- Conta il numero attuale di connessioni al server CDN
        SELECT SUM(Larghezza_banda), SUM(Trasmissione_in_uso)
        INTO banda_corrente, trasmissione_corrente
        FROM `Connessioni_cdn`
        WHERE `Server` = id_cdn;
        SET banda_corrente= banda_massima -banda_corrente;
        SET trasmissione_corrente= capacita_massima -trasmissione_corrente;

        IF trasmissione_corrente > Trasmissione_max AND banda_corrente > banda_max  THEN
            SET server_id=id_cdn;
            SET Trasmissione_max=trasmissione_corrente;
            SET banda_max=banda_corrente;
        END IF;
        set O=O+1;
    END WHILE;

    IF idFilm IS NOT NULL AND server_id IS NOT NULL THEN
        INSERT INTO Connessioni_cdn (`Server`, Cliente, id_film, Larghezza_banda,Trasmissione_in_uso)
        VALUES (server_id, utente_email, idFilm , 0, 0);
    END IF;

    


END //
DELIMITER ;
