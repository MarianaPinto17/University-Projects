package semanticUtils;

public enum ErrorType {
	NOTDEFINED {
		@Override public String toString() {return "Não está definido!";}
	},
	NOTDECLARED {
		@Override public String toString() {return "Não foi declarado!";}
	}, 
	EXPECTBOOL {
		@Override public String toString() {return "Tem que ser um boolean!";}
	}, 
	WRONGOPERATOR {
		@Override public String toString() {return "Tem que ser uma soma!";}
	}, 
	ALREADYDEFINED {
		@Override public String toString() {return "Esta função já foi definida antes!";}
	};
}