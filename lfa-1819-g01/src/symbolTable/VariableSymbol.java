package symbolTable;

public class VariableSymbol extends Symbol {
	
	protected VarType type;

	public VariableSymbol(String name, VarType type) {
		super(name);
		this.type = type; 
	}

	public VarType type() { return type; }

	public void setType(VarType type) {
		this.type = type;
	}

	public boolean compType(VariableSymbol v) {
		return type.equals(v.type);
	}

	@Override public String toString() {
		return super.toString() + "=>" + type();
	}

	@Override public boolean equals(Object obj) {
		if(!super.equals(obj)) return false;
		if (getClass() != obj.getClass()) return false;
		VariableSymbol v = (VariableSymbol) obj; 
		return (type.equals(v.type));
	}
	@Override public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}
}