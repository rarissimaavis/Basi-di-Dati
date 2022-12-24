use officina;

#restituire il nome e il cognome dei clienti
select nome, cognome
from Cliente;

#restituire il cognome dei clienti (con distinct)
select distinct cognome
from Cliente;

#restituire tutti i dati delle officine
select * 
from Officina;

#restituire tutte le officine di Salerno
select * 
from Officina
where citta = 'Salerno';

#restituire tutti i clienti (nome e cognome) proprietari di autoveicoli con categoria emissione “Euro 6”
#natural join perchè cf uguale altrimenti con join -> on Cliente.cf = Autoveicolo.cf
select nome, cognome
from Cliente natural join Autoveicolo
where categoriaEmissione = 'Euro 6';
/*
push selections: allo scopo di diminuire la dimensione dei risultati intermedi si cerca di anticipare 
il più possibile selezioni e proiezioni
prima selezione perchè ci permette di effettuare il primo partizionamento orizzontale
-> riduce il numero di tuple
join invece operazione complessa
quindi preferibile per ottimizzazione fare prima le query di selezione e poi quelle di join
*/

#restituire tutte le auto (targa, modello) su cui sono stati effettuati interventi a partire dal 03/11/2018
select targa, modello
from Autoveicolo inner join Intervento on Autoveicolo.targa = Intervento.targaAutoveicolo
where Intervento.datainizio >= '2018-11-03';

#per ogni ricambio restituire il numero di interventi in cui sono stati impiegati (nome, numInterventi)
select nome, count(codiceRicambio) as NumInterventi
from Ricambio inner join Utilizzo on Ricambio.codice = Utilizzo.codiceRicambio
group by codiceRicambio, nome;
#la group by deve avere gli stessi attributi della select (o meno)

#per ogni ricambio restituire il numero di interventi in cui sono stati impiegati
#e la quantità totale richiesta (nome, numInterventi, quantitaTotale)
select nome, count(codiceRicambio) as NumInterventi, sum(quantita) as quantitaTotale
from Ricambio inner join Utilizzo on Ricambio.codice = Utilizzo.codiceRicambio
group by codiceRicambio, nome;

#per ogni ricambio restituire il numero di interventi in cui sono stati impiegati,
#con una quantità maggiore di uno, e la quantità totale richiesta (nome, numInterventi, quantitaTotale)
select nome, count(codiceRicambio) as NumInterventi, sum(quantita) as quantitaTotale
from Ricambio inner join Utilizzo on Ricambio.codice = Utilizzo.codiceRicambio
where quantita > 1
group by codiceRicambio, nome;
#oppure
select nome, count(codiceRicambio) as NumInterventi, sum(quantita) as quantitaTotale
from Ricambio inner join Utilizzo on Ricambio.codice = Utilizzo.codiceRicambio
group by codiceRicambio, nome, quantita
having Utilizzo.quantita > 1;

#per ogni ricambio restituire la quantità totale richiesta se e solo se sono stati impiegati 
#in più di un intervento (nome, quantitaTotale)
select nome, sum(quantita) as quantitaTotale
from Ricambio inner join Utilizzo on Ricambio.codice = Utilizzo.codiceRicambio
group by codiceRicambio, nome
having count(codiceRicambio) > 1;

#restituire i dati dei clienti (nome, cognome) che hanno richiesto almeno un intervento
select distinct nome, cognome
from Cliente natural join Autoveicolo inner join Intervento
on Autoveicolo.targa = Intervento.targaAutoveicolo;
#oppure
select nome, cognome
from Cliente as c
where c.cf in (select a.cf
	from Autoveicolo as a inner join Intervento as i
    on a.targa = i.targaAutoveicolo);
#oppure
select nome, cognome
from Cliente as c
where exists (select *
	from Autoveicolo as a inner join Intervento as i
    on a.targa = i.targaAutoveicolo
    where a.cf = c.cf);
    
#restituire i dati dell'officina (nome) con il massimo numero di ore di manodopera impiegate in un qualche intervento
select nome
from Officina as o inner join Intervento as i
on o.nome = i.nomeOfficina
where oreManodopera >= (select max(oreManodopera) from Intervento);
#oppure
select nome
from Officina, Intervento
where Officina.nome = Intervento.nomeOfficina
and oreManodopera in (select max(oreManodopera) from Intervento);

#selezionare i clienti (nome, cognome) che abbiano autoveicoli tutti dello stesso tipo
select nome, cognome
from Cliente natural join Autoveicolo
group by cf, nome, cognome
having count(distinct tipo) = 1;