%{ 
    #include<stdio.h>
    #include<stdlib.h>
    #define YYERROR_VERBOSE 1
    void yyerror(const char *err);
    int flag=0;
%}

%token NUM  KEYWORD  KEYWORD1  KEYWORD2  KEYWORD3  KEYWORD4 F BLANK

%%

    S : X  E  { printf("\n this is valid sentence\n"); return 0; }
    ;
    E : A | B | D
    ;
    A : P KEYWORD P KEYWORD1 P T
    ;
    B : P T
    ;
    D :  P KEYWORD3 P KEYWORD P X P T
    ;
    T :  KEYWORD2 P KEYWORD3 P KEYWORD4 P Q
    ;
    Q :  F
    ;
    X : NUM
    ;
    P : BLANK
    ;
%%
void yyerror(const char *err){
    printf("\n Entered expression is not valid \n");
    fprintf(stderr,"%s\n",err);
    exit(1);
}

void main(){
    printf("\n Enter the expression to find the leap year");
    yyparse();
}

