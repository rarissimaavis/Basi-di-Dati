#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "db.h"
#define MAX_LEN 30

struct canzone
{
    char titolo[MAX_LEN+1];
    char compositore[MAX_LEN+1];
};

void cerca_compositore()
{
    FILE *f;
    if ((f = fopen("synthpop80s.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto");
        exit(-1);
    }

    printf("1. Ricerca per compositore\nInserisci il nome del compositore cercato: ");
    char comp[MAX_LEN+1];
    scanf("%s", comp);

    canzone song = malloc(sizeof(*song));
    fscanf(f, "%s %s", song->titolo, song->compositore);
    while (!feof(f))
    {
        if (strcmp(comp, song->compositore) == 0)
        {
            printf("%s %s\n", song->titolo, song->compositore);
        }
        fscanf(f, "%s %s", song->titolo, song->compositore);
    }
    free(song);
    fclose(f);
}

void inserisci_canzone()
{
    FILE *f;
    if ((f = fopen("synthpop80s.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }

    printf("2. Inserimento di una canzone\nInserisci titolo e compositore: ");
    char titolo[MAX_LEN+1];
    char compositore[MAX_LEN+1];
    scanf("%s %s", titolo, compositore);

    canzone song = malloc(sizeof(*song));
    fscanf(f, "%s %s", song->titolo, song->compositore);
    while (!feof(f))
    {
        if ((strcmp(titolo, song->titolo) == 0) && (strcmp(compositore, song->compositore) == 0))
        {
            printf("Canzone già presente nel database\n");
            fclose(f);
            return;
        }
        fscanf(f, "%s %s", song->titolo, song->compositore);
    }

    if ((f = fopen("synthpop80s.txt", "a+")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }
    fprintf(f, "%s %s\n", titolo, compositore);
    free(song);
    fclose(f);
}

/*
[inserimento ordinato]

void inserisci_canzone()
{
	FILE *f;
	FILE *f_temp;
	int inserted = 0;

    printf("2. Inserimento di una canzone\nInserisci titolo e compositore: ");
    char titolo[MAX_LEN+1];
    char compositore[MAX_LEN+1];
    scanf("%s %s", titolo, compositore);
    canzone song = malloc(sizeof(*song));

	if ((f = fopen("primo.txt", "r")) == NULL)
	{
		if ((f = fopen("primo.txt", "w")) == NULL)
		{
			printf("Il file non può essere aperto/creato\n");
			exit(-1);
		}
		else
		{
			printf("? Inserisco la prima riga\n");
			fprintf(f, "%s %s\n", song->titolo, song->compositore);
			fclose(f);
			return;
		}
	}
	if ((f_temp = fopen("temp.txt", "w")) == NULL)
	{
		printf("Il file non può essere creato\n");
        exit(-1);
	}

    fscanf(f, "%s %s", song->titolo, song->compositore);
    while (!feof(f))
    {
        if ((strcmp(titolo, song->titolo) == 0) && (strcmp(compositore, song->compositore) == 0))
        {
            printf("Canzone già presente nel database\n");
            fclose(f_temp);
            fclose(f);
            remove("temp.txt");
            return;
        }
        else if (strcmp(song->titolo, titolo) > 0 && inserted == 0)
        {
            fprintf(f_temp, "%s %s\n", titolo, compositore);
            inserted = 1;
        }
        else if (strcmp(song->titolo, titolo) == 0 && strcmp(song->compositore, compositore) > 0 && inserted == 0)
        {
            fprintf(f_temp, "%s %s\n", titolo, compositore);
            inserted = 1;
        }
        fprintf(f_temp, "%s %s\n", song->titolo, song->compositore);
        fscanf(f, "%s %s", song->titolo, song->compositore);
    }
    if (inserted == 0)
	{
		fprintf(f_temp, "%s %s\n", titolo, compositore);
	}
    free(song);
	fclose(f_temp);
	fclose(f);
	remove("primo.txt");
	rename("temp.txt", "primo.txt");
}
*/

void modifica_compositore()
{
    FILE *f, *f_tmp;
    if ((f = fopen("synthpop80s.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }
    if ((f_tmp = fopen("tmp.txt", "w")) == NULL)
    {
        printf("Il file non può essere creato/aperto\n");
        exit(-1);
    }

    printf("3. Modifica compositore\nInserisci il nome del compositore da modificare: ");
    char comp[MAX_LEN+1];
    scanf("%s", comp);
    printf("Inserisci il nuovo nome: ");
    char comp_modificato[MAX_LEN+1];
    scanf("%s", comp_modificato);

    canzone song = malloc(sizeof(*song));
    fscanf(f, "%s %s", song->titolo, song->compositore);
    while (!feof(f))
    {
        if (strcmp(comp, song->compositore) == 0)
        {
            fprintf(f_tmp, "%s %s\n", song->titolo, comp_modificato);
        }
        else
        {
            fprintf(f_tmp, "%s %s\n", song->titolo, song->compositore);
        }
        fscanf(f, "%s %s", song->titolo, song->compositore);
    }
    free(song);
    fclose(f);
    fclose(f_tmp);
    remove("synthpop80s.txt");
    rename("tmp.txt", "synthpop80s.txt");
}

void cancella_compositore()
{
    FILE *f, *f_tmp;
    if ((f = fopen("synthpop80s.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }
    if ((f_tmp = fopen("tmp.txt", "w")) == NULL)
    {
        printf("Il file non può essere creato/aperto\n");
        exit(-1);
    }

    printf("4. Cancella compositore\nInserisci il nome del compositore da cancellare: ");
    char comp[MAX_LEN+1];
    scanf("%s", comp);

    canzone song = malloc(sizeof(*song));
    fscanf(f, "%s %s", song->titolo, song->compositore);
    while (!feof(f))
    {
        if (strcmp(comp, song->compositore) != 0)
        {
            fprintf(f_tmp, "%s %s\n", song->titolo, song->compositore);
        }
        fscanf(f, "%s %s", song->titolo, song->compositore);
    }
    free(song);
    fclose(f);
    fclose(f_tmp);
    remove("synthpop80s.txt");
    rename("tmp.txt", "synthpop80s.txt");
}