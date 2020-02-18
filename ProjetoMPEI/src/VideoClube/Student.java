package VideoClube;

/**
 * Created by TomásFreitas on 26/09/2017.
 */
public class Student extends Client{

    private int mec;
    private String curso;

    public Student(String name, Data dob, int cc, int mec, String curso, Data insc){
        super(name, dob, cc, insc);
        this.mec = mec;
        this.curso = curso;
    }
}
