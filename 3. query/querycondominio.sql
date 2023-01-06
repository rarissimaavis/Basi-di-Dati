use condominio;

#elencare le vie di tutti i condomini
select distinct via
from condominio;

#elencare tutte le spese di condominio ordinate per condominio e per importo (rifCond, importo, fattura)
select rifCond, importo, fattura
from spesa
where tipo = 'condominio'
order by rifCond, importo;

#elencare le spese in cui è coinvolto l'interno 2 scala B del condominio Alighieri (codice, importo, tipo)   
select codice, tipo, importo
from spesa
where (rifCond = 'Alighieri' and tipo = 'condominio') 
	or (rifScala = 'B' and rifCond = 'Alighieri' and tipo = 'scala')
union all
select codice, tipo, importo
from spesa join rif_appartamento on spesa.codice = rif_appartamento.spesa
where condominio = 'Alighieri' and scala = 'B' and interno = 2;

#elencare i proprietari il cui cognome inizia con “M” (cognome, nome)
select cognome, nome
from proprietario
where cognome like 'M%';

#elencare le spese corredate di fattura (codice, importo, fattura)
select codice, importo, fattura
from spesa
where fattura is not null;

#elencare i proprietari degli appartamenti che hanno effettuato almeno 2 spese di appartamento (cognome, nome) 
select cognome, nome
from proprietario
where cf in
	(select proprietario
    from appartamento natural join rif_appartamento
    group by condominio, scala, interno, proprietario
    having count(*) > 1);
    
#elencare gli appartamenti che hanno pagato spese di appartamento ma non di scala (condominio, scala, interno)
select condominio, scala, interno
from pagamento inner join spesa on pagamento.spesa = spesa.codice
where pagamento.tipo = 'Appartamento'
and not exists (select condominio, scala, interno
	from pagamento as p inner join spesa as s on p.spesa = s.codice
	where pagamento.tipo = 'Scala'
	and pagamento.condominio = p.condominio
	and pagamento.scala = p.scala
	and pagamento.interno = p.interno);

#calcolare il numero di pagamenti effettuati dall’appartamento interno “2” scala “B” del condominio “Alighieri” per le spese di tipo “Condominio” (numPagamenti) 
select count(*) as numPagamenti
from pagamento
where interno = '2' and scala = 'B' and condominio = 'Alighieri'
and spesa in
	(select codice from spesa where tipo = 'Condominio');
    
#elencare i proprietari a cui sono associate spese di appartamento per un importo superiore a 500 euro (cognome, nome)
select nome, cognome
from proprietario join appartamento on proprietario.cf = appartamento.proprietario natural join rif_appartamento
where rif_appartamento.spesa = any (select codice
	from spesa
	where tipo = 'Appartamento'
	and importo > 500);