package sintaticUtils;

import java.util.*;

public class UnwantedToken {
	// HashMap<Token, Mensagem> 
	private HashMap<String, String> messageMap;

	public UnwantedToken() {
		messageMap = new HashMap<String, String>();
		messageMap.put("START", "Programa tem que começar com:\nSTART \"nome robot\"\n...instruções...\nEND");
		messageMap.put("END", "Programa não terminada corretamente: \n...instruções...\nEND");
		messageMap.put("')'", "Obrigatório fechar parênteses ')'");
		messageMap.put("'['", "Condição incorreta, Usar: \n[condição]=> ...instruções...\n");
		messageMap.put("'=>'", "Funções são escritas da seguinte maneira: \nFUNCTION nome(valores) => retorno\n...instruções...\nENDFUNCTION");
		messageMap.put("ENDFUNC", "Função incorreta: \n...instruções...\nENDFUNCTION");
		messageMap.put("ActionType1", "Erro nas instruçoes; exemplo de instruções:\nLOOP [condição]=> \n...instruções...\nENDLOOP\n\nACTIONS [condição]=> \n...instruções...\nENDACTIONS\n\nMOTORS(valor, valor)\n\nWRITE(\"informação\")\netc...");
	}

	public String message(String token) {
		if(messageMap.containsKey(token)) return messageMap.get(token);
		else return "";
	}

	public boolean contains(String token) {
		return messageMap.containsKey(token);
	}

	public String getNewMessage(LinkedList<String> expectedTokens, String msg) {
		/* analisa prioridades das mensagens "à bruta" (até me mete nojo fazer isto desta maneira
		, mas falta pouco tempo para a entrega e não posso fazer algo mais refinado)*/
		String newMsg = "";
		// se o que estava á espera é um NEWLINE então o token deve estar imcompleto ou a mais
		if(expectedTokens.size()==1 && expectedTokens.getFirst().equals("NEWLINE")) {
    		return "O simbolo '" + msg.split("'")[1] + "' está incompleto ou a mais!";
    	}
    	// se estava á espera da  
    	else if(expectedTokens.size()==1 && expectedTokens.getFirst().equals("STRING")) {
    		return "Falta o nome do Robot: \nSTART \"NOME ROBOT\"";
    	}
    	// se ficou á espera deste token então estamos na definição de uma função 
    	else if(expectedTokens.contains("'=>'")) {
    		newMsg += message("'=>'");
    	}
    	// funcionamento normal, junta todas as mensagens de erro 
    	else {
    		for(String token : expectedTokens) {
    			//System.out.println("|"+token+"|");
    			if(newMsg.length()!= 0 && contains(token)) newMsg += "\nOutra sugestão!: ";
    			newMsg += message(token);
    		}
    	}
    	return newMsg;
	}
		
}