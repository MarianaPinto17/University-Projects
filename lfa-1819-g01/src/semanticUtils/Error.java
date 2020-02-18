package semanticUtils;

import symbolTable.*;
import java.util.Stack;

public class Error {
	
	private Symbol symbolError; 
	private ErrorType errorType;

	public Error(Symbol symbolError, ErrorType errorType) {
		this.symbolError = symbolError;
		this.errorType = errorType;
	}

	@Override public String toString() {
		if(errorType.equals(ErrorType.WRONGOPERATOR)) return symbolError.toString() + " " + errorType;
		return symbolError.toString() + ": " + errorType;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		if (getClass() != obj.getClass()) return false;
		Error other = (Error) obj;
		if (errorType != other.errorType) return false;
		if (symbolError == null) {
			if (other.symbolError != null) return false;
		} else if (!symbolError.equals(other.symbolError)) return false;
		return true;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((errorType == null) ? 0 : errorType.hashCode());
		result = prime * result + ((symbolError == null) ? 0 : symbolError.hashCode());
		return result;
	}
}