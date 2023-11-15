USE `FilmSphere`;
-- Popolamento della tabella `Genere`
INSERT INTO `Genere` (`Nome`, `Media`) VALUES
('Azione', 8.5),
('Commedia', 7.9),
('Drammatico', 8.2);

-- Popolamento della tabella `Premi`
INSERT INTO `Premi` (`Nome`, `importanza`) VALUES
('Oscar', 9.5),
('Golden Globe', 8.8),
('Bafta', 8.7);

-- Popolamento della tabella `Registi_Attori`
INSERT INTO `Registi_Attori` (`Nome`, `Cognome`, `Data_di_nascita`) VALUES
('Christopher', 'Nolan', '1970-07-30'),
('Scarlett', 'Johansson', '1984-11-22'),
('Quentin', 'Tarantino', '1963-03-27');

-- Popolamento della tabella `Registi`
INSERT INTO `Registi` (`Registi`, `Rating`) VALUES
(1, 9.0),
(3, 8.8);

-- Popolamento della tabella `Attori`
INSERT INTO `Attori` (`Attori`, `Rating`) VALUES
(2, 8.5),
(3, 8.9);

-- Popolamento della tabella `Premi_registi`
INSERT INTO `Premi_registi` (`Registi`, `Premi`) VALUES
(1, 'Oscar'),
(3, 'Golden Globe');

-- Popolamento della tabella `Premi_attori`
INSERT INTO `Premi_attori` (`Attori`, `Premi`) VALUES
(2, 'Bafta'),
(3, 'Oscar');

-- Popolamento della tabella `Film`
INSERT INTO `Film` (`Anno_di_produzione`, `Descrizione`, `Rating_media`, `Durata`, `Titolo`, `Prodotto`)
VALUES
(2010, 'Un film dazione emozionante', 8.7, 150.5, 'Inception', 'IT'),
(2019, 'Una commedia divertente', 7.5, 120.0, 'Once Upon a Time in Hollywood', 'US'),
(2021, 'Un dramma commovente', 8.9, 135.75, 'La La Land', 'US');

-- Popolamento della tabella `Recensioni_utenti`
INSERT INTO `Recensioni_utenti` (`Cliente`, `Film`, `Rating`, `Descrizione`) VALUES
('user1@email.com', 1, 9.0, 'Uno dei miei film preferiti!'),
('user2@email.com', 2, 7.8, 'Divertente, ma non eccezionale'),
('user3@email.com', 3, 9.5, 'Emozionante e ben recitato');

-- Popolamento della tabella `Recensioni_critici`
INSERT INTO `Recensioni_critici` (`Cliente`, `Film`, `Rating`, `Descrizione`) VALUES
('critic1@email.com', 1, 8.5, 'Un capolavoro di Nolan'),
('critic2@email.com', 2, 8.0, 'Tarantino colpisce ancora'),
('critic3@email.com', 3, 9.2, 'Un musical straordinario');

-- Popolamento della tabella `Appartiene`
INSERT INTO `Appartiene` (`Genere`, `Film`) VALUES
('Azione', 1),
('Commedia', 2),
('Drammatico', 3);

-- Popolamento della tabella `Premi_film`
INSERT INTO `Premi_film` (`Premi`, `Film`) VALUES
('Oscar', 1),
('Golden Globe', 2),
('Bafta', 3);

-- Popolamento della tabella `Direzione`
INSERT INTO `Direzione` (`Registi`, `Film`) VALUES
(1, 1),
(3, 2),
(1, 3);

-- Popolamento della tabella `Recitazione`
INSERT INTO `Recitazione` (`Attori`, `Film`) VALUES
(2, 1),
(3, 2),
(2, 3);

-- Popolamento della tabella `Lingue`
INSERT INTO `Lingue` (`Nome`) VALUES
('ENG'),
('ITA'),
('FRA');

-- Popolamento della tabella `Sottotitolati`
INSERT INTO `Sottotitolati` (`Tracking`, `Lingua`) VALUES
('path_eng', 'ENG'),
('path_ita', 'ITA'),
('path_fra', 'FRA');

-- Popolamento della tabella `ServerCDN`
INSERT INTO `ServerCDN` (`Larghezza_banda`, `Max_capacita_trasmissione`, `Stato_di-accettazione`, `Detiene`, `Posizione`) VALUES
(100, 1000, TRUE, 'US', POINT(37.7749, -122.4194)),
(150, 1200, TRUE, 'IT', POINT(41.9028, 12.4964)),
(120, 900, TRUE, 'FRA', POINT(50.1109, 8.6821));

-- Popolamento della tabella `Connessioni_cdn`
INSERT INTO `Connessioni_cdn` (`Server`, `Cliente`, `Trasmissione_in_uso`, `Larghezza_banda`, `id_film`) VALUES
(1, 'user1@email.com', 1, 50, 1),
(2, 'user2@email.com', 0, 75, 2),
(3, 'user3@email.com', 1, 80, 3);

-- Popolamento della tabella `Regione_geografica`
INSERT INTO `Regione_geografica` (`Nome`) VALUES
('US'),
('IT'),
('FRA');

-- Popolamento della tabella `Distanza`
INSERT INTO `Distanza` (`ServerCDN`, `Regione_geografica`, `Distanza`) VALUES
(1, 'US', 0),
(2, 'IT', 0),
(3, 'FRA', 0);

-- Popolamento della tabella `Formati`
INSERT INTO `Formati` (`Nome`) VALUES
('MP4'),
('MKV'),
('AVI');

-- Popolamento della tabella `Audio`
INSERT INTO `Audio` (`Nome`, `Qualita`) VALUES
('MP4', 'Dolby Digital'),
('MKV', 'DTS'),
('AVI', 'AAC');

-- Popolamento della tabella `Video`
INSERT INTO `Video` (`Nome`, `Qualita`, `Bitrate`, `Rapporto_aspetto`, `Risoluzione`) VALUES
('MP4', '1080p', '8000 kbps', '16:9', '1920x1080'),
('MKV', '4K', '15000 kbps', '16:9', '3840x2160'),
('AVI', '720p', '5000 kbps', '16:9', '1280x720');

-- Popolamento della tabella `Restrizioni`
INSERT INTO `Restrizioni` (`Film`, `Formato`, `Regione`) VALUES
(1, 'MP4', 'US'),
(2, 'MKV', 'IT'),
(3, 'AVI', 'FRA');

-- Popolamento della tabella `Tracking`
INSERT INTO `Tracking` (`Path`, `Lunghezza`, `Data_rilascio`, `Formati`, `Film`, `Dimensione`) VALUES
('path1', 120, '2022-01-01', 'MP4', 1, 2000),
('path2', 180, '2022-02-01', 'MKV', 2, 3500),
('path3', 150, '2022-03-01', 'AVI', 3, 2500);

-- Popolamento della tabella `Formati_disponibili`
INSERT INTO `Formati_disponibili` (`Abbonamenti`, `Formati`) VALUES
('Basic', 'MP4'),
('Standard', 'MKV'),
('Premium', 'AVI');

-- Popolamento della tabella `Cliente`
INSERT INTO `Cliente` (`e-mail`, `Nome`, `Cognome`, `Data_di_nascita`, `Password`, `Critico`, `situa`) VALUES
('user1@email.com', 'John', 'Doe', '1990-05-15', 'password123', FALSE, 'US'),
('user2@email.com', 'Jane', 'Smith', '1985-08-20', 'securepass', TRUE, 'IT'),
('user3@email.com', 'Bob', 'Johnson', '1995-02-10', 'userpass', FALSE, 'FRA');

-- Popolamento della tabella `Visualizzazioni`
INSERT INTO `Visualizzazioni` (`Cliente`, `Film`, `Numero_visualizzazioni`) VALUES
('user1@email.com', 1, 3),
('user2@email.com', 2, 2),
('user3@email.com', 3, 1);

-- Popolamento della tabella `Download`
INSERT INTO `Download` (`Cliente`, `Film`) VALUES
('user1@email.com', 1),
('user2@email.com', 2),
('user3@email.com', 3);

-- Popolamento della tabella `Carta`
INSERT INTO `Carta` (`Numero`, `Anno_scadenza`, `Mese_scadenza`, `CVV`, `Default`, `Cliente`) VALUES
(1234567890123456, 2025, 12, 123, TRUE, 'user1@email.com'),
(9876543210987654, 2023, 10, 456, FALSE, 'user2@email.com'),
(1111222233334444, 2024, 8, 789, TRUE, 'user3@email.com');

-- Popolamento della tabella `Abbonamenti`
INSERT INTO `Abbonamenti` (`Tipologia`, `Risoluzione_max`, `Ore_max`, `Gigabyte_download`, `Prezzo`) VALUES
('Basic', '720p', 5, 20, 9.99),
('Standard', '1080p', 10, 50, 14.99),
('Premium', '4K', NULL, NULL, 19.99);

-- Popolamento della tabella `Fatturazione`
INSERT INTO `Fatturazione` (`Carta`, `Abbonamenti`, `Validità`, `Data_scadenza`, `Data_sottoscrizione`) VALUES
(1234567890123456, 'Basic', TRUE, '2023-05-15', '2022-05-15'),
(9876543210987654, 'Standard', TRUE, '2023-08-20', '2022-08-20'),
(1111222233334444, 'Premium', TRUE, '2023-04-10', '2022-04-10');

-- Popolamento della tabella `Dispositivo`
INSERT INTO `Dispositivo` (`Marchio`, `Modello`, `Risoluzione`, `Rapporto_schermo`) VALUES
('Samsung', 'Galaxy S20', '1440x3200', '20:9'),
('Apple', 'iPhone 12', '1170x2532', '19.5:9'),
('Sony', 'Bravia X900H', '3840x2160', '16:9');

-- Popolamento della tabella `Log_connessioni`
INSERT INTO `Log_connessioni` (`Marchio_Dispositivo`, `Modello_Dispositivo`, `Cliente`, `idCDN`, `indirizzo_ip`, `ora_data_fine_connessione`, `ora_data_inizio_connessione`) VALUES
('Samsung', 'Galaxy S20', 'user1@email.com', 1, INET_ATON('192.168.1.1'), '2022-05-01 12:30:00', '2022-05-01 12:00:00'),
('Apple', 'iPhone 12', 'user2@email.com', 2, INET_ATON('192.168.2.1'), '2022-06-01 14:45:00', '2022-06-01 14:15:00'),
('Sony', 'Bravia X900H', 'user3@email.com', 3, INET_ATON('192.168.3.1'), '2022-07-01 18:20:00', '2022-07-01 17:50:00');

-- Popolamento della tabella `Formati_Supportati`
INSERT INTO `Formati_Supportati` (`Marchio_Dispositivo`, `Modello_Dispositivo`, `Formati`) VALUES
('Samsung', 'Galaxy S20', 'MP4'),
('Apple', 'iPhone 12', 'MKV'),
('Sony', 'Bravia X900H', 'AVI');

-- Popolamento della tabella `Genere`
INSERT INTO `Genere` (`Nome`, `Media`) VALUES
('Drammatico', 7.5),
('Commedia', 8.2),
('Azione', 6.9);

-- Popolamento della tabella `Premi`
INSERT INTO `Premi` (`Nome`, `importanza`) VALUES
('Oscar', 9.5),
('Golden Globe', 8.8),
('Bafta', 8.6);

-- Popolamento della tabella `Registi_Attori`
INSERT INTO `Registi_Attori` (`Nome`, `Cognome`, `Data_di_nascita`) VALUES
('Christopher', 'Nolan', '1970-07-30'),
('Quentin', 'Tarantino', '1963-03-27'),
('Scarlett', 'Johansson', '1984-11-22');

-- Popolamento della tabella `Registi`
INSERT INTO `Registi` (`Registi`, `Rating`) VALUES
(1, 9.0),
(2, 8.5),
(3, 8.7);

-- Popolamento della tabella `Attori`
INSERT INTO `Attori` (`Attori`, `Rating`) VALUES
(4, 8.8),
(5, 8.6),
(6, 9.2);

-- Popolamento della tabella `Premi_registi`
INSERT INTO `Premi_registi` (`Registi`, `Premi`) VALUES
(1, 'Oscar'),
(2, 'Golden Globe'),
(3, 'Bafta');

-- Popolamento della tabella `Premi_attori`
INSERT INTO `Premi_attori` (`Attori`, `Premi`) VALUES
(4, 'Oscar'),
(5, 'Golden Globe'),
(6, 'Bafta');
