import org.antlr.v4.runtime.*;

public class MouseBotLexerL extends BaseErrorListener {

    @Override public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
        System.err.println("linha:" + line + " coluna:" + charPositionInLine + " " + msg+"\n");
    }
}