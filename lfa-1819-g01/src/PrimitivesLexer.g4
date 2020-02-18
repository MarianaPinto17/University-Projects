/*
* Gramatica da linguagem SQUEAK com regras
* gerais da linguagem de tipos primitivos,
*  criado por Ariana, Dario, Diogo, Joao e Mariana
* LFA - 2018/2019
* PROJETO DE CRIAÇAO DE LINGUAGEM PARA MANIPULAÇAO DE ROBOTS
*/

// analisador léxico Primitivas
lexer grammar PrimitivesLexer;

import CaseInsensitiveLexer;

// Booleans
BOOLEAN : TRUE | FALSE;
fragment TRUE: T R U E;
fragment FALSE: F A L S E;

// (importante) não trocar ordem de INT e NUMBER 
NUMBER 	: DIGIT+('.'DIGIT+)? ; 	// Número, quer seja int ou float
fragment DIGIT : [0-9] ; 		// Digit só visível no lexer 

// Identificador para variáveis
ID : [A-Za-z][A-Za-z0-9_]* ;

// String com operador não ganancioso
STRING : '"' (ESC | .)*? '"' ;
fragment ESC: '\\"' | '\\\\' ;
