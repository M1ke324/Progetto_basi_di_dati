USE `FilmSphere`;


-- Analytics 1
CREATE VIEW  DispositiviPiuUtilizzati AS
SELECT Marchio_Dispositivo, Modello_Dispositivo, count(*) AS Connessioni
FROM Log_connessioni
GROUP BY Marchio_Dispositivo, Modello_Dispositivo
order by Connessioni DESC;

/*
    SELECT *
    FROM DispositiviPiuUtilizzati;
*/

-- Analytics 2
CREATE VIEW  dispositiviConnessiOggi AS
SELECT COUNT(*)
FROM Log_connessioni LC
WHERE YEAR( LC.ora_data_inizio_connessione ) = YEAR( CURRENT_TIMESTAMP -- Analytics 2)
AND MONTH( LC.ora_data_inizio_connessione ) = MONTH( CURRENT_TIMESTAMP )
AND DAY( LC.ora_data_inizio_connessione ) = DAY( CURRENT_TIMESTAMP )
/*
    SELECT *
    FROM dispositiviConnessiOggi;
*/

-- Analytics 3
CREATE VIEW  filmPiuVisti AS
SELECT F.id,F.Titolo,SUM(V.Numero_visualizzazioni) AS NumeroVisualizzazioni
FROM Visualizzazioni V JOIN Film F ON F.id=V.Film
GROUP BY F.id
ORDER BY NumeroVisualizzazioni DESC;
/*
    SELECT *
    FROM filmPiuVisti;
*/
-- Analytics 4
CREATE VIEW  clientiPiuConnessi AS
select Cliente, SUM(timestampdiff(minute, ora_data_inizio_connessione,ora_data_fine_connessione)) AS MinutiDiConnessione
FROM Log_connessioni 
GROUP BY Cliente
ORDER BY MinutiDiConnessione DESC;

/*
    SELECT * 
    FROM clientiPiuConnessi ;
*/

-- Analytics 4
CREATE VIEW  UtentiPerPaese AS
SELECT situa, COUNT(`e-mail`) AS NumeroUtenti 
FROM Cliente
GROUP BY situa 
ORDER BY NumeroUtenti DESC;

/*
    SELECT * 
    FROM UtentiPerPaese;
*/