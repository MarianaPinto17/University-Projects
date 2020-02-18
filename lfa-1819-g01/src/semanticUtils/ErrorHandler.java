package semanticUtils;

import symbolTable.*;
import org.antlr.v4.runtime.tree.*;
import java.util.TreeMap;
import java.util.HashMap;
import java.util.*;

public class ErrorHandler {
	// Mapa final de Erros Semânticos <Linha, Lista de Erros>
	protected TreeMap<Position, Error> listErrors;
	// Mapa temporário de funções não definidas 
	protected HashMap<FuncSymbol, LinkedList<Position>> awaitDefFunc;

	public ErrorHandler() {
		listErrors = new TreeMap<Position, Error>();
		awaitDefFunc = new HashMap<>();
	}

	public void addError(Symbol symbol, Position position, ErrorType type) {
		listErrors.put(position, new Error(symbol, type));
	}
	public void addError(TerminalNode id, ErrorType type) {
		Position p = new Position(id.getSymbol().getLine(), id.getSymbol().getCharPositionInLine() + 1);
		addError(new Symbol(id.getText()), p, type);
	}
	
	public void endFile() {
		// transformar funções não definidas em erros
		awaitDefFunc.forEach((k, v) -> {
			v.forEach(p -> addError(k, p, ErrorType.NOTDEFINED));
		}
		);
	}

	// acrescenta funções á "lista de espera" para serem definidas
	public void awaitFunctionDefinition(FuncSymbol funcao, TerminalNode id) {
		int line = id.getSymbol().getLine(), column = id.getSymbol().getCharPositionInLine() + 1;
		if(!awaitDefFunc.containsKey(funcao)) {
			LinkedList<Position> position = new LinkedList<Position>();
			position.addFirst(new Position(line, column));
			awaitDefFunc.put(funcao, position);
		} else {
			awaitDefFunc.get(funcao).addFirst(new Position(line, column));
		}
	}

	public void define(FuncSymbol funcao) {
		awaitDefFunc.remove(funcao);
	}

	// função para teste, ainda não sei se a volto a usar ou se devo apagar
	public void printNotDefined() {
		awaitDefFunc.forEach((k, v) -> {
			System.out.println(k + " não definida -> linhas: "+v);
		}
		);
	}

	public void printErrors() {
		System.out.printf("Número de Erros: %d ->\n", listErrors.size());
		listErrors.forEach((position, error) -> {
			System.out.println(position + " -> " + error);
		}
		);
	}

	public int getNumberOfErrors() { return listErrors.size(); }
}