package sintaticUtils;
import org.antlr.v4.runtime.*;
import java.util.LinkedList;

public class ReportUnwantedToken {
	
	private static LinkedList<String> lastError = null;

	public static String newMessage(String msg) {
		return getMessage(getListExpectedTokens(msg), msg);
	}

    private static LinkedList<String> getListExpectedTokens(String msg) {
    	LinkedList<String> expectedTokens = new LinkedList<String>();
    	if(msg.charAt(msg.length()-1)=='}') {
    		String[] listTokens = msg.substring(msg.indexOf('{')+1, msg.length()-1).split(",");
    		for(String s : listTokens) expectedTokens.addLast(s.trim());
    	} else {
    		expectedTokens.addLast(msg.substring(msg.lastIndexOf(" ")+1));
    	}
    	return expectedTokens;
    }

    private static UnwantedToken listaMensagens = new UnwantedToken();
    
    private static String getMessage(LinkedList<String> expectedTokens, String msg) {
    	// impede o antlr4 de repetir a mesma mensagem de erro ad nauseam
    	if(expectedTokens.equals(lastError)) return "";
    	// já não é a mesma mensagem
    	lastError = expectedTokens;
    	return listaMensagens.getNewMessage(expectedTokens, msg);
    }
}