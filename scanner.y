%{
    void yyerror(char *s);
    int yylex();
    #include <stdio.h>
    #include <stdlib.h>
%}


%token ID MATHS ENGLISH PHYSICS CHEMISTRY GRADES
%token A B C D E
%token BOOLEAN INTEGER STRING
%start linkage
%%

linkage: '{' grades '}' ;

grades: GRADES ':' '[' grade_list ']';
grade_list: grade | grade_list ',' grade ;
grade: '{'
         ID ':' INTEGER ','
         MATHS ':' symbol ','
         ENGLISH ':' symbol ','
         PHYSICS ':' symbol ','
         CHEMISTRY ':' symbol
        '}';
symbol: A | B | C | D | E;
%%

int main(int argc,char** argv){
    int accepted;
    accepted = yyparse();
    if(accepted == 0){
        printf("Congratulations! File is in accepted format!\n");
    }else{
        printf("Oops! File is NOT in accepted format!\n");
    }
}

void yyerror(char *s){
    // fprintf(stderr,"Error:%s.\n",s);
}