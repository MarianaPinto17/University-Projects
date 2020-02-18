package sintaticUtils;
import org.antlr.v4.runtime.*;

public class MouseBotErrorListener extends BaseErrorListener {

    @Override public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
        String newMessage = "";
        if(msg.contains("no viable alternative"))  newMessage = reportNoViableAlternative(msg);
        else if(msg.contains("mismatched")) newMessage = reportInputMismatch(msg);
        else if(msg.contains("rule")) newMessage = reportFailedPredicate(msg);
        else if(msg.contains("extraneous")) {
            // RecognitionException é null neste caso por isso não mando
            newMessage = ReportUnwantedToken.newMessage(msg);
        }
        else if(msg.contains("missing")) newMessage = reportMissingToken(msg);
        
        if(newMessage.length()!=0)
            System.err.println("linha:" + line + " coluna:" + charPositionInLine + " " + newMessage+"\n");
        //System.err.println("linha:" + line + " coluna:" + charPositionInLine + " " + msg);

    }
    private String reportNoViableAlternative(String msg) {
        msg = msg.replace("no viable alternative at input", "Sem alternativa viável");
        return msg;
    }

    private String reportInputMismatch(String msg) {
        msg = msg.replace("mismatched input", "Input errado");
        msg = msg.replace("expecting", "devia ser");
        return msg;
    }

    private String reportFailedPredicate(String msg) {
        msg = msg.replace("rule", "Regra");
        return msg;
    }

    private String reportMissingToken(String msg) {
        msg = msg.replace("missing", "Falta");
        msg = msg.replace("at", "em");
        return msg;
    }
}
