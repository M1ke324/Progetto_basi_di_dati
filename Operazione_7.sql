USE `FilmSphere`;

DROP PROCEDURE IF EXISTS GuardaFilm;

DELIMITER //

CREATE PROCEDURE GuardaFilm(
    IN utente_email VARCHAR(320),
    IN film_id INT,
    IN dispositivo_modello VARCHAR(50),
    IN dispositivo_marchio VARCHAR(50)
)
BEGIN
    DECLARE abbonamento_tipo VARCHAR(8);
    DECLARE ore_guardate INT;
    DECLARE ore_max_abbonamento SMALLINT;
    DECLARE connessione_id INT;
    DECLARE server_id INT;
    DECLARE visualizzazioni_count INT;
    DECLARE rowCount INT;
    DECLARE O INT;
    DECLARE id_cdn INT;
    DECLARE banda_massima INT;
    DECLARE capacita_massima INT;
    DECLARE banda_corrente INT;
    DECLARE trasmissione_corrente INT;
    DECLARE banda_max INT;
    DECLARE Trasmissione_max INT;

    SET banda_max=0;
    SET Trasmissione_max=0;

    -- Ottieni il tipo di abbonamento dell'utente
    SELECT Abbonamenti
    INTO abbonamento_tipo
    FROM Fatturazione
    WHERE Carta IN (SELECT Numero FROM Carta  WHERE `Cliente` = utente_email AND `Default`= TRUE)
    ORDER BY Data_sottoscrizione DESC
    LIMIT 1;
    -- Ottieni il numero massimo di ore dall'abbonamento
    SELECT Ore_max INTO ore_max_abbonamento
    FROM Abbonamenti
    WHERE Tipologia = abbonamento_tipo;

    -- Ottieni il numero di ore già guardate dall'utente
    SELECT IFNULL(SUM(Durata), 0) INTO ore_guardate
    FROM Visualizzazioni  V JOIN Film F ON V.Film=F.id
    WHERE Cliente = utente_email;
    -- Verifica se il numero di ore guardate supera il limite dell'abbonamento
    /*IF ore_guardate > ore_max_abbonamento THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Limite di ore dell''abbonamento superato';
    END IF;
    */
    -- Cerca una connessione CDN disponibile per il film
    DELETE FROM Connessioni_cdn
    WHERE Cliente=utente_email and Cliente<>'###############'; 

    -- Se non ci sono connessioni disponibili, aggiungi una nuova connessione
    SELECT COUNT(*) INTO rowCount FROM `ServerCDN`;
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

        -- Aggiorna Stato_di_accettazione a false se le connessioni attuali sono maggiori o uguali alla capacità massima
        IF trasmissione_corrente > Trasmissione_max AND banda_corrente > banda_max  THEN
            SET server_id=id_cdn;
            SET Trasmissione_max=trasmissione_corrente;
            SET banda_max=banda_corrente;
        END IF;

        -- Incrementa l'O
        SET O = O + 1;
    END WHILE;

    INSERT INTO Connessioni_cdn (`Server`, Cliente, id_film, Larghezza_banda,Trasmissione_in_uso)
    VALUES (server_id, utente_email, film_id, 0,1);
    
    -- Aggiungi un record in Log_connessioni
    INSERT  INTO Log_connessioni (ora_data_inizio_connessione,Marchio_Dispositivo, Modello_Dispositivo, Cliente, idCDN,indirizzo_ip)
    VALUES (CURRENT_TIMESTAMP,dispositivo_marchio, dispositivo_modello, utente_email, server_id, NULL);

    -- Aggiungi o aggiorna il record di visualizzazione
    SELECT Numero_visualizzazioni INTO visualizzazioni_count
    FROM Visualizzazioni
    WHERE Cliente = utente_email AND Film = film_id;

    IF visualizzazioni_count IS NOT NULL THEN
        UPDATE Visualizzazioni
        SET Numero_visualizzazioni = Numero_visualizzazioni + 1
        WHERE Cliente = utente_email AND Film = film_id;
    ELSE
        INSERT INTO Visualizzazioni (Cliente, Film, Numero_visualizzazioni)
        VALUES (utente_email, film_id, 1);
    END IF;

END //

DELIMITER ;
