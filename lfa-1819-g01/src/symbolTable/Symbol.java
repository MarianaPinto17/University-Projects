package symbolTable;

//public abstract class Symbol {
public class Symbol {

	protected String name;

	public Symbol(String name) {
		this.name = name;
	}
	public String name() { return name; }
	
	@Override public String toString() {
		return name;
	}

	@Override public boolean equals (Object obj) {
		if (obj == this) return true;
		if (obj == null) return false;
		if (getClass() != obj.getClass()) return false;
		Symbol s = (Symbol) obj;
		if (name == null) 
			if (s.name != null)
				return false;
		// Case insensitive language!!
		return name.toLowerCase().equals(s.name.toLowerCase());
	}

	@Override public int hashCode() {
		final int prime = 31;
		int result = 1;
		// Case insensitive language!!
		result = prime * result + ((name == null) ? 0 : name.toLowerCase().hashCode());
		return result;
	}
}