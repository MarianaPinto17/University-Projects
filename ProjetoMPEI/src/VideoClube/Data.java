package VideoClube;
import java.util.*;
import java.time.*;
public class Data {
	final static Scanner sc = new Scanner(System.in);
	private int dia, mes, ano;

	public Data(int dia, int mes, int ano) {

		this.dia = dia;
		this.mes = mes;
		this.ano = ano;
	}

	public Data(String[] data) {
		if(validDate(Integer.parseInt(data[0]),Integer.parseInt(data[1]),Integer.parseInt(data[2]))) {
			this.dia = Integer.parseInt(data[0]);
			this.mes = Integer.parseInt(data[1]);
			this.ano = Integer.parseInt(data[2]);

		}
	}



	public int getDia() {
		return dia;
	}

	public int getMes() {
		return mes;
	}

	public int getAno() {
		return ano;
	}

	public static boolean validDate (int day, int month, int year){
		boolean dateIsValid = true;
	    try {
	        LocalDate.of(year, month, day);
	    } catch (DateTimeException e) {
	        dateIsValid = false;
	    }
	    return dateIsValid;
	}

	@Override
	public String toString() {
		return dia + "/" + mes + "/" + ano;
	}


}
