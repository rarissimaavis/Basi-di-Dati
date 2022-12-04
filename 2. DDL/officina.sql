create database Officina;
use Officina;

create table Officina
(
	Nome varchar(20) not null,
    Via varchar(20) not null,
    CAP char(5) not null,
    Città varchar(20) not null,
    numTelefono varchar(12) not null,
    primary key(Nome)
);

create table Cliente
(
	CF char(16) not null,
    Nome varchar(20) not null,
    Cognome varchar(20) not null,
    Indirizzo varchar(20) not null,
    numTelefono varchar(12) not null,
    primary key(CF)
);

create table Ricambio
(
	Codice int not null,
    Nome varchar(20) not null,
    Marca varchar(20) not null,
    Prezzo float not null,
    primary key(Codice)
);

create table Autoveicolo
(
	Targa varchar(9) not null,
    Modello varchar(20) not null,
    Tipo varchar(20) not null,
    TipoAlimentazione varchar(20) not null,
    numAssi int,
    Peso float,
    TipoCatalizzatore varchar(20),
    CategoriaEmissione varchar(20),
    CFCliente varchar(16) not null,
    primary key(Targa),
    foreign key(CFCliente) references Cliente(CF)
		on update cascade
        on delete cascade
);

create table Intervento
(
	numProgressivo int not null,
    NomeOfficina varchar(20) not null,
    DataInizio varchar(20) not null,
    DataFine varchar(20) not null,
    OreManodopera int not null,
    TargaAutoveicolo varchar(9) not null,
    primary key(numProgressivo, NomeOfficina),
    foreign key(NomeOfficina) references Officina(Nome)
		on update cascade
        on delete cascade,
	foreign key(TargaAutoveicolo) references Autoveicolo(Targa)
		on update cascade
        on delete cascade
);

create table Utilizzo
(
	CodiceRicambio int not null,
    numIntervento int not null,
    NomeOfficina varchar(20) not null,
    Quantità int not null,
    primary key(CodiceRicambio, numIntervento, NomeOfficina),
    foreign key(numIntervento) references Intervento(numIntervento)
		on update cascade
        on delete cascade,
	foreign key(NomeOfficina) references Intervento(NomeOfficina)
		on update cascade
        on delete cascade
);