/*
Problema 1: WOLD, una stazione radio locale, vuole costruire un database di canzoni, per automatizzare le ricerche
Si è creato un file in cui sono stati inseriti degli elementi composti dai titoli e dai compositori delle canzoni
Si intende dare al disk-jockey la possibilità di:
    1. cercare nel database tutte le canzoni di un particolare artista
    2. inserire una nuova canzone
    3. modificare il nome di un artista
    4. cancellare un artista con tutte le sue canzoni

Problema 2: aggiungiamo un nuovo file che contenga i dettagli sugli artisti:
    - nominativo
    - gruppo (si/no)
    - età: età anagrafica di un artista o anni di costituzione di un gruppo
    - genere principale
Query: visualizzare tutte le canzoni appartenenti ad artisti con un'età anagrafica inferiore a 30 
o appartenenti a gruppi costituiti da meno di 5 anni
Attenzione: è necessario sincronizzare lo scenario di modifica del nome e la cancellazione dell'artista su entrambi i file
*/
#include <stdio.h>
#include <stdlib.h>
#include "db.h"

int main(void)
{
    int a;
    do
    {
        printf("1. cerca per compositore\n2. inserisci canzone\n3. modifica compositore\n4. cancella compositore\n(0 per uscire)\n");
        printf("Seleziona un'opzione: ");
        scanf("%d", &a);
        switch(a)
        {
            case 0:
                a = 0;
                break;
            case 1:
                cerca_compositore();
                break;
            case 2:
                inserisci_canzone();
                break;
            case 3:
                modifica_compositore();
                break;
            case 4:
                cancella_compositore();
                break;
        }

    } while (a != 0);
    
    cerca_giovani();
    return 0;
}