use Biblioteca;

#1. trovare le copie dei libri di cui non si conosce l'edizione (titolo libro, codice catalogazione)

select titolo, codicecatalogazione
from Libro, Copia
where Copia.ISBN is null and Copia.codicelibro = Libro.codice;

select titolo, codicecatalogazione
from libro join copia on Libro.codice = Copia.codicelibro
where ISBN is null;

#2. elencare i soci che hanno consultato almeno una rivista, e che abbiano preso in prestito almeno un libro (cognome e nome)

select distinct cognome, nome
from Socio join Consultazione
on Socio.matricola = Consultazione.matricolasocio 
where matricola in (select matricola from Prestito); 

select cognome, nome 
from Socio
where exists (select * from Prestito where Socio.matricola = Prestito.matricola)
	and exists (select * from Consultazione where Socio.matricola = Consultazione.matricolasocio);

#3. selezionare gli autori (nome, cognome) che abbiano scritto in uno ed un solo genere

select nome, cognome, Appartenenza.codiceautore, 
count(distinct codicegenere) as numGeneri
from Autore join Appartenenza 
on Autore.codiceautore = Appartenenza.codiceautore
group by codiceautore, nome, cognome
having numGeneri = 1;

select nome, cognome
from Autore
where Autore.codiceautore in (select codiceautore
	from Appartenenza 
    group by codiceautore
    having count(distinct codicegenere) = 1);