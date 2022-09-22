//creazione di un file sequenziale

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	FILE *f;
	if ((f = fopen("file.txt", "w")) == NULL)
	{
		printf("Il file non può essere aperto\n");
        exit(-1);
	}
	printf("Ho creato/aperto il file\n");
	fclose(f);
	return 0;
}