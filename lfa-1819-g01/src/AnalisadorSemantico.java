/*
* Programa Analisador Semantico da linguagem SQUEAK 
* criado por Ariana, Dario, Diogo, Joao e Mariana
* LFA - 2018/2019
* PROJETO DE CRIAÇAO DE LINGUAGEM PARA MANIPULAÇAO DE ROBOTS
*/

import symbolTable.*;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.*;
import static java.lang.System.*;
import java.util.*;
import semanticUtils.*;

public class AnalisadorSemantico extends MouseBotParserBaseVisitor<Object> {
	// Mapa de Simbolos Geral, associa Funções definidas à sua tabela de simbolos de variáveis
	protected HashMap<FuncSymbol, HashMap<String, VariableSymbol>> tabelaSimbolos = new HashMap<FuncSymbol, HashMap<String, VariableSymbol>>();
	
	// Mapa temporário de Simbolos de variáveis, String nome da variável em lowerCase
	protected Stack<HashMap<String, VariableSymbol>> visibilidade = new Stack<HashMap<String, VariableSymbol>>();
	
	// Tratamento de Erros Semânticos
	protected ErrorHandler errorHandler = new ErrorHandler();
	
	// flag que indica se o ID deve ser avaliado para se foi declarado ou não
	private boolean evalDeclared = true;
	
	// função a ser presentemente definida (null se estiver a analisar a main)
	private FuncSymbol defineFunc = null;

	@Override public Object visitFile(MouseBotParser.FileContext ctx) { 
		// nova visibilidade para variáveis
		HashMap<String, VariableSymbol> variablesTable = new HashMap<String, VariableSymbol>();
		visibilidade.push(variablesTable);
		
		// continua visita á tree
		Object returnVisitChildren = visitChildren(ctx);
		// final da visita ao programa

		// Teste: print da tabela de variaveis
		// visibilidade.peek().values().stream().forEach(v -> out.println(v));
		
		// push da "main" para a tabela de simbolos, incluindo o ultimo conjunto de variáveis
		tabelaSimbolos.put(new FuncSymbol("START"), visibilidade.pop());
		
		// Teste: print da tabela de funções
		// tabelaSimbolos.forEach((k,v)-> System.out.println(k));
		
		// declara o final da análise para o analisador de erros
		errorHandler.endFile();
		// faz o print de todos os erros contabilizados
		errorHandler.printErrors();
		return returnVisitChildren; 
	}

	//@Override public T visitLine(MouseBotParser.LineContext ctx) { return visitChildren(ctx); }
	
	@Override public Object visitCode(MouseBotParser.CodeContext ctx) { 
		// verifica se é preciso analisar a prévia declaração de uma variável
		if(ctx.primitive() != null) {
			evalDeclared = false;
			Object prCtx = visitChildren(ctx);
			evalDeclared = true;
			return prCtx;
		} 
		return visitChildren(ctx);
	}

	//@Override public T visitAction(MouseBotParser.ActionContext ctx) { return visitChildren(ctx); }
	//@Override public T visitActionType1(MouseBotParser.ActionType1Context ctx) { return visitChildren(ctx); }
	//@Override public T visitActionType2(MouseBotParser.ActionType2Context ctx) { return visitChildren(ctx); }
	//@Override public T visitActionType3(MouseBotParser.ActionType3Context ctx) { return visitChildren(ctx); }
	
	@Override public Object visitProcess(MouseBotParser.ProcessContext ctx) { 
		visitChildren(ctx);
		return (Object) VarType.NUMBER; 
	}
	
	//@Override public T visitReturnType1(MouseBotParser.ReturnType1Context ctx) { return visitChildren(ctx); }
	//@Override public T visitReturnType2(MouseBotParser.ReturnType2Context ctx) { return visitChildren(ctx); }
	//@Override public T visitWrite(MouseBotParser.WriteContext ctx) { return visitChildren(ctx); }
	
	@Override public Object visitNewfunc(MouseBotParser.NewfuncContext ctx) {
		// iniciação do simbolo da função
		defineFunc = new FuncSymbol(ctx.ID(0).getText());
		// iniciação dos parametros até ao ultimo ID
		int i;
		for(i=1; i < ctx.ID().size()-1; i++) {
			defineFunc.addParametro(ctx.ID(i).getText(), VarType.NOTUSED);
		}
		// iniciação do retorno caso exista
		if(ctx.THEN() != null)
			defineFunc.addReturn(ctx.ID(i).getText(), VarType.NOTUSED);
		// caso não exista retorno, o ultimo ID é 1 parametro
		else if(ctx.ID(i)!=null)
			defineFunc.addParametro(ctx.ID(i).getText(), VarType.NOTUSED);
		
		// nova visibilidade para variáveis
		visibilidade.push(new HashMap<String, VariableSymbol>());
		
		// continua visita á tree
		Object visitChildren = visitChildren(ctx);

		// faz default a parametros não utilizados e retorno não definido
		defineFunc.defaultValues();
		
		// define nova função e retorna á visibilidade normal
		if(tabelaSimbolos.containsKey(defineFunc)) {
			errorHandler.addError(ctx.ID(0), ErrorType.ALREADYDEFINED);
		} else {
			tabelaSimbolos.put(defineFunc, visibilidade.pop());
		}
		// retirar função da lista de funções á espera de serem definidas (se lá estiver)
		errorHandler.define(defineFunc);

		// função retorna a ser null á espera da prox definição de função
		defineFunc = null;
		
		return visitChildren; 
	}

	@Override public Object visitCallfunc(MouseBotParser.CallfuncContext ctx) {
		// iniciação do simbolo da função
		FuncSymbol funcao = new FuncSymbol(ctx.ID().getText());
		// acrescentar parametros
		ctx.primitive().stream().forEach((prim) -> {
			funcao.addParametro(null, (VarType) visit(prim));
		});
		ParserRuleContext parent = ctx.getParent();
		if(parent instanceof MouseBotParser.ValueContext) funcao.addReturn(null, VarType.NUMBER);
		else if(parent instanceof MouseBotParser.BoolContext) funcao.addReturn(null, VarType.BOOLEAN);
		boolean seeParent = true;
		do{
			parent = parent.getParent();
			if(parent instanceof MouseBotParser.DeclareVARContext ||  parent instanceof MouseBotParser.CallfuncContext ||
				parent instanceof MouseBotParser.WriteContext) seeParent = false;
			if(parent instanceof MouseBotParser.CodeContext || parent instanceof MouseBotParser.Code2Context) {
				funcao.removeReturn(); seeParent = false;
			}
		}while(seeParent);
		// avalia se a função já foi definida
		if(!tabelaSimbolos.containsKey(funcao))
			// se não acrescenta-a á lista de espera de definição
			errorHandler.awaitFunctionDefinition(funcao, ctx.ID());

		return (Object) VarType.NUMBER;
	}

	//@Override public T visitStartBot(MouseBotParser.StartBotContext ctx) { return visitChildren(ctx); }
	//@Override public T visitLoop(MouseBotParser.LoopContext ctx) { return visitChildren(ctx); }
	//@Override public T visitIfs(MouseBotParser.IfsContext ctx) { return visitChildren(ctx); }
	
	@Override public Object visitDeclareVAR(MouseBotParser.DeclareVARContext ctx) {
		// obter nome da variável
		String variavel = ctx.ID().getText();
		// obter o seu tipo
		Object tipo = visit(ctx.primitive());
		// se não estiver a definir uma nova função ou a variável não fizer parte dos parâmetros da mesma
		if(defineFunc==null || !defineFunc.changeReturn(variavel.toLowerCase(), (VarType) tipo))
			// submeter a variável para a tabela de variáveis
			visibilidade.peek().put(variavel.toLowerCase(), new VariableSymbol(variavel, (VarType) tipo));
		
		return tipo; 
	}

	@Override public Object visitPrimitive(MouseBotParser.PrimitiveContext ctx) { 
		return visitChildren(ctx);
	}

	@Override public Object visitStr(MouseBotParser.StrContext ctx) {
		visitChildren(ctx);
		return (Object) VarType.STRING; 
	}
	
	@Override public Object visitValue(MouseBotParser.ValueContext ctx) {
		// se existir uma variavel
		if(ctx.ID() != null) {
			String variavel = ctx.ID().getText();
			// verifica se o value é 1 parâmetro de uma função a ser definida
			if(defineFunc!=null && defineFunc.changeParam(variavel, VarType.NUMBER)) {
				// acrescenta o parâmetro á lista de variáveis
				visibilidade.peek().put(variavel.toLowerCase(), new VariableSymbol(variavel, VarType.NUMBER));
			} else if(variavelDeclarada(ctx.ID()))
				// se estiver devolve o seu tipo
				return visibilidade.peek().get(variavel.toLowerCase()).type(); 	
		} else if(ctx.value() != null) {
			// se não for variável, avalia o resto dos valores
			for(MouseBotParser.ValueContext value : ctx.value()) {
				// da forma como o parser está descrito este valor pode ser uma String
				// se vier diretamente de um ID, pelo que é necessário modificar o tipo
				if(VarType.STRING.equals((VarType) visit(value)) ) {
					TerminalNode node = null;
						if(ctx.POWER() != null) node = ctx.POWER();
						else if(ctx.MULT() != null) node = ctx.MULT();
						else if(ctx.DIV()  != null) node = ctx.DIV();
						else if(ctx.SUB()  != null) node = ctx.SUB();
						else if(ctx.RESTO()  != null) node = ctx.RESTO();
						if(node!=null)
							errorHandler.addError(node, ErrorType.WRONGOPERATOR);
					return (Object) VarType.STRING;
				}
			}
		} 
		if(ctx.callfunc()!=null) return visit(ctx.callfunc());
		return (Object) VarType.NUMBER;
	}
	
	@Override public Object visitBool(MouseBotParser.BoolContext ctx) { 
		// visita os values se eles existirem 
		ctx.value().forEach((val) -> visit(val));
		if(ctx.ID() != null) {
			String variavel = ctx.ID().getText();
			// verifica se o boolean é 1 parâmetro de uma função a ser definida
			if(defineFunc!=null && defineFunc.changeParam(variavel, VarType.BOOLEAN))
				// acrescenta o parâmetro á lista de variáveis
				visibilidade.peek().put(variavel.toLowerCase(), new VariableSymbol(variavel, VarType.BOOLEAN));
			// verifica se é um ID, se está declarado
			else if(variavelDeclarada(ctx.ID())) {
				if(!visibilidade.peek().get(variavel.toLowerCase()).type().equals(VarType.BOOLEAN))
					errorHandler.addError(ctx.ID(), ErrorType.EXPECTBOOL);		
			}
		}
		// visita o resto das regras bool se elas existirem 
		ctx.bool().forEach((bool) -> visit(bool));
		return (Object) VarType.BOOLEAN;  
	}

	// avalia se variável foi ou não declarada, fazendo tratamento do erro caso não tenha sido
	protected boolean variavelDeclarada(TerminalNode id) {
		if(!visibilidade.peek().containsKey(id.getText().toLowerCase())) {
			if(evalDeclared) {
				errorHandler.addError(id, ErrorType.NOTDECLARED);
			}
		} else {
			return true;
		} 
		return false;
	}

	public int getNumberOfSemanticErrors() {
		return errorHandler.getNumberOfErrors();
	}

	public HashMap<FuncSymbol, HashMap<String, VariableSymbol>> getSymbolTable() {
		return tabelaSimbolos;
	}
}