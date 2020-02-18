/*
* Parser da Linguagem SQUEAK criado por 
* Ariana, Dario, Diogo, Joao e Mariana
* LFA - 2018/2019
* PROJETO DE CRIAÇAO DE LINGUAGEM PARA MANIPULAÇAO DE ROBOTS
*/

// analisador sintático
parser grammar MouseBotParser;

// import do lexer principal
options {
	tokenVocab = MouseBotLexer;
}

// análise de código linha a linha
file : NEWLINE* startBot newfunc* EOF ;

code : (action | write | ifs | loop | declareVAR | primitive) ;

code2 : (action | write | ifs | loop | primitive) ;

// tokens sem parâmetros de retorno
action : (actionType1 | actionType2 | actionType3) ;

// token
actionType1 : ActionType1 ;
// token (value)
actionType2 : ActionType2 OPENP value CLOSEP ;
// token (value, value)
actionType3 : ActionType3 OPENP value value CLOSEP ;
// token (string, value)
//actionType4 : ActionType2 (STRING | ID) POSITION value ActionType4;


// funções com parametros de retorno
process : (returnType1 | returnType2) ;
// variavel => token
returnType1 : ReturnType1 ;
// variavel => token (value)
returnType2 : ReturnType2 OPENP value CLOSEP ;

// token write("String")
write: WRITE OPENP (primitive (ADD primitive)*)? CLOSEP; // STRING CLOSEP ;

// declaração de funções
newfunc : FUNCTION ID OPENP ID* CLOSEP (THEN ID)? NEWLINE? (code? NEWLINE)* ENDFUNC NEWLINE*;

// chamada de funções
callfunc: ID OPENP primitive* CLOSEP ;

// main, caso não se escreva "position" fazemos um default para 0 em vez de causar erro!
startBot : START STRING (POSITION value)? NEWLINE (code? NEWLINE)* END NEWLINE*;

// ciclos
loop : LOOP NEWLINE* OPENPR bool CLOSEPR THEN (NEWLINE* code2 NEWLINE*)+ ENDLOOP;

// if's
ifs : IFF NEWLINE* (OPENPR bool CLOSEPR THEN (NEWLINE* code2 NEWLINE*)+)+ (code2? NEWLINE)* ENDIF;

// tipos primitivos e suas declarações
// declaração de variaveis
declareVAR : ID ATRIB primitive ;

// tipos primitivos e suas operações internas
primitive : value | str | bool ;

// variável ou STRING (regra auxiliar)
// em teste, alterei por causa de 1 erro, acho que dá para ser reduzido
str : ((value | bool) ADD)* STRING (ADD (value | bool))* (ADD str)* ;

// variável ou valor (regra auxiliar)
value : <assoc=right> value POWER value 
	| value (MULT | DIV | RESTO)  value 
	| value ADD value
	| SUB value
	| value SUB value
	| process
	| NUMBER
	| ID
	| callfunc
	| OPENP value CLOSEP ;

bool : value COMP value (COMP value)? 
	| NOT bool
	| bool LOGIC bool
	| ID
	| callfunc
	| BOOLEAN 
	| OPENP bool CLOSEP;
