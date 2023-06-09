#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
char nome0[101], senha0[101],nome1[101],senha1[101],email0[101],email1[101], email2[101], cpf0[15],cpf1[15],plano[50];
float peso=0,altura=0;
void criacadastro(){
    int contador0=0,contador1=0, contador2=0, contador3=0,contador4=0;
    printf("\tDigite seu nome completo:");
    scanf(" ");
    fgets(nome0,sizeof(nome0),stdin);
    strcpy(nome1,nome0);
    printf("\tDigite sua senha:");
    fgets(senha0,sizeof(senha0),stdin);
    strcpy(senha1,senha0);
    printf("\tPor favor digite novamente sua senha:");
    fgets(senha0,sizeof(senha0),stdin);
    while(strcmp(senha1,senha0)!=0){
        printf("\tPor favor, digite a mesma senha inserida anteriormente, digite novamente sua senha:");
        scanf(" ");
        fgets(senha0,sizeof(senha0),stdin);
        contador0++;
        if(contador0>1){
            printf("\tDeseja trocar de senha?\n\tDigite:\n\t1. Para sim\n\t2. Para não\n");
            scanf("%i",&contador1);
            if(contador1==1){
                printf("\tDigite sua nova senha:");
                scanf(" ");
                fgets(senha0,sizeof(senha0),stdin);
                strcpy(senha1,senha0);
                printf("\tPor favor digite novamente sua nova senha:");
                scanf(" ");
                fgets(senha0,sizeof(senha0),stdin);
            }
            contador0=0;
        }
    }
    do{
        printf("\tDigite seu email para recuperação da conta:");
        if(contador3==0){
            scanf(" ");
            contador3++;
        }
        fgets(email0,sizeof(email0),stdin);
        strcpy(email2,email0);
        contador1=0;contador2=0;contador4=101-strcspn(email0,"@");
        unsigned long int j0=sizeof(email0), j1=sizeof(email0);
        for(int i=0;i!=contador4;i++){
            strcat(email0,"0");
        }
        if(strcspn(email0,"@")!=j0){
            strcpy(email0,email2);
            contador4=101-strcspn(email0,".");
            for(int i=0;i!=contador4;i++){
                strcat(email0,"0");
            }
            if(strcspn(email0,".")!=j1){
                contador2++;
            }else{
                printf("\tO email precisa conter '.' para ser valido\n");
            }
        }else{
            printf("\tO email precisa conter '@' para ser valido\n");
        }
    }while(contador2!=1);
    strcpy(email0,email2);
    contador0=0;
    strcpy(email1,email0);
    printf("\tEmail verificado\n");
    printf("\tDigite seu cpf:");
    fgets(cpf0,sizeof(cpf0),stdin);
    printf("\tDigite seu peso(Em kg):");
    scanf("%f",&peso);
    printf("\tDigite seu altura(Em metros):");
    scanf("%f",&altura);
    printf("\tCadastro concluído com sucesso\n\tDigite enter para voltar a tela inicial\n");
    getch();
    system("cls");
}
int verificalogin(char *nome, char *senha){
    char nome2[sizeof(nome1)],senha2[sizeof(senha1)],email3[sizeof(email1)],cpf2[sizeof(cpf1)];
    int i=1,contador0=0,contador1=0,contadorn0=0, contadorn1=0,contadorn2=5,contadorn3=1;
    for(int i=0;i!=100;i++){
        strcpy(nome2,nome);
        strcpy(senha2,senha);
    }
    if(strcasecmp(nome1,nome2)!=0||strcmp(senha1,senha2)!=0){
        while(i!=0){
            system("cls");
            printf("\tUsuário digitou nome ou senha incorreta, favor digitar novamente o nome:");
            if(contador1==5){
                scanf(" ");
                contador1=0;
            }
            fgets(nome2,sizeof(nome2),stdin);
            printf("\tFavor digitar novamente sua senha:");
            fgets(senha2,sizeof(senha2),stdin);
            contador0++;
            if(strcasecmp(nome1,nome2)!=0||strcmp(senha1,senha2)!=0){
                if(contador0>1){
                    do{
                        printf("\tDeseja voltar pra tela inicial e realizar um cadastro? Digite:\n\t1. Para sim\n\t2. Para não\n\t3. Para tentar recuperar sua conta");
                        scanf("%i",&contador1);
                        contador0=0;
                        switch (contador1){
                            case 1:
                            system("cls");
                            return 0;
                            break;
                            case 2:
                            printf("\n");
                            contadorn3=3;
                            contador1=5;
                            break;
                            case 3:
                            do{
                                system("cls");
                                contadorn1=0;
                                printf("\tFavor digitar seu email de recuperacao:");
                                if(contadorn2==5){
                                    scanf(" ");
                                    contadorn2=0;
                                }
                                fgets(email3,sizeof(email3),stdin);
                                if(strcmp(email3,email1)==0){
                                    printf("\tOla, %s.\n\tPor favor crie uma nova senha:", nome1);
                                    fgets(senha2,sizeof(senha2),stdin);
                                    strcpy(senha1,senha2);
                                    contadorn1=30;
                                    contadorn3=3;
                                    i=0;
                                }else{
                                    contadorn0++;
                                    contadorn2++;
                                    if(contadorn0>1){
                                        printf("\tPor favor digite o mesmo email digitado no cadastro\n");
                                    contador0=0;
                                   }
                                    if(contadorn2>=1){
                                        printf("\tDeseja voltar a tela inicial e realizar um novo cadastro? Digite:\n");
                                        printf("\t1. Para sim\n\t2. Para não");
                                        scanf("%i",&contadorn2);
                                        if(contadorn2==1){
                                            system("cls");
                                            return 0;
                                        }else{contadorn2=5;}
                                    }
                                }       
                            }while(contadorn1!=30);
                            break;
                            default:
                                printf("\tDigitar valor válido\n");
                            break;
                        }
                    }while(contadorn3>3||contadorn3<3);
                }
            }else{i=0;}
        }
    }
    printf("\tLogin concluído, digite enter para prosseguir\n");
    getch();
    system("cls");
    return 1;
}
int planejamento(){
    int motivo=0;
    printf("\tLogado\n");
    printf("\tPor favor fale seu objetivo com esta aplicação\n\tDigite:\n\t1. para perder de peso.\n\t2. para aumentar a massa muscular.\n\t3. para me manter saudável.\n\t4. para me manter motivado.\n\t5. outro motivo.");
    scanf("%i",&motivo);
    switch(motivo){
        case 1:
        strcpy(plano,"Plano de perda de peso");
        printf("\tCriando plano de exercícios\n");
        printf("\tPressione enter para prosseguir");
        getch();
        return 1;
        break;
        case 2:
        strcpy(plano,"Plano de massa muscular");
        printf("\tCriando plano de exercícios\n");
        printf("\tPressione enter para prosseguir");
        getch();
        return 2;
        break;
        case 3:
        strcpy(plano,"Plano leve");
        printf("\tCriando plano de exercícios\n");
        printf("\tPressione enter para prosseguir");
        getch();
        return 3;
        break;
        case 4:
        strcpy(plano,"Plano simples");
        printf("\tCriando plano de exercícios\n");
        printf("\tPressione enter para prosseguir");
        getch();
        return 4;
        break;
        case 5:
        strcpy(plano,"Plano generico");
        printf("\tCriando plano de exercícios\n");
        printf("\tPressione enter para prosseguir");
        getch();
        return 5;
        break;
        default:
        strcpy(plano,"Não definido");
        printf("\tPlano não definido\n");
        printf("\tPressione enter para prosseguir");
        getch();
        return 0;
        break;
    }
}
int main(){
    int escolha0,escolha1;
    do{
        printf("\tPrograma Mr Halter Exercise\n");
        printf("\tTela inicial\n\tDigite:\n\t1. Para entrar em login\n\t2. Para efetuar cadastro");
        scanf("%i",&escolha0);
        switch(escolha0){
            case 1:
            printf("\tLogin\n\tDigite seu nome:");
            scanf(" ");
            fgets(nome0,sizeof(nome0),stdin);
            printf("\tDigite sua senha:");
            fgets(senha0,sizeof(senha0),stdin);
            escolha0=verificalogin(nome0,senha0);
            break;
            case 2:
            criacadastro();
            break;
            default:
            system("cls");
            printf("\tReiniciando o programa\n\n\n");
            printf("\tFavor digitar valor valido na tela inicial\n\n\n");
            break;
        }
    }while(escolha0!=1);
    do{
        escolha1=planejamento();
        printf("\n\tO plano selecionado foi:%s",plano);
        printf("\n\tDigite enter para finalizar a aplicação:");
        getch();
    }while(escolha1<1||escolha1>5);
}
