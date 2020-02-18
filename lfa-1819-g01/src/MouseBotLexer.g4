/*
* Gramatica da linguagem SQUEAK com tokens 
* que interagem com o robot, criado por 
* Ariana, Dario, Diogo, Joao e Mariana
* LFA - 2018/2019
* PROJETO DE CRIAÇAO DE LINGUAGEM PARA MANIPULAÇAO DE ROBOTS
*/

// analisador léxico
lexer grammar MouseBotLexer;

// import gramáticas específicas
import OperationsLexer, DecisionLexer
	   , OtherLexer, PrimitivesLexer;

// tokens sem valores de retorno
// token 
ActionType1 : (PICKUP | RETURN | FINISH | STOP) ;
// recolha do beacon
fragment PICKUP : P I C K U P ;
// sinalizar retorno á posição inicial
fragment RETURN : R E T U R N ;
// sinalizar fim do trial do Robot
fragment FINISH : F I N I S H ;
// parar Robot
fragment STOP : S T O P ;

// token (value)
ActionType2 : (FORWARD | BACKWARD | TURNLEFT | TURNRIGHT) ;
// acções de motors simplificadas
// dá 1 valor (em vez de 2) ao motors usando os tokens 
// para descrever sentido do movimento
fragment FORWARD : F O R W A R D ;
fragment BACKWARD : B A C K W A R D ;
// rotação do Robot sobre o mesmo eixo
fragment TURNLEFT : T U R N L E F T ;
fragment TURNRIGHT : T U R N R I G H T ;

// token (value, value)
ActionType3 : (WHEELS) ;
// função motors, 1 value por cada roda
fragment WHEELS : W H E E L S ;

// tokens com valores de retorno
// variavel => token
ReturnType1 : (FRONTSENSOR | BACKSENSOR | LEFTSENSOR 
	| RIGHTSENSOR | COMPASS | GROUND | NUMBEROFCHEESES
	| STARTANGLE | STARTDISTANCE) ;
// sensores devolvem valor da distância para obstáculo mais proximo
fragment FRONTSENSOR : F R O N T S E N S O R ;
fragment BACKSENSOR : B A C K S E N S O R ;
fragment LEFTSENSOR : L E F T S E N S O R ;
fragment RIGHTSENSOR : R I G H T S E N S O R ;
// devolve o ângulo do robot em relação ao norte
fragment COMPASS : C O M P A S S ;
// devolve um inteiro que identifica o tipo do solo que o robot está a pisar
// valor entre 1 and n, se o robot estiver em cima de um queijo
// 0 se em cima de chão normal
fragment GROUND : G R O U N D ;
// Retorna o numero de queijos no mapa
fragment NUMBEROFCHEESES : N U M B E R O F C H E E S E S;
// ângulo para a posição inicial do robot
fragment STARTANGLE : S T A R T A N G L E ;
// distância para a posição inicial do robot
fragment STARTDISTANCE : S T A R T D I S T A N C E ;

// variavel => token (value)
ReturnType2 : (CHEESEANGLE) ;
// devolve o ângulo entre o robot e o beacon identificado
fragment CHEESEANGLE : C H E E S E A N G L E ;

// tokens "especiais" visiveis no parser para terem regras próprias
// token WRITE (print) de Strings ou Valores 
WRITE : W R I T E ;

// token START liga Robot ao Simulador, 
// atributos: string ('position' value)?
START : S T A R T ;
// se não for adicionada position o default é 0
POSITION : P O S I T I O N ; 
// sinaliza final de todas as ações do Robot
// (sem atributos)
END : E N D ;

// tokens inicio e fim função
FUNCTION : F U N C T I O N;
ENDFUNC : E N D F U N C T I O N;
