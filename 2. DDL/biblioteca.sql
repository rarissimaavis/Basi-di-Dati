create database Biblioteca;
use Biblioteca;

create table Socio
(
	Matricola char(10) not null,
    Nome varchar(20) not null,
    Cognome varchar(20) not null,
    DataNascita date not null,
    DataIscrizione date not null,
    primary key(Matricola)
);

create table Rivista
(
	Codice int not null,
    Titolo varchar(30) not null,
    Anno int not null,
    Mese varchar(10) not null,
    numVolume int not null,
    numIssue int not null,
    primary key(Codice)
);

create table Edizione
(
	ISBN char(13) not null,
    AnnoStampa int not null, 
    Editore varchar(30) not null,
    primary key(ISBN)
);

create table Libro
(
	Codice int not null,
    Titolo varchar(100) not null,
    numCopieDisponibili int not null,
    primary key(Codice)
);

create table Autore
(
	CodiceAutore int not null,
    Nome varchar(20) not null,
    Cognome varchar(20) not null,
    Nazionalità varchar(20) not null,
    DataNascita date not null,
    DataMorte date,
    Epoca varchar(20),
    primary key(CodiceAutore)
);

create table Genere
(
	CodiceGenere int not null,
    NomeGenere varchar(20),
    primary key(CodiceGenere)
);

create table Consultazione
(
	MatricolaSocio char(10) not null,
    CodiceRivista int not null,
    primary key(MatricolaSocio, CodiceRivista),
    foreign key(MatricolaSocio) references Socio(Matricola)
		on update cascade
        on delete cascade,
    foreign key(CodiceRivista) references Rivista(Codice)
		on update cascade
        on delete cascade
);

create table Copia
(
	CodiceCatalogazione int not null,
    Stato varchar(20) not null,
    CodiceLibro int not null,
    ISBN char(13) not null,
    primary key(CodiceCatalogazione),
    foreign key(CodiceLibro) references Libro(Codice),
    foreign key(ISBN) references Edizione(ISBN)
);    

create table Prestito
(
	Matricola char(10) not null,
    CodiceCatalogazione int not null,
    DataPrestito date not null,
    DataRestituzione date,
    DurataPrestito int not null,
    primary key(Matricola, CodiceCatalogazione, DataPrestito),
    foreign key(Matricola) references Socio(Matricola)
        on update cascade
        on delete cascade,
    foreign key(CodiceCatalogazione) references Copia(CodiceCatalogazione)
        on update cascade
        on delete cascade
);
    
create table Scrittura
(
	CodiceLibro int not null,
    CodiceAutore int not null,
    primary key(CodiceLibro, CodiceAutore),
    foreign key(CodiceLibro) references Libro(Codice)
        on update cascade
        on delete cascade,
    foreign key(CodiceAutore) references Autore(CodiceAutore)
        on update cascade
        on delete cascade
);

create table Appartenenza
(
	CodiceAutore int not null,
    CodiceGenere int not null,
    primary key(CodiceAutore, CodiceGenere),
    foreign key(CodiceAutore) references Autore(CodiceAutore)
        on update cascade
        on delete cascade,
    foreign key(CodiceGenere) references Genere(CodiceGenere)
        on update cascade
        on delete cascade
);