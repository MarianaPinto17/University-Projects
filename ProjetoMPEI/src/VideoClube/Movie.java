package VideoClube;

import Modules.MinHash;
import Modules.ShingleCreate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by TomásFreitas on 26/09/2017.
 */
public class Movie implements Comparable<Movie> {
    private static int counter;
    private String title;
    private int id;
    private int ano;
    private int totalrating;
    private int meanrating;
    private boolean checked;
    private ArrayList<String> checkedby = new ArrayList<>();
    private ArrayList<Integer> checkedbyid = new ArrayList<>();
    private LinkedList<String> actors = new LinkedList<>();
    private HashMap<String, String> cast = new HashMap<>();
    private long[] minhash;


    public Movie(String title, int ano) {
        this.title = title;
        this.id = ++counter;
        this.checked = false;
        this.ano = ano;

    }

    public void addactor(String actor, String character) {
        actors.add(actor);
        cast.put(actor, character);
    }

    public LinkedList<String> getActors() {
        return actors;
    }

    public String getActorsasString() {
        String listString = String.join(", ", actors);
        return listString;


    }

    public void minhash() {

        minhash = MinHash.minHasher(ShingleCreate.CreateShingle(this.getActorsasString()));
    }

    public long[] getMinhash() {
        return this.minhash;
    }

    public int getId() {
        return id;
    }

    public String getTitulo() {
        return title;
    }

    public void setChecked(boolean check) {
        this.checked = check;
    }

    public boolean getChecked() {
        return checked;
    }

    public int getlastid() {
        return this.checkedbyid.get(this.checkedbyid.size() - 1);
    }

    public void addCheckeduser(String user, int id) {
        this.checkedby.add(user);
        this.checkedbyid.add(id);
    }


    public String listcheckoutbymovie() {
        String temp = "";
        if (checkedby.size() == 0) {
            return "Not Checked Out by anyone";
        } else {
             return String.join(", ", checkedby);

        }

    }




    public void setTotalrating(int rating){
        this.totalrating += rating;
    }

    public int getMeanRating(){
        if(checkedby.size() == 0){
            return 0;
        }
        int temp = this.totalrating / this.checkedby.size();
        this.meanrating = temp;
        return temp;
    }

    public int getAno(){
        return ano;
    }

    @Override
    public String toString()
    {
        return "Video -> Id: " + getId() + ", Título: " + getTitulo() + ", Ano: " + getAno() + " Actors: " + getActors().toString() + " Rating: " + this.meanrating;
    }

    @Override
    public int compareTo(Movie o) {
        if(this.getMeanRating()>o.getMeanRating()){
            return 1;
        }
        else if(this.getMeanRating()<o.getMeanRating()){
            return -1;
        }else{
            return 0;
        }
    }
}

