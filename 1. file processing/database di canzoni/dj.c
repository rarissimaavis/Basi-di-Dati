/*
Problema: WOLD, una stazione radio locale, vuole costruire un database di canzoni, per automatizzare le ricerche
Si è creato un file in cui sono stati inseriti degli elementi composti dai titoli e dai compositori delle canzoni
Si intende dare al disk-jockey la possibilità di:
    1. cercare nel database tutte le canzoni di un particolare artista
    2. inserire una nuova canzone
    3. modificare il nome di un artista
    4. cancellare un artista con tutte le sue canzoni
*/
#include <stdio.h>
#include <stdlib.h>
#include "db.h"
#define MAX_LEN 30

int main(void)
{
    int ric;
    do
    {
        printf("1. cerca per compositore\n2. inserisci canzone\n3. modifica compositore\n4. cancella compositore\n(0 per uscire)\n");
        printf("Seleziona un'opzione: ");
        scanf("%d", &ric);
        switch(ric)
        {
            case 0:
                ric = 0;
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

    } while (ric != 0);
    return 0;
}