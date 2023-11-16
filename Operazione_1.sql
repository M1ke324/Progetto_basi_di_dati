USE `FilmSphere`;

DROP PROCEDURE IF EXISTS `CalcolaMedieRatingFilm`;

DELIMITER //

CREATE PROCEDURE `CalcolaMedieRatingFilm`(IN film_id INT)
BEGIN

    SET @nuovo_valore =0.0;
    SET @c = 0;
    -- Calcolo la media delle recensioni degli utenti
    SELECT AVG(Rating) INTO @Media_Recensioni_Utenti
    FROM Recensioni_utenti
    WHERE Film = film_id;
    
    IF @Media_Recensioni_Utenti IS NOT NULL THEN
        SET  @nuovo_valore =  @nuovo_valore + @Media_Recensioni_Utenti;
        SET  @c=@c+1;
    END IF;
    -- Calcolo la media delle recensioni dei critici e la aggiungo a [ @nuovo_valore]
    SELECT AVG(Rating) INTO @Media_Recensioni_Critici
    FROM Recensioni_critici
    WHERE Film = film_id;
    
    IF @Media_Recensioni_Critici IS NOT NULL THEN
        SET  @nuovo_valore =  @nuovo_valore + @Media_Recensioni_Critici;
        SET  @c=@c+1;
    END IF;
    -- Calcolo la media del rating dei registi e la aggiungo a [ @nuovo_valore]
    SELECT AVG(Rating) INTO @Media_Rating_Registi
    FROM Registi
    WHERE Registi IN (SELECT Registi
                      FROM Direzione
                      WHERE Film = film_id);
    IF @Media_Rating_Registi IS NOT NULL THEN
        SET  @nuovo_valore =  @nuovo_valore + @Media_Rating_Registi;
        SET  @c=@c+1;
    END IF;
    -- Calcolo la media del rating degli attori e la aggiungo a [ @nuovo_valore]
    SELECT AVG(Rating) INTO @Media_Rating_Attori
    FROM Attori
    WHERE Attori IN (SELECT Attori
                     FROM Recitazione
                     WHERE Film = film_id);
    IF @Media_Rating_Attori IS NOT NULL THEN
        SET  @nuovo_valore =  @nuovo_valore + @Media_Rating_Attori;
        SET  @c=@c+1;
    END IF;
    -- Calcola la media dell'importanza dei premi vinti dai registi del film
    SELECT AVG(p.importanza) INTO @Media_Importanza_Premi_Registi
    FROM Premi p
    JOIN Premi_registi pr ON p.Nome = pr.Premi
    JOIN Direzione d ON pr.Registi = d.Registi
    WHERE d.Film = film_id;
    
    IF @Media_Importanza_Premi_Registi IS NOT NULL THEN
        SET  @nuovo_valore =  @nuovo_valore + @Media_Importanza_Premi_Registi;
        SET  @c=@c+1;
    END IF;
    -- Calcolo la media dell'importanza dei premi degli attori e la aggiungo a [ @nuovo_valore]
    SELECT AVG(p.importanza) INTO @Media_Importanza_Premi_Attori
    FROM Premi p
    JOIN Premi_attori pa ON p.Nome = pa.Premi
    JOIN Recitazione r ON pa.Attori = r.Attori
    WHERE r.Film = film_id;
    
    IF @Media_Importanza_Premi_Attori IS NOT NULL THEN
        SET  @nuovo_valore =  @nuovo_valore + @Media_Importanza_Premi_Attori;
        SET  @c=@c+1;
    END IF;
    -- Calcolo la media dell'importanza dei premi del film e la aggiungo a [ @nuovo_valore]
    SELECT AVG(p.importanza) INTO @Media_Importanza_Premi_Film
    FROM Premi p
    JOIN Premi_film pf ON p.Nome = pf.Premi
    WHERE pf.Film = film_id;
    IF @Media_Importanza_Premi_Film IS NOT NULL THEN
        SET  @nuovo_valore =  @nuovo_valore + @Media_Importanza_Premi_Film;
        SET  @c=@c+1;
    END IF;
    -- Calcolo la media della media del genere dei generi del film e la aggiungo a [ @nuovo_valore]
    SELECT AVG(Media) INTO @Media_Genere
    FROM Genere
    WHERE Nome IN (SELECT Genere
                   FROM Appartiene
                   WHERE Film = film_id);
    IF @Media_Genere IS NOT NULL THEN
        SET  @nuovo_valore =  @nuovo_valore + @Media_Genere;
        SET  @c=@c+1;
    END IF;
    -- Scrivo il rating finale
    
    IF  @nuovo_valore <> 0.0 THEN
        UPDATE Film
        SET Rating_media = ( @nuovo_valore/@c)
        WHERE id = film_id;
    END IF;
END //

DELIMITER ;


DROP PROCEDURE IF EXISTS `RatingFilm`;

DELIMITER //

CREATE PROCEDURE `RatingFilm`()
BEGIN
    SELECT MAX(id) INTO @MAX_ID
    FROM Film;
    SET @contatore = 1;
    WHILE @contatore <= @MAX_ID DO
        CALL `FilmSphere`.`CalcolaMedieRatingFilm`(@contatore);    
        SET @contatore=@contatore+1;
    END WHILE;
END //
DELIMITER ;
