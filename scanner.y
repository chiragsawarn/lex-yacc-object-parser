%{
    void yyerror(char *s);
    int yylex();
    #include <stdio.h>
    #include <stdlib.h>
%}


%token ALLELE_1 ALLELE_2 CHROM FATHER_ID RESULTS ID ILLNESS MARKER MARKERS MOTHER_ID NAME POSITION SAMPLE SAMPLES
%token BOOLEAN INTEGER STRING
%start linkage
%%

linkage: '{' markers ','  samples ',' results '}' ;

markers: MARKERS ':' '[' marker_list ']';
marker_list: marker | marker_list ',' marker ;
marker: '{'
         ID ':' INTEGER ','
         NAME ':' STRING ','
         CHROM ':' STRING ','
         POSITION ':' INTEGER
        '}';

samples: SAMPLES ':' '[' sample_list ']';
sample_list: sample | sample_list ',' sample ;
sample: '{'
         ID ':' INTEGER ','
         NAME ':' STRING ','
         FATHER_ID ':' INTEGER ','
         MOTHER_ID ':' INTEGER ','
         ILLNESS ':' BOOLEAN
        '}';


results: RESULTS ':' '[' result_list ']';
result_list: result | result_list ',' result;
result: '{'
         SAMPLE ':' INTEGER ','
         MARKER ':' INTEGER ','
         ALLELE_1 ':' STRING ','
         ALLELE_2 ':' STRING
        '}';
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