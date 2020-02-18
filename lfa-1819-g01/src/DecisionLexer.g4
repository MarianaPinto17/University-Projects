/*
* Gramatica da linguagem SQUEAK 
* que confere loops e acoes, criado por 
* Ariana, Dario, Diogo, Joao e Mariana
* LFA - 2018/2019
* PROJETO DE CRIAÇAO DE LINGUAGEM PARA MANIPULAÇAO DE ROBOTS
*/

// analisador lexico de blocos de decisão
lexer grammar DecisionLexer;

import CaseInsensitiveLexer;

// Definição if
IFF   : A C T I O N S ;
ENDIF : E N D A C T I O N S ;
THEN : '=>' ;

LOOP : L O O P ;
ENDLOOP : E N D L O O P ;
//ANDINST : '&' ;
