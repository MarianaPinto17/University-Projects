package VideoClube;

import java.util.*;

/**
 * Created by TomásFreitas on 26/09/2017.
 */
public class MovieDatabase{
    private HashMap<Integer, Movie> movies = new HashMap<Integer, Movie>();
    private LinkedList<Movie> movie = new LinkedList<>();
    private final Scanner sc = new Scanner(System.in);
    private final int N = 0;

    public void addmovie(Movie toadd) {
        int id = toadd.getId();
        movies.put(id, toadd);
        movie.add(toadd);
    }

    public LinkedList<Movie> getMovies(){
        return movie;
    }

    public Movie getMovie(int id){
        return movies.get(id);
    }

    void removeMovie(int id) {
        if (movies.containsKey(id)) {
            movies.remove(id);
            System.out.println("Removed");
        } else {
            System.out.println("Movie does not seem to exist");
        }

    }

    void removeMovie(String title) {
        for (Map.Entry<Integer, Movie> entry : movies.entrySet()) {
            if (title.equalsIgnoreCase(entry.getValue().getTitulo())) {
                movies.remove(entry.getKey());
                System.out.println("Removed");
            } else {
                System.out.println("Movie does not seem to exist");
            }

        }
    }

    public int nametoid(String name){
        for (Map.Entry<Integer, Movie> entry : movies.entrySet()) {
            if(entry.getValue().getTitulo().equalsIgnoreCase(name)){
                return entry.getKey();
            }
        }
        return -1;
    }


    void checkout(int id, Client cli){
        if(movies.containsKey(id)){
            Movie toCheckout = movies.get(id);
            if (toCheckout.getChecked()){
                System.out.println("Movie already checked out");
            }else{
                toCheckout.setChecked(true);
                toCheckout.addCheckeduser(cli.getName(), cli.getClientid());
            }
        }else{
            System.out.println("Movie does not seem to exist");
        }
    }

    void checkin(int id, Client cli){
        if (movies.containsKey(id)){
            if (movies.get(id).getChecked()){
                giverating(id);
                movies.get(id).setChecked(false);
            }else{
                System.out.println("Movie is not checked out");
            }
        }else{
            System.out.println("Movie does not exist");
        }
    }

    int getlastcustomer(int id){
        if (movies.containsKey(id)){
            if (movies.get(id).getChecked()){
                return movies.get(id).getlastid();
            }else{
                System.out.println("Movie is not checked out");
            }
        }else{
            System.out.println("Movie does not exist");

        }
        return 0;
    }

    void listmovie(){

        for (Map.Entry<Integer, Movie> entry : movies.entrySet()) {
            System.out.println(entry.getValue().toString());
        }
    }



    void listcheckout(int id){
        String s = "";
        for (Map.Entry<Integer, Movie> entry : movies.entrySet()) {
            if (entry.getKey() == id){
                System.out.println(entry.getValue().listcheckoutbymovie());
            }
        }
    }

    void giverating(int id){
        System.out.println("Please rate this movie from 0 to 10");
        int rating = sc.nextInt();
        movies.get(id).setTotalrating(rating);
    }

    void sortByRating(){
        List<Movie> MovieByRating = new ArrayList<>(movies.values());
        Collections.sort(MovieByRating);
        for(Movie o : MovieByRating){
            if(o.getMeanRating() != 0){
                System.out.println(o.toString());
            }

        }
    }
}