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

struct artista
{
    char nome[MAX_LEN+1];
    char gruppo[3];
    int anni;
    char genere[MAX_LEN+1];
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

//da aggiornare
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

	if ((f = fopen("prova.txt", "r")) == NULL)
	{
		if ((f = fopen("prova.txt", "w")) == NULL)
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
            fclose(f);
            return;
        }
        else if (strcmp(song->titolo, titolo) > 0 && inserted == 0)
        {
            fprintf(f_temp, "%s %s\n", titolo, compositore);
            inserted = 1;
        }
        else if (strcmp(song->titolo, titolo) == 0)
        {
            if (strcmp(song->compositore, compositore) > 0 && inserted == 0)
            {
                fprintf(f_temp, "%s %s\n", titolo, compositore);
                inserted = 1;
            }
        }
        fprintf(f_temp, "%s %s\n", song->titolo, song->compositore);
        fscanf(f, "%s %s", song->titolo, song->compositore);
    }
    if (inserted == 0)
	{
		fprintf(f_temp, "%s %s\n", song->titolo, song->compositore);
	}
    free(song);
	fclose(f_temp);
	fclose(f);
	remove("prova.txt");
	rename("temp.txt", "prova.txt");
}

void modifica_compositore()
{
    FILE *f1, *f2, *f1_tmp, *f2_tmp;
    if ((f1 = fopen("primo.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }
    if ((f2 = fopen("secondo.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }
    if ((f1_tmp = fopen("tmp1.txt", "w")) == NULL)
    {
        printf("Il file non può essere creato/aperto\n");
        exit(-1);
    }
    if ((f2_tmp = fopen("tmp2.txt", "w")) == NULL)
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
    artista artist = malloc(sizeof(*artist));

    fscanf(f1, "%s %s", song->titolo, song->compositore);
    while (!feof(f1))
    {
        if (strcmp(comp, song->compositore) == 0)
        {
            fprintf(f1_tmp, "%s %s\n", song->titolo, comp_modificato);
        }
        else
        {
            fprintf(f1_tmp, "%s %s\n", song->titolo, song->compositore);
        }
        fscanf(f1, "%s %s", song->titolo, song->compositore);
    }

    fscanf(f2, "%s %s %d %s", artist->nome, artist->gruppo, &artist->anni, artist->genere);
    while (!feof(f2))
    {
        if (strcmp(comp, artist->nome) == 0)
        {
            fprintf(f2_tmp, "%s %s %d %s\n", comp_modificato, artist->gruppo, artist->anni, artist->genere);
        }
        else
        {
            fprintf(f2_tmp, "%s %s %d %s\n", artist->nome, artist->gruppo, artist->anni, artist->genere);
        }
        fscanf(f2, "%s %s %d %s", artist->nome, artist->gruppo, &artist->anni, artist->genere);
    }

    free(song);
    free(artist);
    fclose(f1);
    fclose(f2);
    fclose(f1_tmp);
    fclose(f2_tmp);
    remove("primo.txt");
    rename("tmp1.txt", "primo.txt");
    remove("secondo.txt");
    rename("tmp2.txt", "secondo.txt");
}

void cancella_compositore()
{
   FILE *f1, *f2, *f1_tmp, *f2_tmp;
    if ((f1 = fopen("primo.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }
    if ((f2 = fopen("secondo.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }
    if ((f1_tmp = fopen("tmp1.txt", "w")) == NULL)
    {
        printf("Il file non può essere creato/aperto\n");
        exit(-1);
    }
    if ((f2_tmp = fopen("tmp2.txt", "w")) == NULL)
    {
        printf("Il file non può essere creato/aperto\n");
        exit(-1);
    }

    printf("4. Cancella compositore\nInserisci il nome del compositore da cancellare: ");
    char comp[MAX_LEN+1];
    scanf("%s", comp);

    canzone song = malloc(sizeof(*song));
    artista artist = malloc(sizeof(*artist));

    fscanf(f1, "%s %s", song->titolo, song->compositore);
    while (!feof(f1))
    {
        if (strcmp(comp, song->compositore) != 0)
        {
            fprintf(f1_tmp, "%s %s\n", song->titolo, song->compositore);
        }
        fscanf(f1, "%s %s", song->titolo, song->compositore);
    }

    fscanf(f2, "%s %s %d %s", artist->nome, artist->gruppo, &artist->anni, artist->genere);
    while (!feof(f2))
    {
        if (strcmp(comp, artist->nome) != 0)
        {
            fprintf(f2_tmp, "%s %s %d %s\n", artist->nome, artist->gruppo, artist->anni, artist->genere);
        }
        fscanf(f2, "%s %s %d %s", artist->nome, artist->gruppo, &artist->anni, artist->genere);
    }

    free(song);
    free(artist);
    fclose(f1);
    fclose(f2);
    fclose(f1_tmp);
    fclose(f2_tmp);
    remove("primo.txt");
    rename("tmp1.txt", "primo.txt");
    remove("secondo.txt");
    rename("tmp2.txt", "secondo.txt"); 
}

void cerca_giovani()
{
    FILE *f1, *f2;
    if ((f1 = fopen("primo.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }
    if ((f2 = fopen("secondo.txt", "r")) == NULL)
    {
        printf("Il file non può essere aperto\n");
        exit(-1);
    }

    printf("Artisti giovani:\n");
    canzone song = malloc(sizeof(*song));
    artista artist = malloc(sizeof(*artist));
    fscanf(f2, "%s %s %d %s", artist->nome, artist->gruppo, &artist->anni, artist->genere);
    while (!feof(f2))
    {
        if ((strcmp(artist->gruppo, "no") == 0 && artist->anni < 30) || (strcmp(artist->gruppo, "si") == 0 && artist->anni < 5))
        {
            fscanf(f1, "%s %s", song->titolo, song->compositore);
            while (!feof(f1))
            {
                if (strcmp(artist->nome, song->compositore) == 0)
                {
                    printf("%s %s\n", song->titolo, song->compositore);
                }
                fscanf(f1, "%s %s", song->titolo, song->compositore);
            }
            rewind(f1);
        }
        fscanf(f2, "%s %s %d %s", artist->nome, artist->gruppo, &artist->anni, artist->genere); 
    }
    free(song);
    free(artist);
    fclose(f1);
    fclose(f2);
}