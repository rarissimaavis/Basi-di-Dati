create database condominio;
use condominio;

create table condominio
(
	nome varchar(30) primary key,
    via varchar(50) not null,
    cap char(5) not null,
    citta varchar(20) not null
);

create table proprietario
(
	cf char(16) primary key,
    nome varchar(30) not null,
    cognome varchar(30) not null
);

create table scala
(
	condominio varchar(30) not null unique,
    codice char(6) not null unique, 
    quotaScala float not null,
    primary key(condominio, codice),
    foreign key (condominio) references condominio(nome)
		on update cascade
        on delete cascade
);

create table spesa
(
	codice char(6) primary key,
    rifCond varchar(30),
    tipo varchar(100) not null,
    importo float not null,
	fattura char(6),
    rifScala char(6) not null,
    foreign key (rifScala) references scala(codice)
		on update cascade
        on delete cascade
);    

create table appartamento
(
	condominio varchar(30) not null unique,
    scala char(6) not null unique, 
    interno char(6) not null unique,
    millesimi float not null,
    proprietario char(16) not null,
    via varchar(50),
    cap char(5),
    citta varchar(20),
    primary key(condominio, scala, interno),
    foreign key (condominio) references scala(condominio)
		on update cascade
        on delete cascade,
	foreign key (scala) references scala(codice)
		on update cascade
        on delete cascade,
	foreign key (proprietario) references proprietario(cf)
		on update cascade
        on delete cascade
);

create table rif_appartamento
(
	spesa char(6) not null,
    condominio varchar(30) not null,
    scala char(6) not null,
    interno char(6) not null,
    primary key(spesa, condominio, scala, interno),
    foreign key (spesa) references spesa(codice)
		on update cascade
        on delete cascade,
	foreign key (condominio) references appartamento(condominio)
		on update cascade
        on delete cascade,
	foreign key (scala) references appartamento(scala)
		on update cascade
        on delete cascade,
	foreign key (interno) references appartamento(interno)
		on update cascade
        on delete cascade
);
    
create table pagamento
(
	spesa char(6) not null,
	condominio varchar(30) not null,
	scala char(6) not null,
	interno char(6) not null,
	data date not null,
	percentuale int not null,
	tipo varchar(50) not null,
	foreign key (spesa) references spesa(codice)
		on update cascade
		on delete cascade,
	foreign key (condominio) references appartamento(condominio)
		on update cascade
		on delete cascade,
	foreign key (scala) references appartamento(scala)
		on update cascade
		on delete cascade,
	foreign key (interno) references appartamento(interno)
		on update cascade
		on delete cascade
);