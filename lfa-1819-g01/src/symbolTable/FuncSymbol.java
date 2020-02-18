package symbolTable;

import java.util.*;

public class FuncSymbol extends Symbol {

	private LinkedList<VariableSymbol> parametros;
	private VariableSymbol returnVar = null;

	public FuncSymbol(String name) {
		super(name);
		parametros = new LinkedList<>();
	}

	public void addReturn(String id, VarType type) {
		returnVar = new VariableSymbol(id, type);
	}
	
	public void removeReturn() {
		returnVar = null;
	}

	public void addParametro(String id, VarType type) {
		parametros.addLast(new VariableSymbol(id, type));
	}

	public boolean changeReturn (String id, VarType type) {
		if(returnVar!=null && returnVar.name().equals(id)) {
			returnVar.setType(type);
			return true;
		}
		return false;
	}

	public boolean changeParam (String id, VarType type) {
		for(VariableSymbol param : parametros) {
			if(param.name().equals(id)) {
				if(param.type().equals(VarType.NOTUSED)) {
					param.setType(type);
					return true;
				}
				break;
			}
		}
		return false;
	}

	public void defaultValues() {
		for(VariableSymbol param : parametros) {
			if(param.type().equals(VarType.NOTUSED)) {
				param.setType(VarType.NUMBER);
			}
		}
		if(returnVar!=null && returnVar.type().equals(VarType.NOTUSED))
			returnVar.setType(VarType.NUMBER);
	}
	public boolean hasReturn() {return returnVar==null;}

	public VarType returnType() {return returnVar.type();}

	@Override public String toString() {
		return super.toString() + "(" 
		+ parametros.stream().map(var->var.type().toString()).reduce("", 
		(sum,var)-> (sum.length()==0) ? (sum + var) : (sum + ", " + var))
		+ ")" 
		+ (returnVar==null ? "" 
		: ("=>"+returnVar.type()) );
	}
	// equals específico para o tipo de comparações que usamos, não compara os nomes dos parâmetro, só o seu tipo
	@Override public boolean equals(Object obj) {
		if (!super.equals(obj)) return false;
		if (getClass() != obj.getClass()) return false;
		FuncSymbol other = (FuncSymbol) obj;
		if(parametros.size()!=other.parametros.size()) return false;
		Iterator<VariableSymbol> iter1 = parametros.iterator(); 
		Iterator<VariableSymbol> iter2 = other.parametros.iterator();
    	while(iter1.hasNext())
        	if(!iter1.next().type().equals(iter2.next().type())) return false;
		if (returnVar == null) {
			if (other.returnVar != null) return false;
		} else if (!returnVar.type().equals(other.returnVar.type())) return false;
		return true;
	}
	// tb um hashcode específico que só usa tipos de parâmetros mas não o seu nome
	@Override public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		for(VariableSymbol v : parametros)
			result = prime * result + v.type().hashCode();
		result = prime * result + ((returnVar == null) ? 0 : returnVar.type().hashCode());
		return result;
	}

}