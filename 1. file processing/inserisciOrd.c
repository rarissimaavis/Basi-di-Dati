//inserimento ordinato in un file

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int insert_into(char *matricola_new, char *nome_new, double media_voti_new)
{
	char matricola[30];
	char nome[50];
	double media_voti;

	FILE *f_in;
	FILE *f_temp;
	int inserted = 0;
	if ((f_in = fopen("studentiOrd.txt", "r")) == NULL)
	{
		if ((f_in = fopen("studentiOrd.txt", "w")) == NULL)
		{
			printf("Il file non può essere aperto/creato\n");
			return -1;
		}
		else
		{
			printf("? Inserisco la prima riga con lo studente %s\n", nome_new);
			fprintf(f_in, "%s\t %s\t %lg\n", matricola_new, nome_new, media_voti_new);
			fclose(f_in);
			return 0;
		}
	}
	if ((f_temp = fopen("temp.txt", "w")) == NULL)
	{
		printf("Il file non può essere creato\n");
        exit(-1);
	}
    
	fscanf(f_in, "%s %s %lg", matricola, nome, &media_voti);
	while (!feof(f_in))
	{
		if (strcmp(matricola, matricola_new) == 0)
		{
			printf("? Non puoi inserire uno studente con la stessa matricola\n");
			fclose(f_temp);
			fclose(f_in);
			remove("temp.txt");
			return -1;
		}
		else if (strcmp(matricola, matricola_new) > 0 && inserted == 0)
		{
			fprintf(f_temp, "%s\t %s\t %lg\n", matricola_new, nome_new, media_voti_new);
			inserted = 1;
		}
		fprintf(f_temp, "%s\t %s\t %lg\n", matricola, nome, media_voti);
		fscanf(f_in, "%s %s %lg", matricola, nome, &media_voti);
	}
	if (inserted == 0)
	{
		fprintf(f_temp, "%s\t %s\t %lg\n", matricola_new, nome_new, media_voti_new);
	}
	fclose(f_temp);
	fclose(f_in);
	remove("studentiOrd.txt");
	rename("temp.txt", "studentiOrd.txt");
	return 0;
}

int main()
{
	char matricola[30];
	char nome[50];
	double media_voti;
	
	int res = -1;

	printf("Inserisci la matricola, il nome e la media dei voti di uno studente\n");
	printf("Inserisci EOF per concludere l'inserimento del dati\n");
	printf("? ");
	scanf("%s %s %lg", matricola, nome, &media_voti);
	while (!feof(stdin))
	{
		res = insert_into(matricola, nome, media_voti);
		if (res == 0)
		{
			printf("? Studente %s inserito con successo\n", nome);
		}
		else
		{
			printf("? Studente %s NON inserito\n", nome);
		}
		printf("? ");
		scanf("%s %s %lg", matricola, nome, &media_voti);
	}
	return 0;
}