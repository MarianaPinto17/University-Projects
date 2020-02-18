/*
* Gramatica da linguagem SQUEAK com 
* as operacoes disponveis, criado por 
* Ariana, Dario, Diogo, Joao e Mariana
* LFA - 2018/2019
* PROJETO DE CRIAÇAO DE LINGUAGEM PARA MANIPULAÇAO DE ROBOTS
*/

// analisador léxico para operações
lexer grammar OperationsLexer;

import CaseInsensitiveLexer;

// Operadores lógicos
LOGIC : (AND | OR) ;
fragment AND  : A N D; 
fragment OR   : O R ;
NOT : N O T;


// Comparações
COMP : (EQUA | DIFF | LESS | BIGG| LEQU) ;
EQUA : '=' ;
fragment DIFF : '!=';
fragment LESS : '<' ;
fragment BIGG : '>' ;
fragment LEQU : '<=';
fragment BEQU : '>=';

// Operações aritmeticas
MULT  : '*' ;
DIV   : '/' ;
RESTO : '%' ;
ADD   : '+' ;
SUB   : '-' ;
POWER : '^' ;

// Operador de tribuição
ATRIB : '<-' ;
