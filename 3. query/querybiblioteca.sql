use bliblioteca;

#modifica allo schema

#ridenominare l'attributo copieDisponibili nella tabella libro, chiamandolo numCopieDisponibili
alter table Libro 
change column copieDisponibili numCopieDisponibili int not null;

#aggiungiamo l’attributo copieDisponibili nella tabella libro
alter table Libro
add column copieDisponibili int;

#cancelliamo l’attributo numCopieDisponibili nella tabella libro
alter table Libro
drop column numCopieDisponibili;

#eliminare not null sull’attributo ISBN di copia
alter table Copia
change column ISBN ISBN char(13);

#inserimento dei dati

insert into Libro (codice, titolo, copieDisponibili) values ('1','I promessi sposi', '3');
insert into Autore (codiceautore, nome, cognome, nazionalita, datanascita, datamorte, epoca) values ('1', 'Alessandro', 'Manzoni', 'Italiana', '1785-03-07', '1873-05-22', 'Romanticismo');
insert into Scrittura (codicelibro, codiceautore) values ('1', '1');
insert into Edizione (ISBN, annostampa, edizione) values ('9788844039011', '2010', '2');
insert into Copia (codicecatalogazione, stato, codicelibro, ISBN) values ('100', 'nuovo', '1', '9788844039011');
insert into Copia (codicecatalogazione, stato, codicelibro) values ('101', 'nuovo', '1');

#query di interrogazione

#nome e cognome dei soci che hanno effettuato almeno un prestito
#cose in comune tra Socio e Prestito: matricola (freccia)
select nome, cognome 
from Socio inner join Prestito on Socio.matricola = Prestito.matricola;

select *
from Copia join Edizione on Copia.ISBN = Edizione.ISBN;
 
#sintassi con l'alias
select *
from Copia c join Edizione e on c.ISBN = e.ISBN;

select *
from Copia as c join Edizione as e on c.ISBN = e.ISBN;

select *
from Copia left outer join Edizione on Copia.ISBN = Edizione.ISBN;

select *
from Copia right outer join Edizione on Copia.ISBN = Edizione.ISBN;

#prodotto cartesiano
select * 
from Copia cross join Edizione;

#stessi risultati del prodotto cartesiano
#mediante l'utilizzo di più tabelle nella from posso fare un join implicito
select * 
from Copia, Edizione;

#versione di prima con join implicito
select *
from Copia, Edizione
where Copia.ISBN = Edizione.ISBN;

#si chiamano allo stesso modo quindi posso togliere l'on e usare il natural join
select *
from Copia natural join Edizione;