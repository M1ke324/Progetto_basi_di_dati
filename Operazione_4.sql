USE `FilmSphere`;

DROP PROCEDURE IF EXISTS CdnPiuLibero;

DELIMITER //
CREATE PROCEDURE CdnPiuLibero()
BEGIN
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

        -- Aggiorna Stato_di_accettazione a false se le connessioni attuali sono maggiori o uguali alla capacità massima
        IF trasmissione_corrente > Trasmissione_max AND banda_corrente > banda_max  THEN
            SET server_id=id_cdn;
            SET Trasmissione_max=trasmissione_corrente;
            SET banda_max=banda_corrente;
        END IF;

        -- Incrementa l'O
        SET O = O + 1;
    END WHILE;

    SELECT server_id;
END //
DELIMITER ;