/*
* Programa MAIN da linguagem SQUEAK criado por 
* Ariana, Dario, Diogo, JoAo e Mariana
* LFA - 2018/2019
* PROJETO DE CRIAÇAO DE LINGUAGEM PARA MANIPULAÇAO DE ROBOTS
*/

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import sintaticUtils.*;
import java.io.FileWriter;

public class MouseBotMain {
   public static void main(String[] args) throws Exception {
      if(args.length != 1) {
	      System.out.println("Usage: java MouseBotMain [inputfile/\"stdin\"]");
	      System.out.println("stdin can be used to read directly from the console.");
      }

      CharStream input;
      if(args[0].equals("stdin")) input = CharStreams.fromStream(System.in);
      else input = CharStreams.fromFileName(args[0]);
      // create a lexer that feeds off of input CharStream:
      MouseBotLexerError lexer = new MouseBotLexerError(input);
      lexer.removeErrorListeners();
      // tb trocamos as mensagens de erro do lexer
      lexer.addErrorListener(new MouseBotLexerL());
      // create a buffer of tokens pulled from the lexer:
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      // create a parser that feeds off the tokens buffer:
      MouseBotParser parser = new MouseBotParser(tokens);
      // replace error listener:
      //System.out.println("Error listeners: "+parser.getErrorListeners());
      parser.setErrorHandler(new MouseBotErrorStrategy());
      parser.removeErrorListeners(); // remove ConsoleErrorListener
      parser.addErrorListener(new MouseBotErrorListener());
      // begin parsing at assign rule:
      ParseTree tree = parser.file();
      if (parser.getNumberOfSyntaxErrors() == 0) {
         // print LISP-style tree:
         // System.out.println(tree.toStringTree(parser));
         AnalisadorSemantico visitorSemantico = new AnalisadorSemantico();
         visitorSemantico.visit(tree);
         if(visitorSemantico.getNumberOfSemanticErrors() == 0) {
            System.out.println("Sintese yay");
            Synthesis synthesis = new Synthesis();
            synthesis.setTarget("c");
            ST code = synthesis.visit(tree);
            synthesis.setSymbolTable(visitorSemantico.getSymbolTable());
	    FileWriter fn = new FileWriter("out.cpp");
	    fn.write(code.render());
	    fn.close();
         } else {
            System.out.println("Sintese nay");
         }
      }
   }
}
