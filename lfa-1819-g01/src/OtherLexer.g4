/*
* Gramatica da linguagem SQUEAK com 
* regras gerais da linguagem, criado por 
* Ariana, Dario, Diogo, Joao e Mariana
* LFA - 2018/2019
* PROJETO DE CRIAÇAO DE LINGUAGEM PARA MANIPULAÇAO DE ROBOTS
*/

// analisador léxico "extra"
lexer grammar OtherLexer;

// Parênteses
OPENP  : '(' ;
CLOSEP : ')' ;
OPENPR : '[' ;
CLOSEPR : ']' ;

//VIRG: ',' ;

// Comentários 
LINE_COMMENT : '//' ~[\r\n]* -> channel(1);
COMMENT: '/*' .*? '*/' -> channel(1) ;

// Nova linha, linux ou windows
NEWLINE	: '\r'? '\n' ;

// Skip de espaços e tab's
WS : [ \t]+ -> skip;
