USE `FilmSphere`;

DROP PROCEDURE IF EXISTS AggiornaStatoAccettazioneCDN;

DELIMITER //

CREATE PROCEDURE AggiornaStatoAccettazioneCDN()
BEGIN
    DECLARE id_cdn INT;
    DECLARE capacita_massima INT;
    DECLARE banda_massima INT;
    DECLARE trasmissione_corrente INT;
    DECLARE banda_corrente INT;
    DECLARE rowCount INT;
    DECLARE O INT;
    SET rowCount=0;

    -- Ottieni il numero totale di CDN
    SELECT COUNT(*) INTO rowCount FROM `ServerCDN`;
    SET O =0;

    -- Ciclo WHILE per iterare attraverso i server CDN con offset
    WHILE O < rowCount DO
        -- Seleziona un singolo server CDN con offset
        SELECT `id`, `Larghezza_banda`,`Max_capacita_trasmissione`
        INTO id_cdn, banda_massima, capacita_massima
        FROM `ServerCDN`
        LIMIT 1 OFFSET O;

        -- Conta il numero attuale di connessioni al server CDN
        SELECT SUM(Larghezza_banda), SUM(Trasmissione_in_uso)
        INTO banda_corrente, trasmissione_corrente
        FROM `Connessioni_cdn`
        WHERE `Server` = id_cdn;
        
        -- Aggiorna Stato_di_accettazione a false se le connessioni attuali sono maggiori o uguali alla capacità massima
        IF trasmissione_corrente >= capacita_massima OR banda_corrente >= banda_massima THEN
            UPDATE `ServerCDN`
            SET `Stato_di-accettazione` = FALSE
            WHERE `id` = id_cdn;
        END IF;

        -- Incrementa l'O
        SET O = O + 1;
    END WHILE;
END //

DELIMITER ;
