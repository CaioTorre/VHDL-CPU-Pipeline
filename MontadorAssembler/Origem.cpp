#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void converteReg(char[], int);
void converteImed(char[], int);
void converteJ(char[], int);
void converteJr(char[], int);
void printa(char[], int*);
void completaInstruction(char[]);
void salvaArquivo(FILE*, char[], int*, char[], int reg1, int reg2, int reg3, int imed, char);

void main()
{
	char i[20];
	char r[32];
	char tipo;
	int reg1, reg2, reg3, imed;
	int linha = 0;
	FILE *p = fopen("codigo.txt", "w");
	do
	{
		scanf("%s", i);

		if (strcmp(i, "add") == 0)
		{
			strcpy(r, "000001");
			tipo = 'r';
		}
		else if (strcmp(i, "sub") == 0)
		{
			strcpy(r, "000010");
			tipo = 'r';
		}
		else if (strcmp(i, "addi") == 0)
		{
			strcpy(r, "000011");
			tipo = 'i';
		}
		else if (strcmp(i, "subi") == 0)
		{
			strcpy(r, "000100");
			tipo = 'i';
		}
		else if (strcmp(i, "lw") == 0)
		{
			strcpy(r, "000101");
			tipo = 'm';
		}
		else if (strcmp(i, "sw") == 0)
		{
			strcpy(r, "000110");
			tipo = 'm';
		}
		else if (strcmp(i, "and") == 0)
		{
			strcpy(r, "000111");
			tipo = 'r';
		}
		else if (strcmp(i, "or") == 0)
		{
			strcpy(r, "001000");
			tipo = 'r';
		}
		else if (strcmp(i, "andi") == 0)
		{
			strcpy(r, "001001");
			tipo = 'i';
		}
		else if (strcmp(i, "ori") == 0)
		{
			strcpy(r, "001010");
			tipo = 'i';
		}
		else if (strcmp(i, "beq") == 0)
		{
			strcpy(r, "001011");
			tipo = 'i';
		}
		else if (strcmp(i, "j") == 0)
		{
			strcpy(r, "001100");
			tipo = 'j';
		}
		else if (strcmp(i, "jr") == 0)
		{
			strcpy(r, "001101");
			tipo = 'g';
		}
		else if (strcmp(i, "nop") == 0)
		{
			strcpy(r, "000000");
			tipo = 'n';
		}
		else
		{
			break;
		}

		switch (tipo)
		{
		case 'r':
			scanf("%i,%i,%i", &reg1, &reg2, &reg3); //rd rs rt
			converteReg(r, reg2);
			converteReg(r, reg3);
			converteReg(r, reg1);
			break;
		case 'i':
			scanf("%i,%i,%i", &reg1, &reg2, &imed);
			converteReg(r, reg2);
			converteReg(r, reg1);
			converteImed(r, imed);
			break;
		case 'm':
			scanf("%i,%i(%i)", &reg1, &imed, &reg2);
			converteReg(r, reg2);
			converteReg(r, reg1);
			converteImed(r, imed);
			break;
		case 'j':
			scanf("%i", &imed);
			converteJ(r, imed);

			break;
		case 'g':
			scanf("%i", &reg1);
			converteJr(r, reg1);
		default:
			break;
		}

		completaInstruction(r);

		//printa(r, &linha);
		salvaArquivo(p, r, &linha, i, reg1, reg2, reg3, imed, tipo);

	} while (true);

	fclose(p);

	system("pause");
}

void converteReg(char instruction[], int r)
{
	char aux[30];

	int i;

	_itoa(r, aux, 2);

	for (i = strlen(aux); i < 5; i++)
		strcat(instruction, "0");

	strcat(instruction, aux);
}

void converteImed(char instruction[], int r)
{
	char aux[30];

	int i;

	_itoa(r, aux, 2);

	for (i = strlen(aux); i < 16; i++)
		strcat(instruction, "0");

	strcat(instruction, aux);
}

void converteJ(char instruction[], int r)
{
	char aux[26];

	int i;

	_itoa(r, aux, 2);

	for (i = strlen(aux); i < 26; i++)
		strcat(instruction, "0");

	strcat(instruction, aux);
}

void converteJr(char instruction[], int r)
{
	char aux[30];
	int i, x;

	_itoa(r, aux, 2);

	for (i = strlen(aux); i < 5; i++)
		strcat(instruction, "0");

	strcat(instruction, aux);

	x = strlen(instruction);

	for (i = x; i < 32; i++)
		strcat(instruction, "0");
}

void printa(char instruction[], int* linha)
{
	int i;

	for (i = 0; i < 32; i++)
	{
		if (i == 8 || i == 16 || i == 24)
		{
			printf("\";");

			printf("\n");
		}

		if (i == 0 || i == 8 || i == 16 || i == 24)
		{
			printf("\tmemory(%i) <= \"", (*linha));
			*linha = *linha + 1;
		}
		printf("%c", instruction[i]);
	}
	printf("\";");
	printf("\n");
}

void completaInstruction(char instruction[])
{
	int i;
	int x;

	x = strlen(instruction);

	for (i = x; i < 32; i++)
		strcat(instruction, "0");
}

void salvaArquivo(FILE* p, char instruction[], int* linha, char in[], int reg1, int reg2, int reg3, int imed, char t)
{
	int i;

	for (i = 0; i < 32; i++)
	{
		if (i == 8 || i == 16 || i == 24)
		{
			fprintf(p, "\";");

			fprintf(p, "\n");
		}

		if (i == 0 || i == 8 || i == 16 || i == 24)
		{
			fprintf(p, "\tmemory(%i) <= \"", (*linha));
			*linha = *linha + 1;
		}
		fprintf(p, "%c", instruction[i]);
	}
	fprintf(p, "\";");
	switch (t)
	{
	case 'r':
		fprintf(p, "-- %s %i,%i,%i", in, reg1, reg2, reg3);
		break;
	case 'i':
		fprintf(p, "-- %s %i,%i,%i", in, reg1, reg2, imed);
	case 'j':
		fprintf(p, "-- %s %i", in, imed);
		break;
	case 'm':
		fprintf(p, "-- %s %i,%i(%i)", in, reg1, imed, reg2);
		break;
	case 'g':
		fprintf(p, "-- %s %i", in, reg1);
		break;
	default:
		break;
	}

	fprintf(p, "\n\n");
}
