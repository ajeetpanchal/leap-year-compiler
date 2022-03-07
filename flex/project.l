%{
    #include<stdio.h>
    int t=0;
%}

temp [0-9][0-9][0-9][0-9]

%%

{temp} {printf("year digit \n");t++;}
year {printf("it is year\n");t++;}
" " {printf("it is blank \n");t++;}
leap {printf("it is leap \n");t++;}
chhe {printf("it is chhe \n");t++;}
"?" {printf("it is question mark \n");t++;}
pachhi {printf("it is pachhi \n");t++;}
kyu {printf("it is kayu \n");t++;}

. {printf("%s is not valid tocken \n",yytext);t++;} 

%%

int yywrap(){}
int main(){
    FILE *filepoint;
    char name[15];
    printf("\nEnter the file name to compile  \n  ");
    scanf("%s",name);
    filepoint = fopen(name,"r");
    yyin = filepoint;
    yylex();
    printf("number of tocken is %d",t);
    return 0;
}