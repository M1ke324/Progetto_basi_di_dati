USE `FilmSphere`;

DROP PROCEDURE IF EXISTS AggiornaAbbonamentiScaduti;
DELIMITER //

CREATE PROCEDURE AggiornaAbbonamentiScaduti()
BEGIN
    -- Trova gli abbonamenti scaduti
    UPDATE Fatturazione
    SET Validità = FALSE
    WHERE Data_scadenza = CURDATE() AND Validità = TRUE AND Carta<> 0 ;

    /*
        Senza il secondo controllo palesemente e volutamente inutile il server dava errore
        con la modalità safe update, oltre questa soluzione ce ne era un altra. Questa:
        
        SET SQL_SAFE_UPDATES=0;
        UPDATE Fatturazione
        SET Validità = FALSE
        WHERE Data_scadenza = CURDATE() AND Validità = TRUE;
        SET SQL_SAFE_UPDATES=1;

        ma per sicurezza ho pensato di non disabilitare il safe update.
        Aggiungendo il secondo controllo, anche se inutile viene letto come una selezione sulla
        chiave primaria e il safe update non segnala errori

    */



    /*
        qui si posso aggiungere le funzioni bancarie per prelevare i soldi dalle carte
    */

    -- Crea nuovi record con la stessa carta e abbonamento per gli utenti che avevano un abbonamento scaduto
    INSERT INTO Fatturazione (Carta, Abbonamenti, Validità, Data_scadenza, Data_sottoscrizione)
    SELECT f.Carta, f.Abbonamenti, TRUE, DATE_ADD(CURDATE(), INTERVAL 1 MONTH), CURDATE()
    FROM Fatturazione f
    WHERE f.Validità = FALSE
    AND NOT EXISTS (
        SELECT 1
        FROM Fatturazione f2
        WHERE f.Carta = f2.Carta
        AND f.Abbonamenti = f2.Abbonamenti
        AND f2.Validità = TRUE
    );
END //

DELIMITER ;
