.PHONY: all test1 test2 testmain clean

all:  gramaticas main
	(cd ./src; javac *.java) 

main: symbolTable semanticUtils sintaticUtils src/MouseBotMain.java src/AnalisadorSemantico.java src/c.stg src/MouseBotLexerL.java src/MouseBotLexerError.java

symbolTable: 
	(cd ./src; javac symbolTable/*.java)

semanticUtils:
	(cd ./src; javac semanticUtils/*.java)

sintaticUtils:
	(cd ./src; javac sintaticUtils/*.java)

gramaticas: src/MouseBotParser.g4 src/MouseBotLexer.g4
	(cd ./src; antlr4 -visitor -no-listener *.g4)
	@#antlr4-build /src

testgrammar: 
	cat testProg/TestFuncoes.sqk | (cd ./src; antlr4-test MouseBot file -gui)

testmain:
	(cd ./src; cat ../testProg/TestActions.sqk | java MouseBotMain)

clean:
	antlr4-clean /src