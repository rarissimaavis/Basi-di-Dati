//modifica di un file sequenziale

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	char matricola[30];
	char nome[50];
	double media_voti;
	
	FILE *f_in;
	FILE *f_temp;
	if ((f_in = fopen("studenti.txt", "r")) == NULL) 
	{
		printf("Il file non può essere aperto\n");
        exit(-1);
	}
	if ((f_temp = fopen("temp.txt", "w")) == NULL)
	{
		printf("Il file non può essere creato\n");
        exit(-1);
	}

    fscanf(f_in, "%s %s %lg", matricola, nome, &media_voti);
	while (!feof(f_in))
	{
		if (strcmp(matricola, "002") == 0)
		{
			media_voti = 27.0;
			printf("Sto cambiando la media dei voti di %s\n", nome);
		}
		fprintf(f_temp, "%s\t %s\t %lg\n", matricola, nome, media_voti);
		fscanf(f_in, "%s %s %lg", matricola, nome, &media_voti);
	} 
	fclose(f_temp);
	fclose(f_in);
	remove("studenti.txt");
	rename("temp.txt", "studenti.txt");
	return 0;
}