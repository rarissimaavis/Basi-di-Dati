//scrittura in un file sequenziale

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	char matricola[30];
	char nome[50];
	double media_voti;

	FILE *f;
	if ((f = fopen("studenti.txt", "w")) == NULL)
	{
		printf("Il file non può essere aperto\n");
		exit(-1);
	}
	
	printf("Inserisci matricola, nome e media di uno studente (EOF per concludere):\n");
	scanf("%s %s %lg", matricola, nome, &media_voti);
	while (!feof(stdin))
	{
		fprintf(f, "%s %s %lg \n", matricola, nome, media_voti);
		scanf("%s %s %lg", matricola, nome, &media_voti);
	}
	fclose(f);
	return 0;
}