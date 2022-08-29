#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>
#include <time.h>

char ** palabras_a_buscar=NULL;

struct nodo{
    char ** palabras_a_buscar;
    char * nombre_archivo;
};

//numero de hilos, numero de palabras a contar

int contarPalabras(FILE *archivo){
    int cont=0;
	char a[50];
	while(feof(archivo)==0){
		fscanf(archivo,"%s",a);
		cont++;
	}
	return cont;
}


void *LeerArchivo(void * id)
{   
    char* retorno = malloc(sizeof(char));
    *retorno = ((char *)id);
    FILE *f;
    f = fopen(retorno, "r");
    if (f == NULL) {
        fprintf(stderr, "No se pudo abrir el archivo %s\n", retorno);
        exit(EXIT_FAILURE);
    }
    int tam = contarPalabras(id);
    pthread_exit((void *)retorno);
}
int main(int argc, char **argv)
{

    if (argc != 2)
    {
        printf("Por favor indica cuantos hilos necesitas\n");
        exit(-1);
    }
    
    int numeroDeHilos = atoi(argv[1]);
    int numeroDePalabras = atoi(argv[2]);
    char nombre_Archivos[numeroDeHilos][50];
    char Palabras[numeroDePalabras][50];
    //struct nodo * array_datos = (struct nodo *)malloc(numeroDeHilos*sizeof(struct nodo));
    int i = 0;
    for(i=0; i<numeroDePalabras; i++){
        printf("Por favor idica el archivo que deseas revisar\n");
        scanf("%s",palabras_a_buscar[i]);
    //    scanf("%s",array_datos[i].palabras_a_buscar[0]);
    }

    i = 0;
    for(i = 0; i<numeroDeHilos;i++){
        printf("Por favor idica el archivo que deseas revisar\n");
        scanf("%s",&nombre_Archivos[i]);
    }
    pthread_t * thread1 = (pthread_t *)malloc(numeroDeHilos*sizeof(pthread_t));
    struct nodo * valor_Retorno;
    int * res = (int*)(malloc(numeroDeHilos*sizeof(int)));
    
    i=0;
    for ( i = 0; i < numeroDeHilos; i++){
        //arrayNode[i].i=i;
        //strcpy(arrayNode[i].nombre,"Hola mundo yo soy el hilo: ");
        pthread_create(thread1+i, NULL, LeerArchivo, nombre_Archivos+i);

    }
    int i = 0;
    for( i= 0; i<numeroDeHilos; i++){
        pthread_join(thread1[i],(void **)(&valor_Retorno)); //TAREA 1. SABER COMO RECIBIR PARAMETROS DEL JOIN
        //printf("%i\n",(*valor_Retorno).i);
    }
    //printf("%i\n",(*valor_Retorno).i);


    
    free(thread1);
    //free(arrayNode);

    // TAREA 2. HACERLO CON MEMORIA DINAMICA
    return 0;
}