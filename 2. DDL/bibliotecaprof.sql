create schema biblioteca;
use biblioteca;
 
CREATE TABLE Socio (
   matricola		CHAR(6) PRIMARY KEY,
   cognome			VARCHAR(30) NOT NULL,
   nome				VARCHAR(30) NOT NULL,
   datanascita		DATE NOT NULL,
   dataiscrizione	DATE NOT NULL
);
 
CREATE TABLE Rivista (
   codice		CHAR(6) PRIMARY KEY,
   titolo		VARCHAR(30) NOT NULL,
   anno			YEAR NOT NULL,
   mese 		INT NOT NULL,
   volume 		INT NOT NULL,
   issue 		INT NOT NULL
);
 
CREATE TABLE Libro (
   codice		CHAR(6) PRIMARY KEY,
   titolo		VARCHAR(30) NOT NULL,
   copiedisponibili	INT NOT NULL
);
 
CREATE TABLE Edizione (
   ISBN	 		CHAR(13) PRIMARY KEY,
   annostampa	YEAR NOT NULL,
   edizione  	INT NOT NULL
);
 
CREATE TABLE Consultazione (
   matricolasocio 	CHAR(6),
   codicerivista	CHAR(6),
   PRIMARY KEY (matricolasocio, codicerivista),
   FOREIGN KEY (matricolasocio) REFERENCES Socio(matricola) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (codicerivista) REFERENCES Rivista(codice) ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE Genere (
   codicegenere	 CHAR(8) PRIMARY KEY,
   nome	VARCHAR(30) NOT NULL
);
 
CREATE TABLE Autore	(
   codiceautore	CHAR(6) PRIMARY KEY,
   cognome		VARCHAR(30) NOT NULL,
   nome			VARCHAR(30) NOT NULL,
   nazionalita	VARCHAR(30) NOT NULL,
   epoca		VARCHAR(30) NOT NULL,
   datanascita	DATE NOT NULL,
   datamorte	DATE
);
 
CREATE TABLE Appartenenza (
   codiceautore	CHAR(6),
   codicegenere	 CHAR(8),
   PRIMARY KEY (codiceautore, codicegenere),
   FOREIGN KEY (codiceautore) REFERENCES Autore(codiceautore) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (codicegenere) REFERENCES Genere(codicegenere) ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE Scrittura (
   codicelibro	CHAR(6),
   codiceautore	 CHAR(6),
   PRIMARY KEY (codicelibro, codiceautore),
   FOREIGN KEY (codicelibro) REFERENCES Libro(codice) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (codiceautore) REFERENCES Autore(codiceautore) ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE Copia (
   codicecatalogazione	CHAR(6) PRIMARY KEY,
   stato		VARCHAR(30) NOT NULL,
   codicelibro	CHAR(6) NOT NULL REFERENCES Libro(codice) ON UPDATE CASCADE ON DELETE CASCADE,
   ISBN	 		CHAR(13) REFERENCES Edizione(ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE Prestito (
   matricola			CHAR(6),
   codicecatalogazione	CHAR(6),
   dataprestito			DATE NOT NULL,
   datarestituzione		DATE,
   durataprestito		INT NOT NULL,
   PRIMARY KEY (matricola, codicecatalogazione, dataprestito),
   FOREIGN KEY (codicecatalogazione) REFERENCES Copia(codicecatalogazione) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (matricola) REFERENCES Socio(matricola) ON UPDATE CASCADE ON DELETE CASCADE
);
 
 
use biblioteca;
DELETE FROM Socio WHERE matricola<>'2';
 
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003201', 'Adey', 'Rabbe', '2004-05-29', '2022-04-11');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009432', 'Lemmie', 'Balazot', '1984-05-16', '2022-10-21');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('005896', 'Thomasa', 'Alman', '1993-04-18', '2022-01-22');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009004', 'Lisetta', 'Grinnov', '1983-11-06', '2022-05-26');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('005499', 'Finlay', 'Russilll', '2004-11-30', '2022-05-17');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001999', 'Marianne', 'La Batie', '1987-12-13', '2022-10-15');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008015', 'Dorette', 'Sprulls', '1994-10-21', '2022-02-20');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009459', 'Josefa', 'Jesteco', '1974-09-14', '2022-01-22');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009419', 'Valentin', 'Pleasance', '1978-03-21', '2022-10-17');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000103', 'Dmitri', 'Negal', '2003-05-24', '2022-03-08');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001292', 'Andi', 'Stockman', '2008-05-25', '2022-04-28');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('002735', 'Bealle', 'Napolione', '1987-01-13', '2022-01-07');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008186', 'Herta', 'Kroger', '1993-06-28', '2022-01-19');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('002617', 'Joana', 'Wratten', '1999-01-12', '2022-08-07');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009299', 'Trixie', 'D''Onise', '1995-10-22', '2022-06-13');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009827', 'Dorie', 'Giffin', '1993-03-06', '2022-07-20');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003296', 'Lonna', 'Calver', '2002-09-08', '2022-10-26');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009810', 'Giacopo', 'Teasdale', '2001-11-09', '2022-06-04');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001402', 'Carmelle', 'Sadat', '1997-08-22', '2022-06-25');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('006035', 'Henrieta', 'Breton', '1994-01-05', '2022-11-29');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008044', 'Di', 'Brumhead', '1996-05-29', '2022-07-06');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001848', 'Mannie', 'Stringfellow', '1987-06-09', '2022-04-08');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000943', 'Sullivan', 'Kobiela', '1981-12-17', '2022-05-17');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001535', 'Raphael', 'Mussett', '1995-04-17', '2022-10-10');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009673', 'Gregory', 'Philipsen', '1991-12-24', '2022-03-26');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008848', 'Leopold', 'Chelsom', '2004-01-07', '2022-05-31');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008415', 'Malory', 'Stanwix', '2002-12-14', '2022-05-28');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001004', 'Maria', 'Kepe', '1980-02-15', '2022-04-05');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001806', 'Aila', 'Wackett', '1988-11-19', '2022-02-17');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003351', 'Sarita', 'Howis', '1982-06-13', '2022-03-17');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001985', 'Evita', 'Wearden', '1990-01-25', '2022-05-10');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('005071', 'Maggee', 'Adnett', '1980-10-29', '2022-08-26');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000624', 'Belle', 'Tomaello', '1978-04-19', '2022-03-19');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000974', 'Ester', 'Harroll', '1976-07-18', '2022-05-22');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003075', 'Josh', 'Leaver', '1983-02-02', '2022-10-26');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003809', 'Skippie', 'Gasticke', '1999-06-27', '2022-01-18');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000734', 'Deane', 'Rochford', '1972-05-23', '2022-06-24');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003811', 'Ettie', 'Vamplers', '2001-08-19', '2021-12-28');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000287', 'Corabelle', 'Sexten', '1970-01-22', '2022-11-13');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('004757', 'Gayleen', 'Eldrett', '2000-07-24', '2022-11-08');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('006927', 'Dimitri', 'Pumfrey', '1989-01-06', '2022-08-17');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('006807', 'Maia', 'Lghan', '1991-10-19', '2022-09-02');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('004420', 'Jone', 'Massel', '1991-03-02', '2022-09-02');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009997', 'Seumas', 'Chark', '2006-09-10', '2022-01-03');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008009', 'Eddy', 'Gradon', '1997-09-28', '2022-10-02');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('006188', 'Barby', 'Bartholin', '1976-05-03', '2022-04-05');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('005293', 'Ken', 'Dacombe', '1987-02-27', '2022-08-23');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001803', 'Manya', 'Walton', '2007-10-14', '2022-04-01');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001256', 'Laurianne', 'Raspison', '2006-09-01', '2022-03-12');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003789', 'Brena', 'Kiehnlt', '1984-11-17', '2022-06-23');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('005339', 'Elaina', 'Tigwell', '1977-08-18', '2022-05-16');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001947', 'Millie', 'Shere', '1980-11-26', '2022-03-19');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('004019', 'Cosmo', 'Heggie', '1997-08-23', '2022-09-07');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('007278', 'Ruthi', 'Adel', '2003-11-14', '2022-10-08');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('007941', 'Clemmie', 'Mablestone', '1994-11-28', '2022-06-04');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003151', 'Trevar', 'Danilchenko', '1992-11-11', '2022-04-13');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('002742', 'Ninon', 'Ditchfield', '1992-04-20', '2022-01-22');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('006860', 'Felix', 'Moggach', '1984-10-10', '2022-11-09');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008181', 'Avrit', 'Sogg', '1972-06-07', '2022-05-16');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('004129', 'Brynn', 'Maxted', '1979-11-24', '2022-11-04');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('002542', 'Randolf', 'Westby', '1970-12-28', '2021-12-27');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('002253', 'Olia', 'Rickesies', '1981-04-02', '2022-01-18');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('005244', 'Allsun', 'Allanby', '2000-07-05', '2022-01-18');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009429', 'Donnamarie', 'Milley', '1984-04-20', '2022-11-17');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('007537', 'Selby', 'Olechnowicz', '2006-09-07', '2021-12-18');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000992', 'Lusa', 'Barlass', '1986-04-21', '2021-12-20');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008811', 'Melva', 'Pilcher', '2004-10-22', '2022-10-23');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009787', 'Lena', 'Hulland', '2001-07-19', '2021-12-08');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('006448', 'Kelila', 'Bendtsen', '2008-04-07', '2022-04-16');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('007613', 'Gus', 'Matanin', '1994-01-06', '2022-09-11');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000242', 'Evania', 'Tatersale', '1971-04-21', '2022-03-19');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('002759', 'Darline', 'Syder', '1997-11-16', '2022-06-06');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('005468', 'Ancell', 'Khoter', '1974-06-03', '2022-08-18');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('005668', 'Phaedra', 'Gilphillan', '1998-04-15', '2022-04-12');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003639', 'Gus', 'Hadleigh', '1981-06-26', '2022-06-10');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000457', 'Farr', 'Campaigne', '2005-01-03', '2022-10-29');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009412', 'Valene', 'Larenson', '2001-06-11', '2022-06-26');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003573', 'Amby', 'Wayon', '1985-06-24', '2022-04-09');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009721', 'Even', 'Wallwood', '1993-06-07', '2021-12-08');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('002478', 'Inger', 'McFayden', '1992-07-21', '2022-08-01');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008736', 'Gabbie', 'Mabson', '1998-07-22', '2022-02-21');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003664', 'Ruthie', 'Joll', '1994-06-11', '2021-12-27');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('003741', 'Rufe', 'Twells', '1981-10-21', '2022-04-13');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('001688', 'Cicily', 'Spackman', '1989-08-24', '2022-09-19');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008943', 'Rebbecca', 'Szymanzyk', '1983-09-08', '2022-03-09');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('000556', 'Jeanne', 'Ashbey', '1977-08-15', '2022-10-06');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('007225', 'Cyndy', 'Semor', '1983-11-11', '2022-06-18');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008636', 'Karry', 'Elwel', '1970-01-17', '2022-06-21');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('004926', 'Melita', 'Maciaszek', '1982-04-04', '2022-07-05');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('006581', 'Rod', 'Wilber', '1999-10-11', '2022-10-07');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('008600', 'Verla', 'Alcott', '2008-01-13', '2022-05-09');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('006722', 'Abramo', 'Renvoys', '1998-11-28', '2022-07-11');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('004083', 'Benito', 'De la Yglesia', '1987-09-18', '2022-07-22');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('006570', 'Lelia', 'Thor', '1988-04-16', '2022-09-20');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('004915', 'Virge', 'Pudan', '2004-04-14', '2022-02-13');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('007798', 'Corabelle', 'Farthin', '1977-06-14', '2022-02-15');
insert into Socio (matricola, cognome, nome, datanascita, dataiscrizione) values ('009231', 'Carlye', 'Shankle', '1989-08-12', '2022-03-12');
 
use biblioteca;
DELETE FROM Rivista WHERE codice<>'2';
 
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('009669', 'Molly Maxwell', 2004, 2, 5365, 4666);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('007247', 'Special Bulletin', 1998, 8, 3095, 3794);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('003005', 'No Mercy (Yongseoneun Eupda)', 2009, 4, 6436, 4357);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('004870', 'Red Dust', 1996, 1, 7005, 3710);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('007300', 'Look at Me (Comme une image)', 1999, 9, 2727, 1218);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('003290', 'Lower Depths, The (Donzoko)', 1998, 9, 2784, 3077);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('008364', 'Devil Hunter (El caníbal)', 2008, 12, 7889, 1295);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005669', 'Punch-Drunk Love', 2009, 9, 2345, 4714);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('003981', 'R', 2002, 12, 6277, 1499);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('009528', 'McLintock!', 2005, 11, 522, 3913);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('003403', 'Monster Club, The', 2010, 11, 309, 1388);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005292', 'Cutter''s Way', 1990, 8, 3551, 414);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('006436', 'Road to Wellville, The', 2002, 9, 6969, 796);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('009583', 'Moliere', 1987, 10, 3764, 4484);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('006876', 'Homecoming', 2000, 10, 5220, 4793);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('008284', 'Death Proof', 2009, 9, 3942, 490);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('004499', 'Surrender, Dorothy', 1988, 5, 8141, 2605);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('002569', 'Legion', 1995, 1, 8132, 1335);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('006846', 'Keeping Mum', 2007, 6, 7616, 1499);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005829', 'Gerhard Richter Painting', 2006, 9, 6951, 3075);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('001111', 'Dreams That Money Can Buy', 1994, 8, 10, 1261);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('009015', 'Cat''s-Paw, The', 1994, 12, 6683, 2591);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('001324', 'The Wicker Tree', 2004, 9, 7496, 110);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005407', 'Less of Sugar (Cheeni Kum)', 1997, 12, 6347, 476);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('009964', 'Cruising', 2008, 7, 9276, 4618);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('002622', 'Varsity Blues', 1970, 11, 6980, 2153);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('007530', 'Extraterrestrial', 2002, 11, 1146, 3708);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('007075', 'Dangerous Liaisons', 2011, 9, 308, 3295);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('006952', 'Sabotage', 2004, 9, 6616, 3847);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('000772', 'Melvin and Howard', 1995, 3, 6412, 2441);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('001366', 'Bleak House', 1985, 3, 1202, 2908);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('004807', 'The Gang That Sold America', 2002, 5, 4438, 4996);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('009380', 'Mosaic', 2007, 9, 763, 847);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('001079', 'Resident Evil', 2007, 4, 3345, 3801);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('008699', 'Valley Uprising', 1996, 8, 5041, 3966);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('008310', 'Enduring Love', 2003, 9, 9987, 380);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('006175', 'Die Frau des Frisörs', 2010, 1, 7089, 4485);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('000599', 'Waking Madison ', 2006, 7, 4478, 602);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005082', 'Hellhounds on My Trail', 1996, 7, 8270, 571);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('009369', 'Blot, The', 1996, 4, 6147, 1757);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('001563', 'Mein Kampf', 1995, 7, 2759, 2086);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('004910', 'They Gave Him A Gun', 2003, 10, 5586, 2859);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('002804', 'Mercenary for Justice', 1999, 12, 3230, 4539);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('003822', 'Jobs', 1991, 5, 3307, 4693);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('006142', 'Frozen', 2011, 7, 3450, 1193);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005899', 'Our Music (Notre musique)', 2000, 2, 5577, 1587);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('002862', 'Headfirst', 2005, 6, 7796, 1803);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('002729', 'Human Comedy, The', 2007, 10, 749, 2727);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('002271', 'Texas Across the River', 2004, 10, 3365, 1495);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('001072', 'Video Games: The Movie', 2008, 9, 3681, 842);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('009212', 'English Vinglish', 2008, 11, 7634, 3855);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('001541', 'Reindeer Games', 2008, 12, 2247, 3460);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('007585', 'LOL (Laughing Out Loud)', 1999, 10, 693, 4878);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('008955', 'Crime Zone', 1997, 1, 2025, 301);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005874', 'Dragonfly', 2012, 2, 6670, 2826);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005332', 'Luminarias', 1992, 10, 5661, 30);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('009532', 'Chicago', 2002, 2, 2220, 1825);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005420', 'Vibes', 2009, 3, 5715, 4414);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('003289', 'Host, The', 2009, 11, 3505, 2549);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005221', 'Expect No Mercy', 2004, 1, 4723, 1739);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('005818', 'Bill Burr: Let It Go', 1995, 10, 1784, 4555);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('008769', 'Bad Asses (Bad Ass 2)', 2007, 11, 5136, 2921);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('007251', 'January Man, The', 2006, 11, 5951, 3121);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('003542', 'Tell Me and I Will Forget', 1964, 3, 9414, 4035);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('004646', 'Front Page Woman', 1996, 9, 1250, 2042);
insert into Rivista (codice, titolo, anno, mese, volume, issue) values ('006941', 'Dead Hate the Living!, The', 2007, 8, 5496, 1422);
 
use biblioteca;
DELETE FROM Libro WHERE codice<>'2';
 
insert into Libro (codice, titolo, copiedisponibili) values ('009658', 'ArrowheadArrowheArrowhead', 12);
insert into Libro (codice, titolo, copiedisponibili) values ('001128', 'UndefeatedUndefeated, The', 37);
insert into Libro (codice, titolo, copiedisponibili) values ('003172', 'Low Down, ThLow Down, The', 33);
insert into Libro (codice, titolo, copiedisponibili) values ('008626', 'DDylan Dog: Dead of Night', 26);
insert into Libro (codice, titolo, copiedisponibili) values ('006785', 'OrdOrders Signed in White', 38);
insert into Libro (codice, titolo, copiedisponibili) values ('005346', 'Knuckleball!KKnuckleball!', 19);
insert into Libro (codice, titolo, copiedisponibili) values ('002746', 'Jailhouse RJailhouse Rock', 13);
insert into Libro (codice, titolo, copiedisponibili) values ('005749', 'BabymotherBabymBabymother', 45);
insert into Libro (codice, titolo, copiedisponibili) values ('003598', 'Bachelor, ThBachelor, The', 49);
insert into Libro (codice, titolo, copiedisponibili) values ('000051', 'KockenKockenKockenKKocken', 48);
insert into Libro (codice, titolo, copiedisponibili) values ('000277', 'Hour of thHour of the Gun', 2);
insert into Libro (codice, titolo, copiedisponibili) values ('007827', 'Casanova BrCasanova Brown', 34);
insert into Libro (codice, titolo, copiedisponibili) values ('002885', 'Blues Blues Brothers, The', 26);
insert into Libro (codice, titolo, copiedisponibili) values ('000087', 'BatBattle for Marjah, The', 22);
insert into Libro (codice, titolo, copiedisponibili) values ('009398', 'Little Shop of Horrors, The', 21);
insert into Libro (codice, titolo, copiedisponibili) values ('004904', 'ArsenalArsenalArseArsenal', 34);
insert into Libro (codice, titolo, copiedisponibili) values ('004678', 'Time of Favor (Ha-Hesder)', 31);
insert into Libro (codice, titolo, copiedisponibili) values ('003644', 'Divorcing JDivorcing Jack', 47);
insert into Libro (codice, titolo, copiedisponibili) values ('009473', 'LLife Is Hot in Cracktown', 8);
insert into Libro (codice, titolo, copiedisponibili) values ('003273', 'Murder Murder by Contract', 17);
insert into Libro (codice, titolo, copiedisponibili) values ('003994', 'Dr. GigglesDr.Dr. Giggles', 24);
insert into Libro (codice, titolo, copiedisponibili) values ('004092', 'EvitaEvitaEvitaEvitaEvita', 24);
insert into Libro (codice, titolo, copiedisponibili) values ('007991', 'ScroogeScroogeScroScrooge', 21);
insert into Libro (codice, titolo, copiedisponibili) values ('003060', 'Kill BilKill Bill: Vol. 2', 17);
insert into Libro (codice, titolo, copiedisponibili) values ('002780', 'BlacksmitBlacksmith Scene', 10);
insert into Libro (codice, titolo, copiedisponibili) values ('002821', 'Red HillRed HillRRed Hill', 2);
insert into Libro (codice, titolo, copiedisponibili) values ('003619', 'Waiting Waiting Game, The', 46);
insert into Libro (codice, titolo, copiedisponibili) values ('008945', 'SinghamSinghamSingSingham', 44);
insert into Libro (codice, titolo, copiedisponibili) values ('005956', 'Wild AngeWild Angels, The', 15);
insert into Libro (codice, titolo, copiedisponibili) values ('003930', 'CaCapture of Bigfoot, The', 23);
insert into Libro (codice, titolo, copiedisponibili) values ('000922', 'Puffy ChaPuffy Chair, The', 27);
insert into Libro (codice, titolo, copiedisponibili) values ('007693', 'CinemaniaCinemanCinemania', 47);
insert into Libro (codice, titolo, copiedisponibili) values ('005892', 'ThisThis Ain''t California', 1);
insert into Libro (codice, titolo, copiedisponibili) values ('009992', 'Mrs. DallowaMrs. Dalloway', 26);
insert into Libro (codice, titolo, copiedisponibili) values ('005863', 'LighLightning in a Bottle', 41);
insert into Libro (codice, titolo, copiedisponibili) values ('008954', 'So Much SoSo Much So Fast', 12);
insert into Libro (codice, titolo, copiedisponibili) values ('004661', 'Jar City Jar City (Mýrin)', 48);
insert into Libro (codice, titolo, copiedisponibili) values ('003345', 'StrongmanStrongmStrongman', 20);
insert into Libro (codice, titolo, copiedisponibili) values ('003115', 'Sacrifice (Zhao shi gu er)', 33);
 
use biblioteca;
DELETE FROM Edizione WHERE ISBN<>'2';
 
insert into Edizione (ISBN, annostampa, edizione) values ('1969622850542', 1982, 4);
insert into Edizione (ISBN, annostampa, edizione) values ('7961741236023', 2015, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('1940513319810', 1977, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('1482956256385', 1951, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('3573178933705', 1973, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('3161175649538', 2006, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('6378994950540', 2013, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('7586343284371', 1918, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('0696823370929', 1929, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('5192888340317', 1930, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('1437076659289', 2000, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('8382785689910', 1983, 4);
insert into Edizione (ISBN, annostampa, edizione) values ('7085513026217', 2022, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('3353803610723', 1925, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('3343630424308', 2017, 2);
insert into Edizione (ISBN, annostampa, edizione) values ('4577418808660', 1957, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('6379479426872', 1909, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('9514383949627', 1928, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('3030858899803', 2005, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('0107015336432', 1919, 2);
insert into Edizione (ISBN, annostampa, edizione) values ('1107017125956', 1984, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('7381951160028', 1907, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('9429059845192', 1998, 4);
insert into Edizione (ISBN, annostampa, edizione) values ('2035427430292', 1960, 5);
insert into Edizione (ISBN, annostampa, edizione) values ('4650716741450', 2002, 5);
insert into Edizione (ISBN, annostampa, edizione) values ('6228506839631', 1994, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('9911499577127', 2017, 4);
insert into Edizione (ISBN, annostampa, edizione) values ('6829172967314', 1963, 2);
insert into Edizione (ISBN, annostampa, edizione) values ('3634731735355', 1938, 5);
insert into Edizione (ISBN, annostampa, edizione) values ('9386711644229', 1929, 2);
insert into Edizione (ISBN, annostampa, edizione) values ('3268642246776', 1930, 4);
insert into Edizione (ISBN, annostampa, edizione) values ('6132944481461', 2010, 5);
insert into Edizione (ISBN, annostampa, edizione) values ('7905826758431', 1907, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('4094150739122', 1985, 5);
insert into Edizione (ISBN, annostampa, edizione) values ('6491649799276', 2019, 2);
insert into Edizione (ISBN, annostampa, edizione) values ('3600319886112', 1946, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('7566209793284', 1901, 4);
insert into Edizione (ISBN, annostampa, edizione) values ('9856397308842', 1924, 2);
insert into Edizione (ISBN, annostampa, edizione) values ('3395040904233', 1937, 2);
insert into Edizione (ISBN, annostampa, edizione) values ('9598606106893', 1927, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('5502697937517', 2015, 4);
insert into Edizione (ISBN, annostampa, edizione) values ('2430137283232', 1940, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('6834910159952', 1923, 1);
insert into Edizione (ISBN, annostampa, edizione) values ('4096333205216', 1935, 3);
insert into Edizione (ISBN, annostampa, edizione) values ('4651041540964', 1962, 5);
insert into Edizione (ISBN, annostampa, edizione) values ('0352215142017', 1959, 4);
insert into Edizione (ISBN, annostampa, edizione) values ('6292650922705', 1950, 2);
insert into Edizione (ISBN, annostampa, edizione) values ('7171082165617', 1924, 4);
insert into Edizione (ISBN, annostampa, edizione) values ('0501314854181', 1949, 2);
insert into Edizione (ISBN, annostampa, edizione) values ('7698283824731', 1960, 3);
 
use biblioteca;
DELETE FROM Genere WHERE codicegenere<>'2';
 
insert into Genere (codicegenere, nome) values ('40048814', 'nero');
insert into Genere (codicegenere, nome) values ('84642529', 'giallo');
insert into Genere (codicegenere, nome) values ('14797611', 'rosa');
insert into Genere (codicegenere, nome) values ('70142676', 'giallo');
insert into Genere (codicegenere, nome) values ('64640056', 'nero');
insert into Genere (codicegenere, nome) values ('90103672', 'nero');
insert into Genere (codicegenere, nome) values ('17210438', 'rosa');
insert into Genere (codicegenere, nome) values ('32054546', 'rosa');
insert into Genere (codicegenere, nome) values ('96829980', 'nero');
insert into Genere (codicegenere, nome) values ('32211227', 'rosa');
insert into Genere (codicegenere, nome) values ('83190944', 'giallo');
insert into Genere (codicegenere, nome) values ('75948431', 'giallo');
insert into Genere (codicegenere, nome) values ('29379870', 'rosa');
insert into Genere (codicegenere, nome) values ('33524566', 'nero');
insert into Genere (codicegenere, nome) values ('87658693', 'nero');
insert into Genere (codicegenere, nome) values ('93040261', 'giallo');
insert into Genere (codicegenere, nome) values ('13659321', 'nero');
insert into Genere (codicegenere, nome) values ('65868432', 'nero');
insert into Genere (codicegenere, nome) values ('82119966', 'giallo');
insert into Genere (codicegenere, nome) values ('59479734', 'nero');
insert into Genere (codicegenere, nome) values ('94950246', 'nero');
insert into Genere (codicegenere, nome) values ('39629728', 'rosa');
insert into Genere (codicegenere, nome) values ('01772316', 'nero');
insert into Genere (codicegenere, nome) values ('08256857', 'rosa');
insert into Genere (codicegenere, nome) values ('94113679', 'nero');
insert into Genere (codicegenere, nome) values ('69354627', 'nero');
insert into Genere (codicegenere, nome) values ('47482834', 'nero');
insert into Genere (codicegenere, nome) values ('35015496', 'giallo');
insert into Genere (codicegenere, nome) values ('12952416', 'giallo');
insert into Genere (codicegenere, nome) values ('58286383', 'giallo');
insert into Genere (codicegenere, nome) values ('72965244', 'giallo');
insert into Genere (codicegenere, nome) values ('80249876', 'rosa');
insert into Genere (codicegenere, nome) values ('10859504', 'nero');
insert into Genere (codicegenere, nome) values ('59531362', 'rosa');
insert into Genere (codicegenere, nome) values ('55936388', 'nero');
insert into Genere (codicegenere, nome) values ('09821060', 'rosa');
insert into Genere (codicegenere, nome) values ('34139269', 'rosa');
insert into Genere (codicegenere, nome) values ('56754876', 'nero');
insert into Genere (codicegenere, nome) values ('17208826', 'giallo');
insert into Genere (codicegenere, nome) values ('75387540', 'giallo');
insert into Genere (codicegenere, nome) values ('10432281', 'rosa');
insert into Genere (codicegenere, nome) values ('15764435', 'giallo');
insert into Genere (codicegenere, nome) values ('70052606', 'nero');
insert into Genere (codicegenere, nome) values ('22471034', 'giallo');
insert into Genere (codicegenere, nome) values ('03172837', 'nero');
insert into Genere (codicegenere, nome) values ('66191975', 'giallo');
insert into Genere (codicegenere, nome) values ('52261303', 'nero');
insert into Genere (codicegenere, nome) values ('93870630', 'giallo');
insert into Genere (codicegenere, nome) values ('66348087', 'rosa');
insert into Genere (codicegenere, nome) values ('79639204', 'giallo');
 
use biblioteca;
DELETE FROM Autore WHERE codiceautore<>'2';
 
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('178472', 'Janaye', 'Rapson', 'Philippines', 'rinascimento', '1855-12-08', '1912-02-19');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('538704', 'Conrade', 'Shakelade', 'Peru', 'illuminismo', '1892-08-11', '1932-09-09');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('940929', 'Sayer', 'Trenoweth', 'Japan', 'illuminismo', '1879-10-05', '1949-08-16');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('786898', 'Glenda', 'Docksey', 'Nigeria', 'rinascimento', '1845-10-20', '1927-10-09');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('872000', 'Bird', 'Storrah', 'China', 'illuminismo', '1851-07-15', '1945-02-07');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('882947', 'Killy', 'Dumigan', 'China', 'illuminismo', '1888-01-18', null);
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('267659', 'Maria', 'Mines', 'Philippines', 'rinascimento', '1813-06-26', '1932-03-08');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('270934', 'Nonna', 'Bagnal', 'China', 'rinascimento', '1882-08-02', '1935-10-16');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('955871', 'Cristionna', 'McCourt', 'China', 'illuminismo', '1838-04-24', '1915-06-08');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('929974', 'Britt', 'Petkovic', 'Poland', 'illuminismo', '1886-08-25', '1918-07-12');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('919032', 'Robbie', 'Youhill', 'Argentina', 'illuminismo', '1803-05-23', '1942-04-23');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('036460', 'Kirstyn', 'Popescu', 'Indonesia', 'rinascimento', '1854-03-07', null);
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('289644', 'Alayne', 'Pinard', 'Portugal', 'illuminismo', '1894-11-28', '1932-05-13');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('147190', 'Lezlie', 'Ashley', 'Brazil', 'rinascimento', '1865-03-03', null);
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('424903', 'Maddalena', 'Augie', 'Philippines', 'illuminismo', '1805-12-22', '1912-07-02');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('889474', 'Lilla', 'Cruz', 'China', 'illuminismo', '1813-10-01', '1937-01-24');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('620474', 'Hasheem', 'Binder', 'Syria', 'illuminismo', '1804-06-23', '1915-06-26');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('515144', 'Christian', 'Prettjohn', 'Russia', 'illuminismo', '1820-04-20', '1949-09-14');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('788705', 'Parry', 'Iglesias', 'China', 'rinascimento', '1836-11-04', '1946-03-02');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('391749', 'Matthus', 'Kingscote', 'Mozambique', 'rinascimento', '1835-07-16', '1934-08-08');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('876077', 'Elspeth', 'Eastment', 'China', 'illuminismo', '1836-05-16', '1911-12-08');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('372016', 'Reamonn', 'Jenman', 'China', 'rinascimento', '1891-03-03', '1928-09-02');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('741002', 'Mitch', 'Duberry', 'Moldova', 'illuminismo', '1839-07-26', '1926-05-30');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('053700', 'Gabey', 'Sickling', 'Poland', 'illuminismo', '1860-06-06', '1929-08-30');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('188541', 'Demetri', 'Crann', 'China', 'rinascimento', '1869-12-26', '1916-12-30');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('410890', 'Nevsa', 'Fullerton', 'Latvia', 'rinascimento', '1882-03-25', '1925-10-18');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('070813', 'Tamas', 'Ruppertz', 'Portugal', 'rinascimento', '1879-12-15', '1918-12-22');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('015227', 'Brockie', 'Getcliffe', 'France', 'illuminismo', '1837-07-17', '1918-08-07');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('500560', 'Flss', 'Ashtonhurst', 'Peru', 'rinascimento', '1879-08-27', '1916-11-04');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('415601', 'Randie', 'Josifovitz', 'France', 'illuminismo', '1859-09-09', '1939-11-19');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('215150', 'Husain', 'Pritchett', 'United States', 'rinascimento', '1828-09-07', '1929-11-24');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('810323', 'Durand', 'Wandless', 'Indonesia', 'illuminismo', '1802-06-07', '1915-08-25');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('933420', 'Olivier', 'Garritley', 'China', 'rinascimento', '1866-08-10', '1914-07-23');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('240394', 'Heath', 'Grevile', 'Serbia', 'rinascimento', '1823-07-17', '1921-01-15');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('659412', 'Salvidor', 'Bouskill', 'Russia', 'rinascimento', '1883-09-28', '1944-02-02');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('606317', 'Hasty', 'Fairbrother', 'Indonesia', 'illuminismo', '1827-05-01', '1923-03-11');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('834709', 'Kathlin', 'Lemmer', 'France', 'rinascimento', '1838-11-19', '1934-08-10');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('365706', 'Michaelina', 'De Maine', 'Jordan', 'illuminismo', '1804-12-13', '1911-11-13');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('915339', 'Iolanthe', 'McKleod', 'Philippines', 'rinascimento', '1823-10-24', '1914-07-29');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('589547', 'Shellie', 'Physic', 'Argentina', 'rinascimento', '1868-01-24', '1950-07-05');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('703692', 'Sarina', 'Payley', 'China', 'rinascimento', '1887-04-22', '1939-12-26');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('853554', 'Roslyn', 'Heisler', 'Brazil', 'illuminismo', '1875-02-20', '1949-09-05');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('519898', 'Therese', 'Bembridge', 'Jordan', 'rinascimento', '1873-10-07', '1945-03-01');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('082963', 'Mallory', 'Werlock', 'China', 'rinascimento', '1832-02-10', '1937-11-17');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('029374', 'Jackquelin', 'Weare', 'Thailand', 'rinascimento', '1816-11-09', '1927-09-17');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('308719', 'Rubetta', 'Frickey', 'Kiribati', 'rinascimento', '1890-03-09', '1920-01-30');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('092383', 'Eunice', 'Kelf', 'Russia', 'rinascimento', '1866-01-21', '1935-10-19');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('219283', 'Franklyn', 'Everett', 'Peru', 'illuminismo', '1821-01-20', '1912-11-16');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('641662', 'Niels', 'Dast', 'Japan', 'illuminismo', '1808-03-16', '1949-12-09');
insert into Autore (codiceautore, nome, cognome, nazionalita, epoca, datanascita, datamorte) values ('726157', 'Freda', 'Corroyer', 'Greece', 'rinascimento', '1891-02-11', '1920-10-07');
 
use biblioteca;
DELETE FROM Consultazione WHERE matricolasocio<>'2';
 
insert into Consultazione (matricolasocio, codicerivista) values ('000242', '004646');
insert into Consultazione (matricolasocio, codicerivista) values ('001535', '006941');
insert into Consultazione (matricolasocio, codicerivista) values ('001535', '006846');
insert into Consultazione (matricolasocio, codicerivista) values ('003811', '005332');
insert into Consultazione (matricolasocio, codicerivista) values ('001256', '005829');
insert into Consultazione (matricolasocio, codicerivista) values ('000734', '005669');
insert into Consultazione (matricolasocio, codicerivista) values ('001848', '007075');
insert into Consultazione (matricolasocio, codicerivista) values ('006188', '006436');
insert into Consultazione (matricolasocio, codicerivista) values ('009231', '005874');
insert into Consultazione (matricolasocio, codicerivista) values ('001803', '008310');
insert into Consultazione (matricolasocio, codicerivista) values ('002478', '009532');
insert into Consultazione (matricolasocio, codicerivista) values ('004129', '001563');
insert into Consultazione (matricolasocio, codicerivista) values ('008600', '002271');
insert into Consultazione (matricolasocio, codicerivista) values ('000103', '002862');
insert into Consultazione (matricolasocio, codicerivista) values ('008811', '002729');
insert into Consultazione (matricolasocio, codicerivista) values ('007941', '005829');
insert into Consultazione (matricolasocio, codicerivista) values ('007798', '007075');
insert into Consultazione (matricolasocio, codicerivista) values ('000624', '006876');
insert into Consultazione (matricolasocio, codicerivista) values ('009673', '004807');
insert into Consultazione (matricolasocio, codicerivista) values ('001985', '006142');
insert into Consultazione (matricolasocio, codicerivista) values ('008015', '002271');
insert into Consultazione (matricolasocio, codicerivista) values ('008044', '007075');
insert into Consultazione (matricolasocio, codicerivista) values ('008736', '008699');
insert into Consultazione (matricolasocio, codicerivista) values ('001256', '002804');
insert into Consultazione (matricolasocio, codicerivista) values ('003741', '009528');
insert into Consultazione (matricolasocio, codicerivista) values ('004019', '001079');
insert into Consultazione (matricolasocio, codicerivista) values ('009721', '005332');
insert into Consultazione (matricolasocio, codicerivista) values ('008015', '005221');
insert into Consultazione (matricolasocio, codicerivista) values ('003741', '007251');
insert into Consultazione (matricolasocio, codicerivista) values ('008015', '005829');
insert into Consultazione (matricolasocio, codicerivista) values ('006807', '008310');
insert into Consultazione (matricolasocio, codicerivista) values ('007613', '008955');
insert into Consultazione (matricolasocio, codicerivista) values ('006188', '008364');
insert into Consultazione (matricolasocio, codicerivista) values ('008181', '005420');
insert into Consultazione (matricolasocio, codicerivista) values ('004757', '000772');
insert into Consultazione (matricolasocio, codicerivista) values ('003151', '005420');
insert into Consultazione (matricolasocio, codicerivista) values ('007278', '005332');
insert into Consultazione (matricolasocio, codicerivista) values ('000242', '005829');
insert into Consultazione (matricolasocio, codicerivista) values ('003573', '007530');
insert into Consultazione (matricolasocio, codicerivista) values ('001535', '001563');
insert into Consultazione (matricolasocio, codicerivista) values ('006188', '000599');
insert into Consultazione (matricolasocio, codicerivista) values ('003664', '000599');
insert into Consultazione (matricolasocio, codicerivista) values ('008044', '001563');
insert into Consultazione (matricolasocio, codicerivista) values ('001402', '006436');
insert into Consultazione (matricolasocio, codicerivista) values ('000103', '005669');
insert into Consultazione (matricolasocio, codicerivista) values ('009419', '005082');
insert into Consultazione (matricolasocio, codicerivista) values ('001947', '001324');
insert into Consultazione (matricolasocio, codicerivista) values ('009721', '007075');
insert into Consultazione (matricolasocio, codicerivista) values ('008943', '006846');
insert into Consultazione (matricolasocio, codicerivista) values ('004019', '003981');
insert into Consultazione (matricolasocio, codicerivista) values ('009827', '009528');
insert into Consultazione (matricolasocio, codicerivista) values ('008015', '003403');
insert into Consultazione (matricolasocio, codicerivista) values ('001688', '007075');
insert into Consultazione (matricolasocio, codicerivista) values ('003809', '001111');
insert into Consultazione (matricolasocio, codicerivista) values ('005071', '007300');
insert into Consultazione (matricolasocio, codicerivista) values ('000457', '005420');
insert into Consultazione (matricolasocio, codicerivista) values ('009787', '005818');
insert into Consultazione (matricolasocio, codicerivista) values ('001535', '008769');
insert into Consultazione (matricolasocio, codicerivista) values ('005896', '009532');
insert into Consultazione (matricolasocio, codicerivista) values ('008636', '002804');
insert into Consultazione (matricolasocio, codicerivista) values ('009810', '007075');
insert into Consultazione (matricolasocio, codicerivista) values ('000624', '006846');
insert into Consultazione (matricolasocio, codicerivista) values ('000624', '009532');
insert into Consultazione (matricolasocio, codicerivista) values ('001806', '001079');
insert into Consultazione (matricolasocio, codicerivista) values ('008811', '001079');
insert into Consultazione (matricolasocio, codicerivista) values ('004019', '005420');
insert into Consultazione (matricolasocio, codicerivista) values ('006035', '001366');
insert into Consultazione (matricolasocio, codicerivista) values ('001535', '006142');
insert into Consultazione (matricolasocio, codicerivista) values ('009827', '006876');
insert into Consultazione (matricolasocio, codicerivista) values ('006188', '005082');
insert into Consultazione (matricolasocio, codicerivista) values ('009827', '009532');
insert into Consultazione (matricolasocio, codicerivista) values ('008015', '003290');
insert into Consultazione (matricolasocio, codicerivista) values ('004926', '009528');
insert into Consultazione (matricolasocio, codicerivista) values ('002617', '007530');
insert into Consultazione (matricolasocio, codicerivista) values ('003809', '006941');
insert into Consultazione (matricolasocio, codicerivista) values ('009432', '005407');
insert into Consultazione (matricolasocio, codicerivista) values ('009429', '001541');
insert into Consultazione (matricolasocio, codicerivista) values ('006570', '002622');
insert into Consultazione (matricolasocio, codicerivista) values ('007537', '002729');
insert into Consultazione (matricolasocio, codicerivista) values ('004757', '008284');
insert into Consultazione (matricolasocio, codicerivista) values ('006860', '001111');
insert into Consultazione (matricolasocio, codicerivista) values ('008943', '001111');
insert into Consultazione (matricolasocio, codicerivista) values ('003664', '006952');
insert into Consultazione (matricolasocio, codicerivista) values ('003296', '006436');
insert into Consultazione (matricolasocio, codicerivista) values ('007225', '008364');
insert into Consultazione (matricolasocio, codicerivista) values ('008415', '006941');
insert into Consultazione (matricolasocio, codicerivista) values ('005071', '006941');
insert into Consultazione (matricolasocio, codicerivista) values ('002735', '005829');
insert into Consultazione (matricolasocio, codicerivista) values ('009827', '001072');
insert into Consultazione (matricolasocio, codicerivista) values ('000943', '009380');
insert into Consultazione (matricolasocio, codicerivista) values ('004420', '006436');
insert into Consultazione (matricolasocio, codicerivista) values ('008009', '005874');
insert into Consultazione (matricolasocio, codicerivista) values ('001402', '003822');
insert into Consultazione (matricolasocio, codicerivista) values ('002742', '009369');
insert into Consultazione (matricolasocio, codicerivista) values ('001256', '008955');
insert into Consultazione (matricolasocio, codicerivista) values ('004083', '005221');
insert into Consultazione (matricolasocio, codicerivista) values ('001256', '003290');
insert into Consultazione (matricolasocio, codicerivista) values ('009432', '002729');
insert into Consultazione (matricolasocio, codicerivista) values ('001004', '004499');
insert into Consultazione (matricolasocio, codicerivista) values ('004926', '001324');
 
use biblioteca;
DELETE FROM Copia WHERE codicecatalogazione<>'2';
 
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('880438', 'Nuovo', '008954', '1482956256385');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('375640', 'Usato', '009658', '1437076659289');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('981376', 'Nuovo', '000087', '9429059845192');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('167267', 'Usato', '000087', '1437076659289');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('220145', 'Usato', '003172', '4650716741450');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('033280', 'Usato', '006785', '5192888340317');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('448525', 'Nuovo', '003172', '4096333205216');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('584034', 'Nuovo', '002885', '4650716741450');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('904559', 'Usato', '005863', '9386711644229');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('007165', 'Nuovo', '007693', '0352215142017');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('653045', 'Usato', '003598', '7586343284371');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('595082', 'Nuovo', '004092', '1437076659289');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('918803', 'Nuovo', '003930', '0352215142017');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('184404', 'Usato', '000087', '6292650922705');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('388745', 'Nuovo', '002780', '6292650922705');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('083435', 'Usato', '002746', '0696823370929');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('742435', 'Nuovo', '005346', '3600319886112');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('857945', 'Nuovo', '002780', '0107015336432');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('233530', 'Nuovo', '003930', '5502697937517');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('392998', 'Usato', '005892', '7586343284371');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('462075', 'Nuovo', '008626', '8382785689910');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('183534', 'Nuovo', '000922', '2035427430292');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('288929', 'Nuovo', '004678', '0352215142017');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('143901', 'Usato', '009398', '8382785689910');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('335848', 'Nuovo', '003345', '1969622850542');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('168354', 'Usato', '006785', '0352215142017');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('360820', 'Nuovo', '000051', '6132944481461');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('540347', 'Usato', '003115', '1107017125956');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('828994', 'Nuovo', '006785', '6829172967314');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('028753', 'Usato', '003172', '7381951160028');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('130208', 'Usato', '003994', '5502697937517');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('608852', 'Nuovo', '002780', '1940513319810');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('287257', 'Nuovo', '004092', '6228506839631');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('845563', 'Usato', '003644', '0107015336432');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('368641', 'Usato', '001128', '1969622850542');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('043040', 'Usato', '008954', '0352215142017');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('161120', 'Usato', '005749', '5502697937517');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('042723', 'Nuovo', '009398', '7381951160028');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('087286', 'Nuovo', '008626', '3573178933705');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('928790', 'Usato', '004092', '4096333205216');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('740041', 'Nuovo', '005956', '1482956256385');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('596052', 'Usato', '005892', '9386711644229');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('482485', 'Nuovo', '008945', '3268642246776');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('518692', 'Nuovo', '006785', '6132944481461');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('867961', 'Usato', '004092', '3353803610723');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('229886', 'Usato', '005892', '9598606106893');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('425715', 'Usato', '003598', '7171082165617');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('158356', 'Usato', '006785', '4096333205216');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('909954', 'Nuovo', '000922', '6228506839631');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('420203', 'Usato', '002821', '2035427430292');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('544959', 'Usato', '003172', '3161175649538');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('707981', 'Usato', '007991', '7566209793284');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('851822', 'Usato', '009658', '6132944481461');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('491950', 'Usato', '005749', '7698283824731');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('972295', 'Nuovo', '000051', '3353803610723');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('929111', 'Nuovo', '000922', '4650716741450');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('804538', 'Usato', '008945', '1107017125956');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('806601', 'Nuovo', '005346', '6491649799276');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('877766', 'Usato', '008945', '0107015336432');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('757941', 'Nuovo', '007827', '4577418808660');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('854739', 'Nuovo', '009398', '1107017125956');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('747759', 'Nuovo', '003644', '6132944481461');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('280488', 'Nuovo', '009473', '4650716741450');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('862875', 'Nuovo', '003115', '2430137283232');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('797120', 'Usato', '002821', '0501314854181');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('175691', 'Usato', '003172', '3268642246776');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('186088', 'Usato', '003345', '7961741236023');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('152384', 'Usato', '003598', '3343630424308');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('633935', 'Usato', '008945', '7381951160028');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('603084', 'Nuovo', '007693', '9386711644229');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('219947', 'Usato', '003060', '1437076659289');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('709752', 'Usato', '000087', '2430137283232');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('398872', 'Nuovo', '000277', '7085513026217');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('888414', 'Nuovo', '004904', '9386711644229');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('960771', 'Usato', '009473', '6491649799276');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('029621', 'Nuovo', '003345', '2430137283232');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('476629', 'Usato', '000087', '1482956256385');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('764344', 'Nuovo', '003930', '7085513026217');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('600254', 'Usato', '002821', '5502697937517');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('876339', 'Nuovo', '003345', '6378994950540');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('940272', 'Nuovo', '003644', '5192888340317');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('057315', 'Usato', '004678', '1482956256385');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('043828', 'Nuovo', '003644', '4650716741450');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('658039', 'Usato', '004092', '3600319886112');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('372871', 'Nuovo', '008945', '3573178933705');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('390501', 'Usato', '000051', '9911499577127');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('859929', 'Nuovo', '008626', '3030858899803');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('674738', 'Usato', '003644', '3395040904233');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('970297', 'Nuovo', '000277', '4096333205216');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('767800', 'Nuovo', '007693', '3600319886112');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('794896', 'Usato', '007991', '3343630424308');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('730778', 'Usato', '005346', '5502697937517');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('926058', 'Usato', '008945', '6829172967314');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('823705', 'Usato', '000277', '6378994950540');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('278260', 'Nuovo', '004092', '7961741236023');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('469860', 'Nuovo', '009992', '3030858899803');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('920973', 'Usato', '009473', '2430137283232');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('415217', 'Usato', '003273', '7905826758431');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('775188', 'Nuovo', '006785', '7085513026217');
 
 
use biblioteca;
DELETE FROM Prestito WHERE matricola<>'2';
 
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('008600', '083435', '2022-03-15', '2022-05-11', 5);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005293', '904559', '2022-02-27', null, 52);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('008943', '764344', '2022-03-23', '2022-05-03', 14);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009787', '909954', '2022-01-09', null, 43);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('007613', '360820', '2022-01-29', null, 46);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001999', '219947', '2022-01-19', '2022-04-23', 5);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('000242', '152384', '2022-02-28', null, 40);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005668', '653045', '2022-03-09', null, 34);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006448', '278260', '2022-01-19', '2022-04-07', 29);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009419', '828994', '2022-01-08', '2022-04-29', 44);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009810', '888414', '2022-03-11', '2022-06-04', 35);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005896', '764344', '2022-01-20', '2022-04-14', 23);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('008636', '287257', '2022-03-07', '2022-04-16', 53);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003809', '888414', '2022-03-03', '2022-04-29', 20);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006581', '388745', '2022-01-20', '2022-06-08', 11);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('004083', '233530', '2022-03-31', null, 43);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003151', '970297', '2022-03-17', '2022-05-30', 41);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('008636', '859929', '2022-02-02', '2022-04-17', 43);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002742', '918803', '2022-01-30', '2022-04-14', 59);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002759', '390501', '2022-04-01', '2022-05-15', 47);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009997', '220145', '2022-01-06', '2022-05-22', 29);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002478', '175691', '2022-03-28', '2022-05-27', 58);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('004019', '158356', '2022-01-06', '2022-04-18', 5);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001535', '398872', '2022-03-10', '2022-04-09', 24);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003809', '926058', '2022-04-04', null, 17);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001535', '851822', '2022-02-24', '2022-04-21', 36);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006860', '158356', '2022-01-23', '2022-04-20', 22);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005499', '926058', '2022-03-20', '2022-04-18', 54);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002253', '707981', '2022-02-11', '2022-05-29', 33);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006722', '028753', '2022-03-11', '2022-04-18', 53);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009004', '730778', '2022-03-05', '2022-05-06', 36);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005668', '476629', '2022-01-10', '2022-05-09', 6);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009787', '028753', '2022-01-12', '2022-05-02', 55);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003809', '600254', '2022-02-16', '2022-05-10', 37);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001803', '600254', '2022-02-20', null, 53);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002617', '877766', '2022-01-07', '2022-05-18', 19);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001256', '584034', '2022-01-07', '2022-05-20', 44);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('004019', '186088', '2022-02-28', '2022-05-26', 42);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005668', '398872', '2022-03-18', '2022-05-11', 40);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002742', '186088', '2022-03-26', '2022-06-06', 2);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('008600', '904559', '2022-03-18', '2022-05-07', 59);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('008636', '335848', '2022-01-30', null, 2);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002478', '600254', '2022-03-23', '2022-06-04', 57);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('007613', '168354', '2022-02-01', '2022-04-22', 47);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('007225', '398872', '2022-03-04', '2022-04-20', 4);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009787', '540347', '2022-03-21', '2022-05-20', 53);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001256', '658039', '2022-03-13', null, 1);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001806', '876339', '2022-01-23', null, 14);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003573', '130208', '2022-01-07', '2022-04-11', 10);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002742', '469860', '2022-02-02', '2022-04-29', 30);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('004915', '596052', '2022-01-06', '2022-06-06', 51);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('007798', '007165', '2022-03-02', '2022-05-28', 5);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('008600', '608852', '2022-01-04', '2022-06-04', 53);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005468', '029621', '2022-01-25', '2022-06-01', 4);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006570', '972295', '2022-02-06', '2022-05-29', 22);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005896', '940272', '2022-01-10', '2022-04-27', 41);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006807', '926058', '2022-01-17', '2022-05-31', 7);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003741', '033280', '2022-03-13', null, 31);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001256', '143901', '2022-01-31', '2022-05-19', 38);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002759', '042723', '2022-01-21', '2022-05-20', 8);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001806', '043828', '2022-02-06', null, 25);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009459', '161120', '2022-02-08', '2022-05-07', 24);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003351', '335848', '2022-03-17', '2022-05-02', 44);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009673', '929111', '2022-02-13', '2022-04-13', 31);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002742', '161120', '2022-01-26', null, 39);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009827', '029621', '2022-03-08', '2022-04-14', 30);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003741', '742435', '2022-02-08', '2022-05-28', 47);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006188', '709752', '2022-01-10', '2022-05-28', 43);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006581', '674738', '2022-03-01', '2022-04-29', 44);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002478', '482485', '2022-03-01', '2022-05-03', 35);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006570', '972295', '2022-02-24', '2022-04-13', 32);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005339', '420203', '2022-01-12', '2022-05-25', 30);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009721', '043828', '2022-02-20', '2022-04-18', 30);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006570', '476629', '2022-03-23', '2022-04-24', 13);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('000103', '730778', '2022-03-24', '2022-05-09', 57);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002542', '476629', '2022-02-06', '2022-04-26', 26);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('008943', '219947', '2022-03-17', '2022-05-23', 56);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003809', '909954', '2022-01-06', '2022-04-14', 58);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('004757', '491950', '2022-01-29', '2022-04-29', 44);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003296', '388745', '2022-02-26', null, 8);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('004757', '764344', '2022-03-04', null, 4);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('000974', '469860', '2022-01-16', '2022-05-22', 2);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('006860', '845563', '2022-03-25', '2022-04-17', 56);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001256', '278260', '2022-02-09', '2022-04-22', 2);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005071', '600254', '2022-03-06', '2022-04-13', 39);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('003573', '130208', '2022-02-24', '2022-04-11', 26);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001004', '219947', '2022-03-13', '2022-04-16', 21);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002735', '920973', '2022-03-15', null, 24);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('008943', '909954', '2022-03-14', '2022-04-25', 59);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('000624', '233530', '2022-03-20', '2022-04-14', 40);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('000287', '388745', '2022-01-17', null, 35);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009432', '960771', '2022-04-03', '2022-04-24', 13);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009459', '175691', '2022-01-06', '2022-06-05', 8);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009004', '851822', '2022-02-25', '2022-04-07', 32);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('005071', '415217', '2022-02-19', null, 36);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('001402', '184404', '2022-03-24', '2022-06-02', 47);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('004129', '764344', '2022-02-18', '2022-04-16', 23);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('002542', '877766', '2022-02-14', null, 1);
insert into Prestito (matricola, codicecatalogazione, dataprestito, datarestituzione, durataprestito) values ('009827', '043040', '2022-04-02', '2022-05-30', 29);
 
 
use biblioteca;
DELETE FROM Scrittura WHERE codicelibro<>'2';
 
insert into Scrittura (codicelibro, codiceautore) values ('009992', '786898');
insert into Scrittura (codicelibro, codiceautore) values ('000277', '882947');
insert into Scrittura (codicelibro, codiceautore) values ('007693', '915339');
insert into Scrittura (codicelibro, codiceautore) values ('002746', '015227');
insert into Scrittura (codicelibro, codiceautore) values ('002780', '919032');
insert into Scrittura (codicelibro, codiceautore) values ('003644', '036460');
insert into Scrittura (codicelibro, codiceautore) values ('009658', '726157');
insert into Scrittura (codicelibro, codiceautore) values ('008954', '889474');
insert into Scrittura (codicelibro, codiceautore) values ('004678', '955871');
insert into Scrittura (codicelibro, codiceautore) values ('003619', '589547');
insert into Scrittura (codicelibro, codiceautore) values ('002746', '240394');
insert into Scrittura (codicelibro, codiceautore) values ('003994', '070813');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '308719');
insert into Scrittura (codicelibro, codiceautore) values ('004904', '872000');
insert into Scrittura (codicelibro, codiceautore) values ('003644', '215150');
insert into Scrittura (codicelibro, codiceautore) values ('000922', '915339');
insert into Scrittura (codicelibro, codiceautore) values ('008954', '147190');
insert into Scrittura (codicelibro, codiceautore) values ('009992', '933420');
insert into Scrittura (codicelibro, codiceautore) values ('003172', '853554');
insert into Scrittura (codicelibro, codiceautore) values ('002780', '882947');
insert into Scrittura (codicelibro, codiceautore) values ('003619', '219283');
insert into Scrittura (codicelibro, codiceautore) values ('001128', '929974');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '267659');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '500560');
insert into Scrittura (codicelibro, codiceautore) values ('003994', '788705');
insert into Scrittura (codicelibro, codiceautore) values ('003345', '082963');
insert into Scrittura (codicelibro, codiceautore) values ('004678', '215150');
insert into Scrittura (codicelibro, codiceautore) values ('000277', '240394');
insert into Scrittura (codicelibro, codiceautore) values ('007991', '410890');
insert into Scrittura (codicelibro, codiceautore) values ('005956', '810323');
insert into Scrittura (codicelibro, codiceautore) values ('003172', '889474');
insert into Scrittura (codicelibro, codiceautore) values ('008954', '270934');
insert into Scrittura (codicelibro, codiceautore) values ('002780', '036460');
insert into Scrittura (codicelibro, codiceautore) values ('003994', '215150');
insert into Scrittura (codicelibro, codiceautore) values ('007693', '515144');
insert into Scrittura (codicelibro, codiceautore) values ('000922', '620474');
insert into Scrittura (codicelibro, codiceautore) values ('000922', '178472');
insert into Scrittura (codicelibro, codiceautore) values ('001128', '515144');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '726157');
insert into Scrittura (codicelibro, codiceautore) values ('003619', '036460');
insert into Scrittura (codicelibro, codiceautore) values ('003115', '070813');
insert into Scrittura (codicelibro, codiceautore) values ('003115', '372016');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '519898');
insert into Scrittura (codicelibro, codiceautore) values ('002746', '786898');
insert into Scrittura (codicelibro, codiceautore) values ('009398', '519898');
insert into Scrittura (codicelibro, codiceautore) values ('007693', '053700');
insert into Scrittura (codicelibro, codiceautore) values ('005892', '410890');
insert into Scrittura (codicelibro, codiceautore) values ('009398', '606317');
insert into Scrittura (codicelibro, codiceautore) values ('006785', '308719');
insert into Scrittura (codicelibro, codiceautore) values ('009992', '015227');
insert into Scrittura (codicelibro, codiceautore) values ('003115', '036460');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '882947');
insert into Scrittura (codicelibro, codiceautore) values ('002885', '940929');
insert into Scrittura (codicelibro, codiceautore) values ('007827', '365706');
insert into Scrittura (codicelibro, codiceautore) values ('009992', '538704');
insert into Scrittura (codicelibro, codiceautore) values ('003598', '215150');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '410890');
insert into Scrittura (codicelibro, codiceautore) values ('003273', '308719');
insert into Scrittura (codicelibro, codiceautore) values ('000277', '703692');
insert into Scrittura (codicelibro, codiceautore) values ('000051', '882947');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '589547');
insert into Scrittura (codicelibro, codiceautore) values ('005956', '029374');
insert into Scrittura (codicelibro, codiceautore) values ('009398', '915339');
insert into Scrittura (codicelibro, codiceautore) values ('003060', '659412');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '188541');
insert into Scrittura (codicelibro, codiceautore) values ('000051', '606317');
insert into Scrittura (codicelibro, codiceautore) values ('008945', '955871');
insert into Scrittura (codicelibro, codiceautore) values ('003115', '219283');
insert into Scrittura (codicelibro, codiceautore) values ('000277', '940929');
insert into Scrittura (codicelibro, codiceautore) values ('004092', '933420');
insert into Scrittura (codicelibro, codiceautore) values ('009658', '289644');
insert into Scrittura (codicelibro, codiceautore) values ('002746', '788705');
insert into Scrittura (codicelibro, codiceautore) values ('000277', '391749');
insert into Scrittura (codicelibro, codiceautore) values ('008626', '929974');
insert into Scrittura (codicelibro, codiceautore) values ('002780', '889474');
insert into Scrittura (codicelibro, codiceautore) values ('008945', '589547');
insert into Scrittura (codicelibro, codiceautore) values ('003619', '889474');
insert into Scrittura (codicelibro, codiceautore) values ('003930', '641662');
insert into Scrittura (codicelibro, codiceautore) values ('003644', '620474');
insert into Scrittura (codicelibro, codiceautore) values ('003172', '289644');
insert into Scrittura (codicelibro, codiceautore) values ('005749', '178472');
insert into Scrittura (codicelibro, codiceautore) values ('003994', '929974');
insert into Scrittura (codicelibro, codiceautore) values ('009658', '788705');
insert into Scrittura (codicelibro, codiceautore) values ('001128', '082963');
insert into Scrittura (codicelibro, codiceautore) values ('000087', '015227');
insert into Scrittura (codicelibro, codiceautore) values ('003994', '410890');
insert into Scrittura (codicelibro, codiceautore) values ('009398', '500560');
insert into Scrittura (codicelibro, codiceautore) values ('003172', '410890');
insert into Scrittura (codicelibro, codiceautore) values ('007827', '929974');
insert into Scrittura (codicelibro, codiceautore) values ('001128', '726157');
insert into Scrittura (codicelibro, codiceautore) values ('008954', '788705');
insert into Scrittura (codicelibro, codiceautore) values ('008626', '889474');
insert into Scrittura (codicelibro, codiceautore) values ('003598', '188541');
insert into Scrittura (codicelibro, codiceautore) values ('003994', '365706');
insert into Scrittura (codicelibro, codiceautore) values ('005346', '955871');
insert into Scrittura (codicelibro, codiceautore) values ('004678', '029374');
insert into Scrittura (codicelibro, codiceautore) values ('005892', '788705');
insert into Scrittura (codicelibro, codiceautore) values ('005749', '500560');
 
 
use biblioteca;
DELETE FROM Appartenenza WHERE codicegenere<>'2';
 
insert into Appartenenza (codicegenere, codiceautore) values ('79639204', '810323');
insert into Appartenenza (codicegenere, codiceautore) values ('09821060', '955871');
insert into Appartenenza (codicegenere, codiceautore) values ('58286383', '741002');
insert into Appartenenza (codicegenere, codiceautore) values ('94113679', '029374');
insert into Appartenenza (codicegenere, codiceautore) values ('70142676', '308719');
insert into Appartenenza (codicegenere, codiceautore) values ('93870630', '289644');
insert into Appartenenza (codicegenere, codiceautore) values ('32211227', '876077');
insert into Appartenenza (codicegenere, codiceautore) values ('56754876', '933420');
insert into Appartenenza (codicegenere, codiceautore) values ('32211227', '606317');
insert into Appartenenza (codicegenere, codiceautore) values ('65868432', '919032');
insert into Appartenenza (codicegenere, codiceautore) values ('87658693', '215150');
insert into Appartenenza (codicegenere, codiceautore) values ('66348087', '015227');
insert into Appartenenza (codicegenere, codiceautore) values ('93870630', '620474');
insert into Appartenenza (codicegenere, codiceautore) values ('79639204', '955871');
insert into Appartenenza (codicegenere, codiceautore) values ('12952416', '929974');
insert into Appartenenza (codicegenere, codiceautore) values ('34139269', '424903');
insert into Appartenenza (codicegenere, codiceautore) values ('34139269', '270934');
insert into Appartenenza (codicegenere, codiceautore) values ('90103672', '415601');
insert into Appartenenza (codicegenere, codiceautore) values ('40048814', '424903');
insert into Appartenenza (codicegenere, codiceautore) values ('55936388', '308719');
insert into Appartenenza (codicegenere, codiceautore) values ('79639204', '853554');
insert into Appartenenza (codicegenere, codiceautore) values ('82119966', '188541');
insert into Appartenenza (codicegenere, codiceautore) values ('22471034', '788705');
insert into Appartenenza (codicegenere, codiceautore) values ('90103672', '500560');
insert into Appartenenza (codicegenere, codiceautore) values ('64640056', '834709');
insert into Appartenenza (codicegenere, codiceautore) values ('47482834', '147190');
insert into Appartenenza (codicegenere, codiceautore) values ('10432281', '372016');
insert into Appartenenza (codicegenere, codiceautore) values ('83190944', '270934');
insert into Appartenenza (codicegenere, codiceautore) values ('80249876', '853554');
insert into Appartenenza (codicegenere, codiceautore) values ('75948431', '178472');
insert into Appartenenza (codicegenere, codiceautore) values ('94950246', '070813');
insert into Appartenenza (codicegenere, codiceautore) values ('93870630', '872000');
insert into Appartenenza (codicegenere, codiceautore) values ('09821060', '289644');
insert into Appartenenza (codicegenere, codiceautore) values ('40048814', '834709');
insert into Appartenenza (codicegenere, codiceautore) values ('34139269', '589547');
insert into Appartenenza (codicegenere, codiceautore) values ('72965244', '589547');
insert into Appartenenza (codicegenere, codiceautore) values ('59531362', '070813');
insert into Appartenenza (codicegenere, codiceautore) values ('83190944', '424903');
insert into Appartenenza (codicegenere, codiceautore) values ('56754876', '538704');
insert into Appartenenza (codicegenere, codiceautore) values ('22471034', '929974');
insert into Appartenenza (codicegenere, codiceautore) values ('72965244', '515144');
insert into Appartenenza (codicegenere, codiceautore) values ('64640056', '889474');
insert into Appartenenza (codicegenere, codiceautore) values ('33524566', '215150');
insert into Appartenenza (codicegenere, codiceautore) values ('84642529', '915339');
insert into Appartenenza (codicegenere, codiceautore) values ('03172837', '889474');
insert into Appartenenza (codicegenere, codiceautore) values ('90103672', '029374');
insert into Appartenenza (codicegenere, codiceautore) values ('10859504', '872000');
insert into Appartenenza (codicegenere, codiceautore) values ('01772316', '147190');
insert into Appartenenza (codicegenere, codiceautore) values ('17210438', '267659');
insert into Appartenenza (codicegenere, codiceautore) values ('10432281', '882947');
insert into Appartenenza (codicegenere, codiceautore) values ('22471034', '834709');
insert into Appartenenza (codicegenere, codiceautore) values ('96829980', '955871');
insert into Appartenenza (codicegenere, codiceautore) values ('59531362', '147190');
insert into Appartenenza (codicegenere, codiceautore) values ('09821060', '929974');
insert into Appartenenza (codicegenere, codiceautore) values ('66348087', '589547');
insert into Appartenenza (codicegenere, codiceautore) values ('35015496', '053700');
insert into Appartenenza (codicegenere, codiceautore) values ('69354627', '810323');
insert into Appartenenza (codicegenere, codiceautore) values ('55936388', '082963');
insert into Appartenenza (codicegenere, codiceautore) values ('52261303', '424903');
insert into Appartenenza (codicegenere, codiceautore) values ('87658693', '147190');
insert into Appartenenza (codicegenere, codiceautore) values ('29379870', '955871');
insert into Appartenenza (codicegenere, codiceautore) values ('32211227', '641662');
insert into Appartenenza (codicegenere, codiceautore) values ('14797611', '810323');
insert into Appartenenza (codicegenere, codiceautore) values ('12952416', '308719');
insert into Appartenenza (codicegenere, codiceautore) values ('14797611', '726157');
insert into Appartenenza (codicegenere, codiceautore) values ('93040261', '053700');
insert into Appartenenza (codicegenere, codiceautore) values ('84642529', '872000');
insert into Appartenenza (codicegenere, codiceautore) values ('55936388', '659412');
insert into Appartenenza (codicegenere, codiceautore) values ('15764435', '391749');
insert into Appartenenza (codicegenere, codiceautore) values ('93870630', '876077');
insert into Appartenenza (codicegenere, codiceautore) values ('33524566', '703692');
insert into Appartenenza (codicegenere, codiceautore) values ('03172837', '919032');
insert into Appartenenza (codicegenere, codiceautore) values ('15764435', '372016');
insert into Appartenenza (codicegenere, codiceautore) values ('29379870', '500560');
insert into Appartenenza (codicegenere, codiceautore) values ('80249876', '215150');
insert into Appartenenza (codicegenere, codiceautore) values ('83190944', '515144');
insert into Appartenenza (codicegenere, codiceautore) values ('08256857', '834709');
insert into Appartenenza (codicegenere, codiceautore) values ('94113679', '853554');
insert into Appartenenza (codicegenere, codiceautore) values ('47482834', '036460');
insert into Appartenenza (codicegenere, codiceautore) values ('72965244', '915339');
insert into Appartenenza (codicegenere, codiceautore) values ('10432281', '036460');
insert into Appartenenza (codicegenere, codiceautore) values ('96829980', '933420');
insert into Appartenenza (codicegenere, codiceautore) values ('17210438', '659412');
insert into Appartenenza (codicegenere, codiceautore) values ('70142676', '786898');
insert into Appartenenza (codicegenere, codiceautore) values ('58286383', '538704');
insert into Appartenenza (codicegenere, codiceautore) values ('35015496', '703692');
insert into Appartenenza (codicegenere, codiceautore) values ('96829980', '365706');
insert into Appartenenza (codicegenere, codiceautore) values ('56754876', '215150');
insert into Appartenenza (codicegenere, codiceautore) values ('52261303', '188541');
insert into Appartenenza (codicegenere, codiceautore) values ('13659321', '853554');
insert into Appartenenza (codicegenere, codiceautore) values ('56754876', '703692');
insert into Appartenenza (codicegenere, codiceautore) values ('08256857', '240394');
insert into Appartenenza (codicegenere, codiceautore) values ('35015496', '620474');
insert into Appartenenza (codicegenere, codiceautore) values ('58286383', '620474');
insert into Appartenenza (codicegenere, codiceautore) values ('17210438', '703692');
insert into Appartenenza (codicegenere, codiceautore) values ('64640056', '538704');
insert into Appartenenza (codicegenere, codiceautore) values ('33524566', '606317');
insert into Appartenenza (codicegenere, codiceautore) values ('32054546', '940929');