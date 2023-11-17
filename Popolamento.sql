USE `FilmSphere`;

-- Inserimento dati nella tabella Regione_geografica
INSERT INTO `Regione_geografica` (`Nome`) VALUES
    ('IT'), -- Italia
    ('US'), -- Stati Uniti
    ('ES'), -- Spagna
    ('FR'), -- Francia
    ('DE'), -- Germania
    ('UK'); -- Regno Unito

-- Inserimento dati nella tabella Cliente
INSERT INTO `Cliente` (`e-mail`, `Nome`, `Cognome`, `Data_di_nascita`, `Password`, `Critico`, `situa`) VALUES
    ('cliente1@example.com', 'Mario', 'Rossi', '1990-01-15', 'password123', FALSE, 'IT'),
    ('cliente2@example.com', 'Anna', 'Bianchi', '1985-05-22', 'securepass', TRUE, 'US'),
    ('cliente3@example.com', 'Luigi', 'Verdi', '1998-09-10', 'strongpassword', FALSE, 'ES'),
    ('cliente4@example.com', 'Giovanna', 'Ferrari', '1982-03-28', 'p4ssw0rd', TRUE, 'FR'),
    ('cliente5@example.com', 'Roberto', 'Russo', '1995-12-03', 'securepwd123', FALSE, 'DE'),
    ('cliente6@example.com', 'Laura', 'Conti', '1989-07-17', 'laurapass', TRUE, 'UK'),
    ('cliente7@example.com', 'Marco', 'Marchetti', '1993-10-08', 'marcopwd', FALSE, 'IT'),
    ('cliente8@example.com', 'Sara', 'Moretti', '1987-06-12', 'sarapassword', TRUE, 'ES'),
    ('cliente9@example.com', 'Andrea', 'Amato', '1996-04-25', 'andreapass', FALSE, 'DE'),
    ('cliente10@example.com', 'Elena', 'Esposito', '1980-09-30', 'elenapwd', TRUE, 'FR'),
    ('cliente11@example.com', 'Paolo', 'Poli', '1991-02-18', 'paolopass', FALSE, 'UK'),
    ('cliente12@example.com', 'Simona', 'Santoro', '1983-08-05', 'simonapassword', TRUE, 'IT'),
    ('cliente13@example.com', 'Antonio', 'Avella', '1994-06-20', 'antoniopass', FALSE, 'US'),
    ('cliente14@example.com', 'Cristina', 'Coppola', '1986-12-15', 'cristinapwd', TRUE, 'ES'),
    ('cliente15@example.com', 'Davide', 'De Luca', '1984-04-02', 'davidepass', FALSE, 'DE');

-- Inserimento dati nella tabella Film
INSERT INTO `Film` (`Anno_di_produzione`, `Descrizione`, `Rating_media`, `Durata`, `Titolo`, `Prodotto`) VALUES
    (2020, 'Un film emozionante', 8.5, 120.5, 'Il segreto del successo', 'IT'),
    (2018, 'Una commedia divertente', 7.2, 95.0, 'Ridi e sorridi', 'US'),
    (2019, 'Un thriller avvincente', 9.0, 135.5, 'Nel buio della notte', 'ES'),
    (2021, 'Dramma familiare toccante', 8.8, 110.0, 'Ritorno a casa', 'FR'),
    (2017, 'Azione mozzafiato', 7.7, 118.0, 'Fuga adrenalinica', 'DE'),
    (2016, 'Fantasy epico', 9.2, 150.5, 'Il regno perduto', 'UK'),
    (2022, 'Commedia romantica', 6.5, 105.0, 'Amore a prima vista', 'IT'),
    (2015, 'Sci-fi avventuroso', 8.0, 122.5, 'Viaggio interstellare', 'ES'),
    (2018, 'Mistero investigativo', 7.9, 128.0, 'Il caso enigmatico', 'DE'),
    (2019, 'Thriller psicologico', 8.7, 140.0, 'Oltre il limite', 'FR'),
    (2017, 'Animazione emozionante', 8.6, 95.0, 'Il viaggio fantastico', 'UK'),
    (2020, 'Commedia d avventura', 7.3, 112.5, 'Risate in vacanza', 'IT'),
    (2016, 'Dramma storico', 9.5, 160.0, 'Epopea del passato', 'US'),
    (2021, 'Azione e mistero', 7.8, 130.5, 'Codice segreto', 'ES'),
    (2018, 'Fantascienza intrigante', 8.3, 135.0, 'L era del futuro', 'DE');

-- Inserimento dati nella tabella Recensioni_critici
INSERT INTO `Recensioni_critici` (`Cliente`, `Film`, `Rating`, `Descrizione`) VALUES
    ('cliente2@example.com', 1, 8.0, 'Molto interessante'),
    ('cliente4@example.com', 3, 9.5, 'Suspense ben gestito'),
    ('cliente6@example.com', 6, 8.7, 'Trama avvincente'),
    ('cliente8@example.com', 8, 7.8, 'Buona interpretazione degli attori'),
    ('cliente10@example.com', 10, 8.5, 'Psicologico e coinvolgente'),
    ('cliente12@example.com', 12, 7.2, 'Divertente e leggero'),
    ('cliente14@example.com', 14, 9.0, 'Fantascienza intrigante');

-- Inserimento dati nella tabella Recensioni_utenti
INSERT INTO `Recensioni_utenti` (`Cliente`, `Film`, `Rating`, `Descrizione`) VALUES
    ('cliente1@example.com', 2, 7.5, 'Divertente e leggero'),
    ('cliente3@example.com', 4, 8.8, 'Davvero emozionante'),
    ('cliente5@example.com', 5, 7.0, 'Azione mozzafiato'),
    ('cliente7@example.com', 7, 6.5, 'Romantico e commovente'),
    ('cliente9@example.com', 9, 8.2, 'Mistero avvincente'),
    ('cliente11@example.com', 11, 7.9, 'Fantasia ben realizzata'),
    ('cliente13@example.com', 13, 8.5, 'Azione e avventura'),
    ('cliente15@example.com', 15, 7.0, 'Fantascienza intrigante');

-- Inserimento dati nella tabella Registi_Attori
INSERT INTO `Registi_Attori` (`Nome`, `Cognome`, `Data_di_nascita`) VALUES
    ('Christopher', 'Nolan', '1970-07-30'),
    ('Quentin', 'Tarantino', '1963-03-27'),
    ('Martin', 'Scorsese', '1942-11-17'),
    ('Steven', 'Spielberg', '1946-12-18'),
    ('Kathryn', 'Bigelow', '1951-11-27'),
    ('Greta', 'Gerwig', '1983-08-04'),
    ('Alfonso', 'Cuarón', '1961-11-28'),
    ('Bong', 'Joon-ho', '1969-09-14'),
    ('Sofia', 'Coppola', '1971-05-14'),
    ('Denis', 'Villeneuve', '1967-10-03'),
    ('Brad', 'Pitt', '1963-12-18'),
    ('Leonardo', 'DiCaprio', '1974-11-11'),
    ('Cate', 'Blanchett', '1969-05-14'),
    ('Tom', 'Hanks', '1956-07-09'),
    ('Emma', 'Stone', '1988-11-06');

-- Inserimento dati nella tabella Registi
INSERT INTO `Registi` (`Registi`, `Rating`) VALUES
    (1, 9.0),  -- Christopher Nolan
    (2, 8.5),  -- Quentin Tarantino
    (3, 8.7),  -- Martin Scorsese
    (4, 9.2),  -- Steven Spielberg
    (5, 8.8);  -- Kathryn Bigelow

-- Inserimento dati nella tabella Attori
INSERT INTO `Attori` (`Attori`, `Rating`) VALUES
    (6, 8.5),  -- Greta Gerwig
    (7, 8.3),  -- Alfonso Cuarón
    (8, 9.0),  -- Bong Joon-ho
    (9, 8.2),  -- Sofia Coppola
    (10, 8.9); -- Denis Villeneuve

-- Inserimento dati nella tabella Direzione
INSERT INTO `Direzione` (`Registi`, `Film`) VALUES
    (1, 1),  -- Christopher Nolan ha diretto "Il segreto del successo"
    (2, 2),  -- Quentin Tarantino ha diretto "Ridi e sorridi"
    (3, 3),  -- Martin Scorsese ha diretto "Nel buio della notte"
    (4, 6),  -- Steven Spielberg ha diretto "Il regno perduto"
    (5, 9);  -- Kathryn Bigelow ha diretto "Oltre il limite"

-- Inserimento dati nella tabella Recitazione
INSERT INTO `Recitazione` (`Attori`, `Film`) VALUES
    (6, 2),   -- Greta Gerwig ha recitato in "Ridi e sorridi"
    (7, 4),   -- Alfonso Cuarón ha recitato in "Il regno perduto"
    (8, 11),  -- Bong Joon-ho ha recitato in "Fantascienza intrigante"
    (9, 10),  -- Sofia Coppola ha recitato in "Psicologico e coinvolgente"
    (10, 13); -- Denis Villeneuve ha recitato in "Il caso enigmatico"

-- Inserimento dati nella tabella Premi
INSERT INTO `Premi` (`Nome`, `importanza`) VALUES
    ('Oscar', 9.5),
    ('Golden Globe', 8.8),
    ('BAFTA', 8.7),
    ('Cannes Film Festival', 8.9),
    ('Venice Film Festival', 8.6);

-- Inserimento dati nella tabella Premi_registi
INSERT INTO `Premi_registi` (`Registi`, `Premi`) VALUES
    (1, 'Oscar'),   -- Christopher Nolan ha vinto un Oscar
    (2, 'Golden Globe'),   -- Quentin Tarantino ha vinto un Golden Globe
    (3, 'BAFTA'),   -- Martin Scorsese ha vinto un BAFTA
    (4, 'Cannes Film Festival'),   -- Steven Spielberg ha vinto a Cannes
    (5, 'Venice Film Festival');  -- Kathryn Bigelow ha vinto a Venezia

-- Inserimento dati nella tabella Film Premi_attori
INSERT INTO `Premi_attori` (`Attori`, `Premi`) VALUES
    (6, 'Oscar'),   -- Greta Gerwig ha vinto un Oscar
    (7, 'Golden Globe'),   -- Alfonso Cuarón ha vinto un Golden Globe
    (8, 'BAFTA'),   -- Bong Joon-ho ha vinto un BAFTA
    (9, 'Cannes Film Festival'),   -- Sofia Coppola ha vinto a Cannes
    (10, 'Venice Film Festival');  -- Denis Villeneuve ha vinto a Venezia

-- Associazione di alcuni film con premi nella tabella Premi_film
INSERT INTO `Premi_film` (`Film`, `Premi`) VALUES
    (1, 'Oscar'),   -- "Il segreto del successo" ha vinto un Oscar
    (3, 'Golden Globe'),   -- "Nel buio della notte" ha vinto un Golden Globe
    (6, 'BAFTA'),   -- "Il regno perduto" ha vinto un BAFTA
    (9, 'Cannes Film Festival'),   -- "Oltre il limite" ha vinto a Cannes
    (10, 'Venice Film Festival');  -- "Psicologico e coinvolgente" ha vinto a Venezia

-- Inserimento dati nella tabella Genere
INSERT INTO `Genere` (`Nome`, `Media`) VALUES
    ('Azione', 8.5),
    ('Commedia', 6.7),
    ('Fantasy', 9.8),
    ('Drammatico', 8.5),
    ('Sci-fi', 6.4),
    ('Thriller', 3.2),
    ('Animazione', 4.2),
    ('Fantascienza', 9.2);

-- Inserimento dati nella tabella Appartiene
INSERT INTO `Appartiene` (`Genere`, `Film`) VALUES
    ('Azione', 1),   -- "Il segreto del successo" è azione
    ('Commedia', 2),  -- "Ridi e sorridi" è commedia
    ('Fantasy', 3),   -- "Nel buio della notte" è fantasy
    ('Drammatico', 4), -- "Ritorno a casa" è drammatico
    ('Azione', 5),    -- "Fuga adrenalinica" è azione
    ('Fantasy', 6),   -- "Il regno perduto" è fantasy
    ('Commedia', 7),  -- "Amore a prima vista" è commedia
    ('Sci-fi', 8),    -- "Viaggio interstellare" è fantascienza
    ('Thriller', 9),  -- "Il caso enigmatico" è thriller
    ('Thriller', 10), -- "Oltre il limite" è thriller
    ('Animazione', 11),-- "Il viaggio fantastico" è animazione
    ('Commedia', 12), -- "Risate in vacanza" è commedia
    ('Drammatico', 13),-- "Epopea del passato" è drammatico
    ('Azione', 14),   -- "Codice segreto" è azione
    ('Fantascienza', 15);-- "L'era del futuro" è fantascienza

-- Inserimento dati nella tabella Lingue
INSERT INTO `Lingue` (`Nome`) VALUES
    ('ita'), -- italiano
    ('eng'), -- inglese
    ('spa'), -- spagnolo
    ('fra'), -- francese
    ('deu'), -- tedesco
    ('por'); -- portoghese

-- Inserimento dati nella tabella Formati
INSERT INTO `Formati` (`Nome`) VALUES
    ('mp4'),
    ('avi'),
    ('mkv'),
    ('mp3'),
    ('flac'),
    ('wav');

-- Inserimento dati nella tabella Audio
INSERT INTO `Audio` (`Nome`, `Qualita`) VALUES
    ('mp3', 'alta'),
    ('flac', 'lossless'),
    ('wav', 'alta');

-- Inserimento dati nella tabella Video
INSERT INTO `Video` (`Nome`, `Qualita`, `Bitrate`, `Rapporto_aspetto`, `Risoluzione`) VALUES
    ('mp4', 'alta', '10 Mbps', '16:9', '1920x1080'),
    ('avi', 'media', '5 Mbps', '4:3', '720x480'),
    ('mkv', 'alta', '15 Mbps', '16:9', '2560x1440');

-- Inserimento dati nella tabella Tracking
INSERT INTO `Tracking` (`Path`, `Lunghezza`, `Data_rilascio`, `Formati`, `Film`, `Dimensione`) VALUES
    ('/path/il_segreto_del_successo.mp4', 120.5, '2020-01-01 00:00:00', 'mp4', 1, 2.5),
    ('/path/ridi_e_sorridi.mkv', 95.0, '2018-01-01 00:00:00', 'mkv', 2, 1.8),
    ('/path/nel_buio_della_notte.avi', 135.5, '2019-01-01 00:00:00', 'avi', 3, 2.0),
    ('/path/ritorno_a_casa.mp4', 110.0, '2021-01-01 00:00:00', 'mp4', 4, 2.2),
    ('/path/fuga_adrenalinica.mp4', 118.0, '2017-01-01 00:00:00', 'mp4', 5, 2.4),
    ('/path/il_regno_perduto.mkv', 150.5, '2016-01-01 00:00:00', 'mkv', 6, 3.0),
    ('/path/amore_a_prima_vista.mp4', 105.0, '2022-01-01 00:00:00', 'mp4', 7, 2.1),
    ('/path/viaggio_interstellare.mp4', 122.5, '2015-01-01 00:00:00', 'mp4', 8, 2.3),
    ('/path/il_caso_enigmatico.mkv', 128.0, '2018-01-01 00:00:00', 'mkv', 9, 2.2),
    ('/path/oltre_il_limite.mkv', 140.0, '2019-01-01 00:00:00', 'mkv', 10, 2.8),
    ('/path/il_viaggio_fantastico.mp4', 95.0, '2017-01-01 00:00:00', 'mp4', 11, 1.5),
    ('/path/risate_in_vacanza.mp4', 112.5, '2020-01-01 00:00:00', 'mp4', 12, 2.0),
    ('/path/epopea_del_passato.mp4', 160.0, '2016-01-01 00:00:00', 'mp4', 13, 3.2),
    ('/path/codice_segreto.mp4', 130.5, '2021-01-01 00:00:00', 'mp4', 14, 2.6),
    ('/path/l_era_del_futuro.mkv', 135.0, '2018-01-01 00:00:00', 'mkv', 15, 2.7);

-- Inserimento dati nella tabella Doppiati
INSERT INTO `Doppiati` (`Tracking`, `Lingua`) VALUES
    ('/path/il_segreto_del_successo.mp4', 'ita'),
    ('/path/il_segreto_del_successo.mp4', 'eng'),
    ('/path/ridi_e_sorridi.mkv', 'ita'),
    ('/path/ridi_e_sorridi.mkv', 'eng'),
    ('/path/nel_buio_della_notte.avi', 'ita'),
    ('/path/nel_buio_della_notte.avi', 'eng'),
    ('/path/ritorno_a_casa.mp4', 'ita'),
    ('/path/ritorno_a_casa.mp4', 'eng'),
    ('/path/fuga_adrenalinica.mp4', 'ita'),
    ('/path/fuga_adrenalinica.mp4', 'eng'),
    ('/path/il_regno_perduto.mkv', 'ita'),
    ('/path/il_regno_perduto.mkv', 'eng'),
    ('/path/amore_a_prima_vista.mp4', 'ita'),
    ('/path/amore_a_prima_vista.mp4', 'eng'),
    ('/path/viaggio_interstellare.mp4', 'ita'),
    ('/path/viaggio_interstellare.mp4', 'eng'),
    ('/path/il_caso_enigmatico.mkv', 'ita'),
    ('/path/il_caso_enigmatico.mkv', 'eng'),
    ('/path/oltre_il_limite.mkv', 'ita'),
    ('/path/oltre_il_limite.mkv', 'eng'),
    ('/path/il_viaggio_fantastico.mp4', 'ita'),
    ('/path/il_viaggio_fantastico.mp4', 'eng'),
    ('/path/risate_in_vacanza.mp4', 'ita'),
    ('/path/risate_in_vacanza.mp4', 'eng'),
    ('/path/epopea_del_passato.mp4', 'ita'),
    ('/path/epopea_del_passato.mp4', 'eng'),
    ('/path/codice_segreto.mp4', 'ita'),
    ('/path/codice_segreto.mp4', 'eng'),
    ('/path/l_era_del_futuro.mkv', 'ita'),
    ('/path/l_era_del_futuro.mkv', 'eng');

-- Inserimento dati nella tabella Sottotitolati
INSERT INTO `Sottotitolati` (`Tracking`, `Lingua`) VALUES
    ('/path/il_segreto_del_successo.mp4', 'ita'),
    ('/path/il_segreto_del_successo.mp4', 'eng'),
    ('/path/ridi_e_sorridi.mkv', 'ita'),
    ('/path/ridi_e_sorridi.mkv', 'eng'),
    ('/path/nel_buio_della_notte.avi', 'ita'),
    ('/path/nel_buio_della_notte.avi', 'eng'),
    ('/path/ritorno_a_casa.mp4', 'ita'),
    ('/path/ritorno_a_casa.mp4', 'eng'),
    ('/path/fuga_adrenalinica.mp4', 'ita'),
    ('/path/fuga_adrenalinica.mp4', 'eng'),
    ('/path/il_regno_perduto.mkv', 'ita'),
    ('/path/il_regno_perduto.mkv', 'eng'),
    ('/path/amore_a_prima_vista.mp4', 'ita'),
    ('/path/amore_a_prima_vista.mp4', 'eng'),
    ('/path/viaggio_interstellare.mp4', 'ita'),
    ('/path/viaggio_interstellare.mp4', 'eng'),
    ('/path/il_caso_enigmatico.mkv', 'ita'),
    ('/path/il_caso_enigmatico.mkv', 'eng'),
    ('/path/oltre_il_limite.mkv', 'ita'),
    ('/path/oltre_il_limite.mkv', 'eng'),
    ('/path/il_viaggio_fantastico.mp4', 'ita'),
    ('/path/il_viaggio_fantastico.mp4', 'eng'),
    ('/path/risate_in_vacanza.mp4', 'ita'),
    ('/path/risate_in_vacanza.mp4', 'eng'),
    ('/path/epopea_del_passato.mp4', 'ita'),
    ('/path/epopea_del_passato.mp4', 'eng'),
    ('/path/codice_segreto.mp4', 'ita'),
    ('/path/codice_segreto.mp4', 'eng'),
    ('/path/l_era_del_futuro.mkv', 'ita'),
    ('/path/l_era_del_futuro.mkv', 'eng');

-- Inserimento dati nella tabella Restrizioni
INSERT INTO `Restrizioni` (`Film`, `Formato`, `Regione`) VALUES
    (1, 'mp4', 'IT'), -- "Il segreto del successo" in formato mp4 per l'Italia
    (2, 'mkv', 'US'), -- "Ridi e sorridi" in formato mkv per gli Stati Uniti
    (3, 'avi', 'ES'), -- "Nel buio della notte" in formato avi per la Spagna
    (4, 'mp4', 'FR'), -- "Ritorno a casa" in formato mp4 per la Francia
    (5, 'mp4', 'DE'), -- "Fuga adrenalinica" in formato mp4 per la Germania
    (6, 'mkv', 'UK'), -- "Il regno perduto" in formato mkv per il Regno Unito
    (7, 'mp4', 'IT'), -- "Amore a prima vista" in formato mp4 per l'Italia
    (8, 'mp4', 'ES'), -- "Viaggio interstellare" in formato mp4 per la Spagna
    (9, 'mkv', 'DE'), -- "Il caso enigmatico" in formato mkv per la Germania
    (10, 'mkv', 'FR'), -- "Oltre il limite" in formato mkv per la Francia
    (11, 'mp4', 'UK'), -- "Il viaggio fantastico" in formato mp4 per il Regno Unito
    (12, 'mp4', 'IT'), -- "Risate in vacanza" in formato mp4 per l'Italia
    (13, 'mp4', 'US'), -- "Epopea del passato" in formato mp4 per gli Stati Uniti
    (14, 'mp4', 'ES'), -- "Codice segreto" in formato mp4 per la Spagna
    (15, 'mkv', 'DE'); -- "L'era del futuro" in formato mkv per la Germania

-- Inserimento dati nella tabella Visualizzazioni
INSERT INTO `Visualizzazioni` (`Cliente`, `Film`, `Numero_visualizzazioni`) VALUES
    ('cliente1@example.com', 2, 1),
    ('cliente2@example.com', 1, 1),
    ('cliente3@example.com', 4, 1),
    ('cliente4@example.com', 3, 1),
    ('cliente5@example.com', 5, 1),
    ('cliente6@example.com', 6, 1),
    ('cliente7@example.com', 7, 1),
    ('cliente8@example.com', 8, 1),
    ('cliente9@example.com', 9, 1),
    ('cliente10@example.com', 10, 1),
    ('cliente11@example.com', 11, 1),
    ('cliente12@example.com', 12, 1),
    ('cliente13@example.com', 13, 1),
    ('cliente14@example.com', 14, 1),
    ('cliente15@example.com', 15, 1),
    ('cliente5@example.com', 15, 1),
    ('cliente6@example.com', 14, 1),
    ('cliente7@example.com', 13, 1),
    ('cliente8@example.com', 12, 1),
    ('cliente9@example.com', 11, 1),
    ('cliente10@example.com', 4, 1),
    ('cliente11@example.com', 9, 1),
    ('cliente12@example.com', 8, 1),
    ('cliente13@example.com', 7, 1),
    ('cliente14@example.com', 6, 1),
    ('cliente15@example.com', 5, 1);

-- Inserimento dati nella tabella Download
INSERT INTO `Download` (`Cliente`, `Film`) VALUES
    ('cliente1@example.com', 2),   -- Mario Rossi ha scaricato "Ridi e sorridi"
    ('cliente2@example.com', 1),   -- Anna Bianchi ha scaricato "Il segreto del successo"
    ('cliente3@example.com', 4),   -- Luigi Verdi ha scaricato "Ritorno a casa"
    ('cliente4@example.com', 3),   -- Giovanna Ferrari ha scaricato "Nel buio della notte"
    ('cliente5@example.com', 5),   -- Roberto Russo ha scaricato "Fuga adrenalinica"
    ('cliente6@example.com', 6),   -- Laura Conti ha scaricato "Il regno perduto"
    ('cliente7@example.com', 7),   -- Marco Marchetti ha scaricato "Amore a prima vista"
    ('cliente8@example.com', 8),   -- Sara Moretti ha scaricato "Viaggio interstellare"
    ('cliente9@example.com', 9),   -- Andrea Amato ha scaricato "Il caso enigmatico"
    ('cliente10@example.com', 10); -- Elena Esposito ha scaricato "Oltre il limite"

-- Inserimento dati nella tabella Carta
INSERT INTO `Carta` (`Numero`, `Anno_scadenza`, `Mese_scadenza`, `CVV`, `Default`, `Cliente`) VALUES
    (1234567890123456, 2025, 12, 123, TRUE, 'cliente1@example.com'),  -- Mario Rossi
    (2345678901234567, 2024, 8, 456, TRUE, 'cliente2@example.com'),  -- Anna Bianchi
    (3456789012345678, 2024, 5, 789, TRUE, 'cliente3@example.com'),  -- Luigi Verdi
    (4567890123456789, 2024, 11, 234, TRUE, 'cliente4@example.com'),  -- Giovanna Ferrari
    (5678901234567890, 2025, 3, 567, TRUE, 'cliente5@example.com'),  -- Roberto Russo
    (6789012345678901, 2025, 2, 890, TRUE, 'cliente6@example.com'),  -- Laura Conti
    (7890123456789012, 2024, 7, 345, TRUE, 'cliente7@example.com'),  -- Marco Marchetti
    (8901234567890123, 2024, 9, 678, TRUE, 'cliente8@example.com'),  -- Sara Moretti
    (9012345678901234, 2024, 10, 123, TRUE, 'cliente9@example.com'), -- Andrea Amato
    (1234567890123457, 2025, 4, 456, TRUE, 'cliente10@example.com'),  -- Elena Esposito
    (2345678901234568, 2026, 5, 789, TRUE, 'cliente11@example.com'), -- Paolo Poli
    (3456789012345679, 2027, 8, 123, TRUE, 'cliente12@example.com'), -- Simona Santoro
    (4567890123456780, 2025, 11, 456, TRUE, 'cliente13@example.com'), -- Antonio Avella
    (5678901234567891, 2024, 3, 789, TRUE, 'cliente14@example.com'), -- Cristina Coppola
    (6789012345678902, 2025, 6, 234, TRUE, 'cliente15@example.com');  -- Davide De Luca

-- Inserimento dati nella tabella Abbonamenti
INSERT INTO `Abbonamenti` (`Tipologia`, `Risoluzione_max`, `Ore_max`, `Gigabyte_download`, `Prezzo`) VALUES
    ('basic',   '720',     5,     0, 0.0),
    ('premium', '1080',  100,    10, 12.90),
    ('pro',     '1080',  200,    20, 25.90),
    ('deluxe',  '4k',    400,    40, 45.90),
    ('ultimate', NULL , NULL, NULL, 69.99);

-- Inserimento di dati nella tabella Fatturazione
INSERT INTO `Fatturazione` (`Carta`, `Abbonamenti`, `Validità`, `Data_scadenza`, `Data_sottoscrizione`) VALUES
    (1234567890123456, 'basic', TRUE, '2025-12-31', '2023-10-15'),
    (2345678901234567, 'premium', TRUE, '2024-08-31', '2023-10-15'),
    (3456789012345678, 'pro', TRUE, '2024-05-31', '2023-10-15'),
    (4567890123456789, 'deluxe', TRUE, '2024-11-30', '2023-10-15'),
    (5678901234567890, 'ultimate', TRUE, '2025-03-31', '2023-10-15'),
    (6789012345678901, 'basic', TRUE, '2025-02-28', '2023-10-15'),
    (7890123456789012, 'pro', TRUE, '2024-07-31', '2023-10-15'),
    (8901234567890123, 'premium', TRUE, '2024-09-30', '2023-10-15'),
    (9012345678901234, 'deluxe', TRUE, '2024-10-31', '2023-10-15'),
    (1234567890123457, 'ultimate', TRUE, '2025-04-30', '2023-10-15'),
    (2345678901234568, 'basic', TRUE, '2026-05-31', '2023-10-15'),
    (3456789012345679, 'premium', TRUE, '2027-08-31', '2023-10-15'),
    (4567890123456780, 'pro', TRUE, '2023-11-17', '2023-10-15'),
    (5678901234567891, 'deluxe', TRUE, '2023-11-17', '2023-10-15'),
    (6789012345678902, 'ultimate', TRUE, '2023-11-17', '2023-10-15');

-- Inserimento dati nella tabella Formati_disponibili
INSERT INTO `Formati_disponibili` (`Abbonamenti`, `Formati`) VALUES
    ('basic', 'mp4'),
    ('premium', 'mp4'),
    ('premium', 'avi'),
    ('pro', 'mp4'),
    ('pro', 'avi'),
    ('pro', 'mkv'),
    ('deluxe', 'mp4'),
    ('deluxe', 'avi'),
    ('deluxe', 'mkv'),
    ('deluxe', 'mp3'),
    ('ultimate', 'mp4'),
    ('ultimate', 'avi'),
    ('ultimate', 'mkv'),
    ('ultimate', 'mp3'),
    ('ultimate', 'flac'),
    ('ultimate', 'wav');

-- Inserimento dati nella tabella Dispositivo
INSERT INTO `Dispositivo` (`Marchio`, `Modello`, `Risoluzione`, `Rapporto_schermo`) VALUES
    ('Samsung', 'Galaxy S21', '1080x2400', '20:9'),
    ('Apple', 'iPhone 13', '1170x2532', '19.5:9'),
    ('Sony', 'Xperia 1 III', '1644x3840', '21:9'),
    ('Google', 'Pixel 6', '1080x2340', '19.5:9'),
    ('OnePlus', '9 Pro', '1440x3216', '20:9'),
    ('Huawei', 'P40 Pro', '1200x2640', '18.5:9'),
    ('Xiaomi', 'Mi 11', '1440x3200', '20:9'),
    ('LG', 'G8 ThinQ', '1440x3120', '19.5:9'),
    ('Motorola', 'Moto G Power', '720x1600', '20:9');

-- Inserimento dati nella tabella Formati_Supportati
INSERT INTO `Formati_Supportati` (`Marchio_Dispositivo`, `Modello_Dispositivo`, `Formati`) VALUES
    ('Samsung', 'Galaxy S21', 'mp4'),
    ('Samsung', 'Galaxy S21', 'avi'),
    ('Samsung', 'Galaxy S21', 'mkv'),
    ('Apple', 'iPhone 13', 'mp4'),
    ('Apple', 'iPhone 13', 'avi'),
    ('Apple', 'iPhone 13', 'mkv'),
    ('Apple', 'iPhone 13', 'mp3'),
    ('Apple', 'iPhone 13', 'flac'),
    ('Apple', 'iPhone 13', 'wav'),
    ('Sony', 'Xperia 1 III', 'mp4'),
    ('Sony', 'Xperia 1 III', 'avi'),
    ('Sony', 'Xperia 1 III', 'mkv'),
    ('Sony', 'Xperia 1 III', 'mp3'),
    ('Sony', 'Xperia 1 III', 'flac'),
    ('Sony', 'Xperia 1 III', 'wav'),
    ('Google', 'Pixel 6', 'mp4'),
    ('Google', 'Pixel 6', 'avi'),
    ('Google', 'Pixel 6', 'mkv'),
    ('OnePlus', '9 Pro', 'mp4'),
    ('OnePlus', '9 Pro', 'avi'),
    ('OnePlus', '9 Pro', 'mkv'),
    ('OnePlus', '9 Pro', 'mp3'),
    ('OnePlus', '9 Pro', 'flac'),
    ('OnePlus', '9 Pro', 'wav'),
    ('Huawei', 'P40 Pro', 'mp4'),
    ('Huawei', 'P40 Pro', 'avi'),
    ('Huawei', 'P40 Pro', 'mkv'),
    ('Huawei', 'P40 Pro', 'mp3'),
    ('Huawei', 'P40 Pro', 'flac'),
    ('Huawei', 'P40 Pro', 'wav'),
    ('Xiaomi', 'Mi 11', 'mp4'),
    ('Xiaomi', 'Mi 11', 'avi'),
    ('Xiaomi', 'Mi 11', 'mkv'),
    ('Xiaomi', 'Mi 11', 'mp3'),
    ('Xiaomi', 'Mi 11', 'flac'),
    ('Xiaomi', 'Mi 11', 'wav'),
    ('LG', 'G8 ThinQ', 'mp4'),
    ('LG', 'G8 ThinQ', 'avi'),
    ('LG', 'G8 ThinQ', 'mkv'),
    ('LG', 'G8 ThinQ', 'mp3'),
    ('LG', 'G8 ThinQ', 'flac'),
    ('LG', 'G8 ThinQ', 'wav'),
    ('Motorola', 'Moto G Power', 'mp4'),
    ('Motorola', 'Moto G Power', 'avi'),
    ('Motorola', 'Moto G Power', 'mkv'),
    ('Motorola', 'Moto G Power', 'mp3'),
    ('Motorola', 'Moto G Power', 'flac'),
    ('Motorola', 'Moto G Power', 'wav');

-- Inserimento dati nella tabella ServerCDN
INSERT INTO `ServerCDN` (`Larghezza_banda`, `Max_capacita_trasmissione`, `Detiene`, `Posizione`) VALUES
    (1000, 15000, 'IT', POINT(12.4964, 41.9028)), -- Esempio di posizione per l'Italia
    (2000, 10000, 'US', POINT(-77.0369, 38.9072)), -- Esempio di posizione per gli Stati Uniti
    (1500, 7500, 'ES', POINT(-3.7038, 40.4168)), -- Esempio di posizione per la Spagna
    (1200, 6000, 'FR', POINT(2.3522, 48.8566)), -- Esempio di posizione per la Francia
    (1300, 7000, 'DE', POINT(13.4050, 52.5200)), -- Esempio di posizione per la Germania
    (1100, 5500, 'UK', POINT(-0.1276, 51.5074)); -- Esempio di posizione per il Regno Unito

-- Inserimento dati nella tabella Distanza
INSERT INTO `Distanza` (`ServerCDN`, `Regione_geografica`, `Distanza`) VALUES
    (1, 'IT', 0),  -- Distanza plausibile tra il ServerCDN 1 e l'Italia (esempio: 500 km)
    (1, 'US', 8000), -- Distanza plausibile tra il ServerCDN 1 e gli Stati Uniti
    (1, 'ES', 1200), -- Distanza plausibile tra il ServerCDN 1 e la Spagna
    (1, 'FR', 1000), -- Distanza plausibile tra il ServerCDN 1 e la Francia
    (1, 'DE', 300),  -- Distanza plausibile tra il ServerCDN 1 e la Germania
    (1, 'UK', 1500), -- Distanza plausibile tra il ServerCDN 1 e il Regno Unito

    (2, 'IT', 1500), -- Distanza plausibile tra il ServerCDN 2 e l'Italia
    (2, 'US', 0), -- Distanza plausibile tra il ServerCDN 2 e gli Stati Uniti
    (2, 'ES', 400),  -- Distanza plausibile tra il ServerCDN 2 e la Spagna
    (2, 'FR', 3000), -- Distanza plausibile tra il ServerCDN 2 e la Francia
    (2, 'DE', 700),  -- Distanza plausibile tra il ServerCDN 2 e la Germania
    (2, 'UK', 1000), -- Distanza plausibile tra il ServerCDN 2 e il Regno Unito

    (3, 'IT', 2000), -- Distanza plausibile tra il ServerCDN 3 e l'Italia
    (3, 'US', 4000), -- Distanza plausibile tra il ServerCDN 3 e gli Stati Uniti
    (3, 'ES', 0), -- Distanza plausibile tra il ServerCDN 3 e la Spagna
    (3, 'FR', 3000), -- Distanza plausibile tra il ServerCDN 3 e la Francia
    (3, 'DE', 1500), -- Distanza plausibile tra il ServerCDN 3 e la Germania
    (3, 'UK', 5000), -- Distanza plausibile tra il ServerCDN 3 e il Regno Unito

    (4, 'IT', 3000), -- Distanza plausibile tra il ServerCDN 4 e l'Italia
    (4, 'US', 1000), -- Distanza plausibile tra il ServerCDN 4 e gli Stati Uniti
    (4, 'ES', 2500), -- Distanza plausibile tra il ServerCDN 4 e la Spagna
    (4, 'FR', 0), -- Distanza plausibile tra il ServerCDN 4 e la Francia
    (4, 'DE', 2000), -- Distanza plausibile tra il ServerCDN 4 e la Germania
    (4, 'UK', 4000), -- Distanza plausibile tra il ServerCDN 4 e il Regno Unito

    (5, 'IT', 1200), -- Distanza plausibile tra il ServerCDN 5 e l'Italia
    (5, 'US', 2000), -- Distanza plausibile tra il ServerCDN 5 e gli Stati Uniti
    (5, 'ES', 800),  -- Distanza plausibile tra il ServerCDN 5 e la Spagna
    (5, 'FR', 3000), -- Distanza plausibile tra il ServerCDN 5 e la Francia
    (5, 'DE', 0), -- Distanza plausibile tra il ServerCDN 5 e la Germania
    (5, 'UK', 1500), -- Distanza plausibile tra il ServerCDN 5 e il Regno Unito

    (6, 'IT', 2500), -- Distanza plausibile tra il ServerCDN 6 e l'Italia
    (6, 'US', 6000), -- Distanza plausibile tra il ServerCDN 6 e gli Stati Uniti
    (6, 'ES', 1500), -- Distanza plausibile tra il ServerCDN 6 e la Spagna
    (6, 'FR', 1000), -- Distanza plausibile tra il ServerCDN 6 e la Francia
    (6, 'DE', 3500), -- Distanza plausibile tra il ServerCDN 6 e la Germania
    (6, 'UK', 0); -- Distanza plausibile tra il ServerCDN 6 e il Regno Unito

-- Inserimento dati nella tabella Connessioni_cdn
INSERT INTO `Connessioni_cdn` (`Server`, `Cliente`, `Trasmissione_in_uso`, `Larghezza_banda`, `id_film`) VALUES
    (1, 'cliente1@example.com', 0, 0, 1), -- Cliente 1 Film precaricato
    (2, 'cliente2@example.com', 0, 0, 2), -- Cliente 2 Film precaricato
    (3, 'cliente3@example.com', 0, 0, 3), -- Cliente 3 Film precaricato
    (4, 'cliente4@example.com', 0, 0, 4), -- Cliente 4 Film precaricato
    (5, 'cliente5@example.com', 1, 1300, 15), -- Cliente 5, ServerCDN 5, Film 5, Trasmissione: 1, Larghezza di banda: 1300
    (6, 'cliente6@example.com', 1, 1100, 14), -- Cliente 6, ServerCDN 6, Film 6, Trasmissione: 1, Larghezza di banda: 1100
    (1, 'cliente7@example.com', 1, 900, 13),  -- Cliente 7, ServerCDN 1, Film 7, Trasmissione: 1, Larghezza di banda: 900
    (2, 'cliente8@example.com', 1, 1200, 12), -- Cliente 8, ServerCDN 2, Film 8, Trasmissione: 1, Larghezza di banda: 1200
    (3, 'cliente9@example.com', 1, 1000, 11), -- Cliente 9, ServerCDN 3, Film 9, Trasmissione: 1, Larghezza di banda: 1000
    (4, 'cliente10@example.com', 1, 800, 4), -- Cliente 10, ServerCDN 4, Film 10, Trasmissione: 1, Larghezza di banda: 800
    (5, 'cliente11@example.com', 1, 1100, 9), -- Cliente 11, ServerCDN 5, Film 11, Trasmissione: 1, Larghezza di banda: 1100
    (6, 'cliente12@example.com', 1, 1300, 8), -- Cliente 12, ServerCDN 6, Film 12, Trasmissione: 1, Larghezza di banda: 1300
    (1, 'cliente13@example.com', 1, 1000, 7), -- Cliente 13, ServerCDN 1, Film 13, Trasmissione: 1, Larghezza di banda: 1000
    (2, 'cliente14@example.com', 1, 1200, 6), -- Cliente 14, ServerCDN 2, Film 14, Trasmissione: 1, Larghezza di banda: 1200
    (3, 'cliente15@example.com', 1, 900, 5); -- Cliente 15, ServerCDN 3, Film 15, Trasmissione: 1, Larghezza di banda: 900

-- Inserimento dati nella tabella Log_connessioni
INSERT INTO `Log_connessioni` (`Marchio_Dispositivo`, `Modello_Dispositivo`, `Cliente`, `idCDN`, `indirizzo_ip`, `ora_data_inizio_connessione`, `ora_data_fine_connessione`) VALUES
    ('Samsung', 'Galaxy S21', 'cliente1@example.com', 1, INET_ATON('192.168.1.1'), '2023-10-15T08:00:00', '2023-10-15T08:30:00'),
    ('Apple', 'iPhone 13', 'cliente2@example.com', 2, INET_ATON('192.168.1.2'), '2023-10-15T09:00:00', '2023-10-15T09:15:00'),
    ('Sony', 'Xperia 1 III', 'cliente3@example.com', 3, INET_ATON('192.168.1.3'), '2023-10-15T09:45:00', '2023-10-15T10:00:00'),
    ('Google', 'Pixel 6', 'cliente4@example.com', 4, INET_ATON('192.168.1.4'), '2023-10-15T11:30:00', '2023-10-15T11:45:00'),
    ('OnePlus', '9 Pro', 'cliente5@example.com', 5, INET_ATON('192.168.1.5'), '2023-10-15T12:15:00', '2023-10-15T12:30:00'),
    ('Huawei', 'P40 Pro', 'cliente6@example.com', 6, INET_ATON('192.168.1.6'), '2023-10-15T13:00:00', '2023-10-15T13:15:00'),
    ('Xiaomi', 'Mi 11', 'cliente7@example.com', 1, INET_ATON('192.168.1.7'), '2023-10-15T13:45:00', '2023-10-15T14:00:00'),
    ('LG', 'G8 ThinQ', 'cliente8@example.com', 2, INET_ATON('192.168.1.8'), '2023-10-15T15:30:00', '2023-10-15T15:45:00'),
    ('Motorola', 'Moto G Power', 'cliente9@example.com', 3, INET_ATON('192.168.1.9'), '2023-10-15T16:15:00', '2023-10-15T16:30:00'),
    ('Samsung', 'Galaxy S21', 'cliente10@example.com', 4, INET_ATON('192.168.1.10'), '2023-10-15T17:00:00', '2023-10-15T17:15:00'),
    ('Apple', 'iPhone 13', 'cliente11@example.com', 5, INET_ATON('192.168.1.11'), '2023-10-15T17:45:00', '2023-10-15T18:00:00'),
    ('Sony', 'Xperia 1 III', 'cliente12@example.com', 6, INET_ATON('192.168.1.12'), '2023-10-15T18:30:00', '2023-10-15T18:45:00'),
    ('Google', 'Pixel 6', 'cliente13@example.com', 1, INET_ATON('192.168.1.13'), '2023-10-15T19:15:00', '2023-10-15T19:30:00'),
    ('OnePlus', '9 Pro', 'cliente14@example.com', 2, INET_ATON('192.168.1.14'), '2023-10-15T20:00:00', '2023-10-15T20:15:00'),
    ('Huawei', 'P40 Pro', 'cliente15@example.com', 3, INET_ATON('192.168.1.15'), '2023-10-15T20:45:00', '2023-10-15T21:00:00'),
    ('OnePlus', '9 Pro', 'cliente5@example.com', 5, INET_ATON('192.168.1.5'), '2023-10-16T12:15:00', NULL),
    ('Huawei', 'P40 Pro', 'cliente6@example.com', 6, INET_ATON('192.168.1.6'), '2023-10-16T13:00:00', NULL),
    ('Xiaomi', 'Mi 11', 'cliente7@example.com', 1, INET_ATON('192.168.1.7'), '2023-10-16T13:45:00', NULL),
    ('LG', 'G8 ThinQ', 'cliente8@example.com', 2, INET_ATON('192.168.1.8'), '2023-10-16T15:30:00', NULL),
    ('Motorola', 'Moto G Power', 'cliente9@example.com', 3, INET_ATON('192.168.1.9'), '2023-10-16T16:15:00', NULL),
    ('Samsung', 'Galaxy S21', 'cliente10@example.com', 4, INET_ATON('192.168.1.10'), '2023-10-16T17:00:00', NULL),
    ('Apple', 'iPhone 13', 'cliente11@example.com', 5, INET_ATON('192.168.1.11'), '2023-10-16T17:45:00', NULL),
    ('Sony', 'Xperia 1 III', 'cliente12@example.com', 6, INET_ATON('192.168.1.12'), '2023-10-16T18:30:00', NULL),
    ('Google', 'Pixel 6', 'cliente13@example.com', 1, INET_ATON('192.168.1.13'), '2023-10-16T19:15:00', NULL),
    ('OnePlus', '9 Pro', 'cliente14@example.com', 2, INET_ATON('192.168.1.14'), '2023-10-16T20:00:00', NULL),
    ('Huawei', 'P40 Pro', 'cliente15@example.com', 3, INET_ATON('192.168.1.15'), '2023-10-16T20:45:00', NULL);
