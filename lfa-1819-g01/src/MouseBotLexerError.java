import org.antlr.v4.runtime.atn.LexerATNSimulator;
import org.antlr.v4.runtime.misc.IntegerStack;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.misc.Pair;
import org.antlr.v4.runtime.*;

public class MouseBotLexerError extends MouseBotLexer {

	public MouseBotLexerError(CharStream input) {
		super(input);
	}

	@Override public void notifyListeners(LexerNoViableAltException e) {
		String text = _input.getText(Interval.of(_tokenStartCharIndex, _input.index()));
		String msg = "'"+ getErrorDisplay(text) + "' não é reconhecido por esta linguagem! Por favor apagar...";

		ANTLRErrorListener listener = getErrorListenerDispatch();
		listener.syntaxError(this, null, _tokenStartLine, _tokenStartCharPositionInLine, msg, e);
	}
}