package symbolTable;

public enum VarType {
	NUMBER {
		@Override public String toString() {return "Número";}
	}, 
	STRING {
		@Override public String toString() {return "String";}
	}, 
	BOOLEAN {
		@Override public String toString() {return "Boolean";}
	}, NOTUSED {
		@Override public String toString() {return "Não usada";}
	};
}