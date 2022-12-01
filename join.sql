CREATE TABLE IMPIEGO(
	IDImpiego INT PRIMARY KEY IDENTITY NOT NULL,
	TipoImpiego nvarchar(30) NOT NULL,
	DataAssunzione DateTime Not Null
)

CREATE TABLE IMPIEGATO(
	IDImpiegato INT PRIMARY KEY IDENTITY NOT NULL,
	Cognome nvarchar(30) NOT NULL,
	Nome nvarchar(30) NOT NULL,
	CodiceFiscale char(16) not NULL unique,
	Eta int NULL,
	RedditoMensile Money check(RedditoMensile>0),
	DetrazioneFiscale BIT,
	IDImpiego INT null

	CONSTRAINT FK_Impiegato_Impiego
	FOREIGN KEY (IDImpiego) REFERENCES Impiego (IDImpiego)
)

INSERT INTO IMPIEGO VALUES ('Tempo Indeterminato', '2007-11-03 9:00')
INSERT INTO IMPIEGO VALUES ('Tempo Determinato', '2007-04-02 9:00')
INSERT INTO IMPIEGO VALUES ('Part-time', '2006-02-01 9:00' )
INSERT INTO IMPIEGO VALUES ('Apprendistato', '2009-06-01 9:00')
INSERT INTO IMPIEGO VALUES ('Lavoro Intermittente','2010-03-01 9:00')


INSERT INTO IMPIEGATO VALUES ('Laguna', 'Stefano', 'LGNSTF82G34L823M', 40, 600, 0, 5)
INSERT INTO IMPIEGATO VALUES ('Verdi', 'Daniele', 'VRDDNL90R45M898S', 32, 1000, 0, 3)
INSERT INTO IMPIEGATO VALUES ('Lerra', 'Nicola', 'LRRNCL87G36M824L', 35, 2200, 1, 1)
INSERT INTO IMPIEGATO VALUES ('Aliotta', 'Cristiano', 'LTTCRT93H64P723M', 29, 750, 0, 4)
INSERT INTO IMPIEGATO VALUES ('Filippi', 'Lucia', 'LGNSTF80H53L717S', 42, 1500, 0, 2)
INSERT INTO IMPIEGATO VALUES ('De Rosa', 'Giulia', 'LGNSTF90R45M898S', 32, 1000, 0, 3)
INSERT INTO IMPIEGATO VALUES ('Ponzani', 'Simone', 'LGNSTF87G36M824L', 35, 2200, 1, 1)
INSERT INTO IMPIEGATO VALUES ('Bruno', 'Stano', 'LGNSTF93H64P723M', 29, 750, 0, 4)
INSERT INTO IMPIEGATO VALUES ('Marco', 'Puccio', 'LGNSTF80H53L717S', 42, 1500, 0, 2)
INSERT INTO IMPIEGATO VALUES ('Senatore', 'Luca', 'SNTLCU82G34L823M', 40, 600, 0, 5)
INSERT INTO IMPIEGATO VALUES ('Noce', 'Maria', 'NCOMRA82G34L823M', 40, 600, 0, 5)
INSERT INTO IMPIEGATO VALUES ('Marino', 'Mirko', 'MRNMRK90R45M898S', 32, 1000, 0, 3)
INSERT INTO IMPIEGATO VALUES ('Martini', 'Lamberto', 'MRTLMB87G36M824L', 35, 2200, 1, 1)
INSERT INTO IMPIEGATO VALUES ('Di Pisa', 'Giuseppe', 'DPSGSP93H64P723M', 29, 750, 0, 4)
INSERT INTO IMPIEGATO VALUES ('Monte', 'Alessia', 'MNTLSS80H53L717S', 42, 1500, 0, 2)

--a. Visualizzare tutti gli impiegati oltre i 29 anni;
SELECT * FROM IMPIEGATO 
WHERE Eta>29

--b. Visualizzare tutti gli impiegati con un reddito di almeno 800 euro mensili;
SELECT * FROM IMPIEGATO
WHERE RedditoMensile>=800

--c. Visualizzare tutti gli impiegati che posseggono la detrazione fiscale;
SELECT * FROM IMPIEGATO
WHERE DetrazioneFiscale=1

--d. Visualizzare tutti gli impiegati che non posseggono la detrazione fiscale;
SELECT * FROM IMPIEGATO
WHERE DetrazioneFiscale=0

--e. Visualizzare tutti gli impiegati cui il cognome cominci con una lettera G e li visualizzi in ordine alfabetico;
SELECT * FROM IMPIEGATO
WHERE Cognome LIKE 'G%'
ORDER BY Cognome ASC

UPDATE IMPIEGATO SET Cognome='Guerra'
WHERE COGNOME = 'Senatore'
UPDATE IMPIEGATO SET Cognome='Guirino'
WHERE COGNOME = 'Noce'

--f. Visualizzare il numero totale degli impiegati registrati nella base dati;
SELECT COUNT(*) AS NrTotImpiegati FROM IMPIEGATO

--g. Visualizzare il totale dei redditi mensili di tutti gli impiegati;
SELECT SUM(RedditoMensile) AS TotRedditi FROM IMPIEGATO 

--h. Visualizzare la media dei redditi mensili di tutti gli impiegati;
SELECT AVG(RedditoMensile) AS MediaRedditi FROM IMPIEGATO 

--i. Visualizzare l’importo del reddito mensile maggiore;
SELECT MAX(RedditoMensile) AS TotRedditiMax FROM IMPIEGATO 

--j. Visualizzare l’importo del reddito mensile minore;
SELECT MIN(RedditoMensile) AS TotRedditiMin FROM IMPIEGATO 

--k. Visualizzare gli impiegati assunti dall’ 01/01/2007 all’ 01/01/2008;
SELECT Nome, Cognome, DataAssunzione 
FROM IMPIEGATO
INNER JOIN
IMPIEGO ON
IMPIEGATO.IDImpiego = IMPIEGO.IDImpiego
WHERE DataAssunzione BETWEEN '2007-01-01' AND '2008-01-01'

--m. Visualizzare l’età media dei lavoratori all’interno dell’azienda.
SELECT AVG(Eta) AS EtaMedia FROM IMPIEGATO
