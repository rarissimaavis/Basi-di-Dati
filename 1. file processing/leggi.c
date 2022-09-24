//lettura di un file sequenziale

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    char matricola[30];
    char nome[50];
    double media_voti; 
    FILE *f;
    if ((f = fopen("studenti.txt", "r")) == NULL)
    {
        printf("Il file non puo essete aperto\n");
        exit(-1);
    }
    
    printf("%s\t %s\t %s\n", "Matricola", "Nome", "Media_Voti");
    while (!feof(f))
    {
        fscanf(f, "%s %s %lg\n", matricola, nome , &media_voti);
        printf("%s\t %s\t %lg\n", matricola, nome, media_voti);
    }
    fclose(f);
    return 0;
}