/*
* Programa Sintese da linguagem SQUEAK, criado por 
* Ariana, Dario, Diogo, João e Mariana
* LFA - 2018/2019
* PROJETO DE CRIAÇAO DE LINGUAGEM PARA MANIPULAÇAO DE ROBOTS
*/

import symbolTable.*;
import org.stringtemplate.v4.*;
import org.antlr.v4.runtime.tree.*;
import static java.lang.System.*;
import java.util.*;
import java.io.File;

public class Synthesis extends MouseBotParserBaseVisitor<ST> {
	// Mapa de Simbolos Geral, associa Funções definidas à sua tabela de simbolos de variáveis
	protected HashMap<FuncSymbol, HashMap<String, VariableSymbol>> tabelaSimbolos = null;
	private STGroupFile stg;
	private String target;

	// obter tabela de Simbolos do Analisador Sintático 
	public void setSymbolTable(HashMap<FuncSymbol, HashMap<String, VariableSymbol>> tabelaSimbolos) {
		this.tabelaSimbolos = tabelaSimbolos;
	}
	
	//verifica se o ficheiro .stg é valido
	public boolean validTarget(String target) {
		File f = new File(target+".stg");
  
		return ("c".equalsIgnoreCase(target)) && f.exists() && f.isFile() && f.canRead();
	}

	//determina o dicionário
	public void setTarget(String target) {
		assert validTarget(target);
		this.target = target;
	}

	@Override public ST visitFile(MouseBotParser.FileContext ctx) {
		assert validTarget(target);
		stg = new STGroupFile(target+".stg");
		return visitChildren(ctx);
	}
	
	//@Override public ST visitCode(MouseBotParser.CodeContext ctx) //não é necessaria usar
	//@Override public ST visitAction(MouseBotParser.ActionContext ctx) //não é necessaria usar

	//INSTRUÇÕES QUE NÃO RETORNAM NEM TÊM PARAMETROS
	@Override public ST visitActionType1(MouseBotParser.ActionType1Context ctx) { 
		ST temp;
			switch(ctx.ActionType1().getText().toLowerCase()){
				case "pickup":
					temp = stg.getInstanceOf("pickup");
				case "return":
					temp = stg.getInstanceOf("return");

				case "finish":
					temp = stg.getInstanceOf("finish");

				case "stop":
					temp = stg.getInstanceOf("stop");
			}

			return temp;
	}

	//INSTRUÇÕES QUE NÃO RETORNAM E TÊM 1 PARAMETRO
	@Override public ST visitActionType2(MouseBotParser.ActionType2Context ctx) {
			ST temp;
			switch(ctx.ActionType2().getText().toLowerCase()){
				case "foward":
					temp = stg.getInstanceOf("foward");
					temp.add("value", visit(ctx.value()));
				case "backward":
					temp = stg.getInstanceOf("backward");
					temp.add("value", visit(ctx.value()));
				case "turnleft":
					temp = stg.getInstanceOf("turnleft");
					temp.add("value", visit(ctx.value()));
				case "turnright":
					temp = stg.getInstanceOf("turnright");
					temp.add("value", visit(ctx.value()));
			}

			return temp;
	}
	
	//INSTRUÇÕES QUE NÃO RETORNAM E TÊM 2 PARAMETROS
	@Override public ST visitActionType3(MouseBotParser.ActionType3Context ctx) {
		ST temp1;
			if(ctx.ActionType3().getText().toLowerCase().equals("wheels")){
				temp1 = stg.getInstanceOf("wheels");
				temp1.add("var1", visit(ctx.value(0)));
				temp1.add("var2", visit(ctx.value(1)));
			}	
			return temp1;		
	}

	//@Override public ST visitProcess(MouseBotParser.ProcessContext ctx) //não é necessaria usar

	//INSTRUÇÕES QUE TÊM RETORNO E NÃO TÊM PARAMETROS
	@Override public ST visitReturnType1(MouseBotParser.ReturnType1Context ctx) { 
		ST temp;
			switch (ctx.ReturnType1().getText().toLowerCase()) {
				case "ground":
					temp = stg.getInstanceOf("ground");
				case "startangle":
					temp = stg.getInstanceOf("startangle");
				case "startdistance":
					 temp = stg.getInstanceOf("startdis");	
				case "compass":
					temp = stg.getInstanceOf("coord");	
				case "frontsensor":
					temp = stg.getInstanceOf("obsdistance");
					temp.add("sensor", ctx.ReturnType1().getText());
				case "backsensor":
					temp = stg.getInstanceOf("obsdistance");
					temp.add("sensor", ctx.ReturnType1().getText());
				case "leftsensor":
					temp = stg.getInstanceOf("obsdistance");
					temp7.add("sensor", ctx.ReturnType1().getText());
				case "rightsensor":
					temp = stg.getInstanceOf("obsdistance");
					temp8.add("sensor", ctx.ReturnType1().getText());
				case "numberofcheeses":
					temp = stg.getInstanceOf("ncheeses");
			}
		return temp;
	}	

	//INSTRUÇÕES QUE TÊM RETORNO E TÊM 1 PARAMETRO
	@Override public ST visitReturnType2(MouseBotParser.ReturnType2Context ctx) { 
		ST temp = stg.getInstanceOf("cheeseangle");
			temp.add("cheese", visit(ctx.value()));
		return temp;
	}

	@Override public ST visitWrite(MouseBotParser.WriteContext ctx) {
		ST temp = stg.getInstanceOf("write");
		if(ctx.ADD() == null)
			temp.add("string", ctx.primitive());
		else temp.add("string", ctx.primitive());
		return temp;
	}

	@Override public ST visitNewfunc(MouseBotParser.NewfuncContext ctx) { 
		ST temp = stg.getInstanceOf("declarefunc");
		temp.add("name", ctx.ID(0));
			if(ctx.THEN() == null)
				temp.add("var", ctx.ID());
			else temp.add("return", ctx.ID());
			temp.add("stat", ctx.code());
		return temp;
	}

	@Override public ST visitCallfunc(MouseBotParser.CallfuncContext ctx) { 
		ST temp = stg.getInstanceOf("function");
		temp.add("name", ctx.ID());
		temp.add("attrib", ctx.primitive());
		return temp;
	}

	@Override public ST visitStartBot(MouseBotParser.StartBotContext ctx) { 
		ST temp = stg.getInstanceOf("main");
		temp.add("stat", ctx.code());
		temp.add("name", ctx.STRING());
		temp.add("position", visit(ctx.value()));
		return temp;
	}

	@Override public ST visitLoop(MouseBotParser.LoopContext ctx) { 
		ST temp = stg.getInstanceOf("while");
		temp.add("loopcondition", visit(ctx.bool()));
		temp.add("loopaction", ctx.code2());
		return temp;
	}

	@Override public ST visitIfs(MouseBotParser.IfsContext ctx) { 
		
		ST last = new ST("");
		boolean first = true;

		//start from the last
		for(int i=ctx.bool().size()-1; i >= 0; i--){
			ST tmp = stg.getInstanceOf("ifstat");
			tmp.add("condition",visit(ctx.bool(i)));
			tmp.add("action1",visit(ctx.code2(i)));
			if(first){
				if(ctx.bool().size() != ctx.code2().size())
					tmp.add("action2",visit(ctx.code2(ctx.code2().size()-1)));
				first = false;
			}
			else tmp.add("action2",last.render());
			last = tmp;
		}

		return last;
	}	

	@Override public ST visitDeclareVAR(MouseBotParser.DeclareVARContext ctx){ 
		ST temp = stg.getInstanceOf("declarevar");
		temp.add("name", ctx.ID());
		temp.add("value", visit(ctx.primitive()));
		return temp;
	}

	//@Override public ST visitPrimitive(MouseBotParser.PrimitiveContext ctx)
	
	@Override public ST visitStr(MouseBotParser.StrContext ctx){
		ST temp = new ST("<input>");
		for(int i = 0; i < ctx.getChildCount()-1; i++){
			if(ctx.getChild(i) instanceof TerminalNode)
				if(((TerminalNode)ctx.getChild(i)).getSymbol().getType() == MouseBotParser.ADD)
					temp = new ST("catString("+temp.render()+",<input>)");
				else
					temp.add("input",ctx.getChild(i).getText());
			else if(ctx.getChild(i) instanceof MouseBotParser.StrContext)
				temp.add("input",visit(ctx.getChild(i)));
			else if(ctx.getChild(i) instanceof MouseBotParser.ValueContext)
				temp.add("input","intToStr("+visit(ctx.getChild(i))+")");
			else if(ctx.getChild(i) instanceof MouseBotParser.BoolContext)
				temp.add("input","intToStr("+visit(ctx.getChild(i))+")");
		}

		return temp;
	}

	@Override public ST visitValue(MouseBotParser.ValueContext ctx){
		
		ST tmp = new ST("<e1><op><e2>");
		
		if(ctx.value().size() != 2){
			if(ctx.POWER() != null) tmp = new ST("pow(<e1>,<e2>)");
			if(ctx.MULT() != null) tmp.add("op","*");
			if(ctx.DIV() != null) tmp.add("op","/");
			if(ctx.RESTO() != null) tmp.add("op","%");
			if(ctx.ADD() != null) tmp.add("op","+");
			if(ctx.SUB() != null) tmp.add("op","-");
			tmp.add("e1",ctx.value(0));
			tmp.add("e2",ctx.value(1));
		}
		else if(ctx.value().size() == 1){
			if(ctx.SUB() != null){
				tmp.add("op","-");
				tmp.add("e2",visit(ctx.value(0)));
			}
			if(ctx.OPENP() != null){
				tmp.add("op",visit(ctx.value(0)));
				tmp.add("e1","(");
				tmp.add("e2",")");
			}
		}
		else if(ctx.value() == null){
			if(ctx.callfunc() != null) tmp.add("e1",visit(ctx.callfunc()));
			if(ctx.process() != null) tmp.add("e1",visit(ctx.process()));
			else tmp.add("e1",ctx.getText());
		}

		return tmp;
	}

	//@Override public ST visitBool(MouseBotParser.BoolContext ctx)

}
