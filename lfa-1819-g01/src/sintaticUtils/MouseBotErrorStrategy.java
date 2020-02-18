package sintaticUtils;

import org.antlr.v4.runtime.*;

public class MouseBotErrorStrategy extends DefaultErrorStrategy {
	public MouseBotErrorStrategy() {
		super();
	}
	// só mesmo rescrever esta função para mudar o print de erros, o resto é igual a DefaultErrorStrategy
	@Override public void reportError(Parser recognizer, RecognitionException e) {
		if (inErrorRecoveryMode(recognizer)) {
			return;
		}
		beginErrorCondition(recognizer);
		if ( e instanceof NoViableAltException ) {
			reportNoViableAlternative(recognizer, (NoViableAltException) e);
		}
		else if ( e instanceof InputMismatchException ) {
			reportInputMismatch(recognizer, (InputMismatchException)e);
		}
		else if ( e instanceof FailedPredicateException ) {
			reportFailedPredicate(recognizer, (FailedPredicateException)e);
		}
		else {
			// print de erro que alterei para Português
			// System.err.println("unknown recognition error type: "+e.getClass().getName());
			System.err.println("Erro desconhecido: "+e.getClass().getName());
			recognizer.notifyErrorListeners(e.getOffendingToken(), e.getMessage(), e);
		}
	}
}