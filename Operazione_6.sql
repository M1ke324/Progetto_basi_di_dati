USE `FilmSphere`;

DROP PROCEDURE IF EXISTS AggiornaMediaVotiGenere;
DELIMITER //
CREATE PROCEDURE AggiornaMediaVotiGenere()
BEGIN
    -- Dichiarazione delle variabili
    DECLARE  nomeGenere VARCHAR(100);
    DECLARE  ratingGenere FLOAT;
    DECLARE  M INT;
    DECLARE  c INT;
    -- Inizializzazione della variabile di controllo
    SELECT COUNT(Nome) 
    INTO  M
    FROM Genere;
    SET  c= 0;
    -- Loop per iterare attraverso i generi
    WHILE  c <  M DO
        -- Recupero il nome del genere utilizzando LIMIT e OFFSET
        SET  nomeGenere = (SELECT Nome FROM Genere LIMIT 1 OFFSET  c);

        -- Calcolo della media dei voti per il genere
        SELECT AVG(Rating_media)
        INTO  ratingGenere
        FROM Film F JOIN Appartiene A ON F.id = A.Film
        WHERE A.Genere =  nomeGenere;

        -- Aggiornamento della media dei voti nella tabella Genere
        UPDATE Genere G
        SET Media =  ratingGenere
        WHERE Nome =  nomeGenere AND Nome<>'############';
        /*
         Senza il secondo controllo palesemente e volutamente inutile il server dava errore
         con la modalità safe update, oltre questa soluzione ce ne era un altra. Questa:
        
        SET SQL_SAFE_UPDATES=0;
        UPDATE Genere G
        SET Media =  ratingGenere
        WHERE Nome =  nomeGenere;
        SET SQL_SAFE_UPDATES=1;

        ma per sicurezza ho pensato di non disabilitare il safe update.
        Aggiungendo il secondo controllo, anche se inutile viene letto come una selezione sulla
        chiave primaria e il safe update non segnala errori

        */
        -- Decremento del contatore
        SET  c=  c+ 1;
    END WHILE;
END //

DELIMITER ;
