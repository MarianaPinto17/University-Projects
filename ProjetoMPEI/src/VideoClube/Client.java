package VideoClube;

/**
 * Created by TomásFreitas on 26/09/2017.
 */
public class Client {
    private static int counter;
    private int clientid;
    private String name;
    private Data dob;
    private int cc;
    private Data inscricao;


    public Client(String name, Data dob, int cc, Data inscricao) {
        this.name = name;
        this.dob = dob;
        this.cc = cc;
        this.clientid = ++counter;
        this.inscricao = inscricao;

    }

    public int getage(){
        return 2017 - dob.getAno();
    }

    public String getName(){
        return name;
    }

    public int getClientid() {
        return this.clientid;
    }
}
