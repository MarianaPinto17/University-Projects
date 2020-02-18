package semanticUtils;

import java.lang.Comparable;

public class Position implements Comparable<Position> {
	
	protected int line;
	protected int column;

	public Position(int line, int column) {
		this.line = line;
		this.column = column;
	}

	public void setLine(int line) {this.line = line;}
	public void setColumn(int column) {this.column = column;}

	public int getLine() {return line;}
	public int getColumn() {return column;}

	@Override public String toString() {
		return "linha:" + line + " coluna:" + column;
	}

	@Override public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + column;
		result = prime * result + line;
		return result;
	}

	@Override public boolean equals (Object obj) {
		if (obj == this) return true;
		if (obj == null) return false;
		if (getClass() != obj.getClass()) return false;
		Position pos = (Position) obj;
		return line == pos.line && column == pos.column;
	}

	public int compareTo(Position p) {
		if(p == null) throw new NullPointerException();
		if(line<p.line) return -1;
		if(line>p.line) return 1;
		if(column<p.column) return -1;
		if(column<p.column) return 1;
		return 0;
	}
}