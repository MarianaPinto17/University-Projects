package VideoClube;

import Modules.ActorSimilarity;
import Modules.bloomFilter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Scanner;
import java.util.Calendar;


/**
 * Created by TomásFreitas on 26/09/2017.
 */
public class ManagmentMenu {

    private static final Scanner sc = new Scanner(System.in);
    private static MovieDatabase movieDB = new MovieDatabase();
    private static UserManagment userDB = new UserManagment();
    private static bloomFilter bloom;

    public static void main(String[] args) {
        readMovies();
        createbloom();



        int choice = 0;
        do {
            System.out.println("What do you want to do?");
            System.out.println("1 - Add a user");
            System.out.println("2 - Remove user");
            System.out.println("3 - Search for a Video");
            System.out.println("4 - List Movies");
            System.out.println("5 - Recommend a Movie by actors");
            System.out.println("6 - Recommend a Movie by another movie");
            System.out.println("7 - Checkout a movie");
            System.out.println("8 - Check in a movie");
            System.out.println("9 - List users that checked out movie");
            System.out.println("10 - List Movies by rating");
            choice = sc.nextInt();
            sc.nextLine();
            switch (choice) {
                case 1:
                    adduser();
                    break;
                case 2:
                    removeUser();
                    break;
                case 3:
                    searchforamovie();
                    break;
                case 4:
                    listMovies();
                    break;
                case 5:
                    RecommendMovie();
                    break;
                case 6:
                    recommendmovie();
                    break;
                case 7:
                    checkout();
                    break;
                case 8:
                    checkin();
                    break;
                case 9:
                    listcheckoutuser();
                    break;
                case 10:
                    listMoviesByRating();
                    break;
                case 11:
                    System.out.println("Xau");
                    break;
                default:
                    System.out.println("The choice was not recognized.\n");
                    break;
            }
        } while (choice != 11);
    }

    private static void readMovies() {
        BufferedReader in;
        String line;
        String data[];
        try {
            in = new BufferedReader(new FileReader("src\\VideoClube\\finaldata.csv"));
            while ((line = in.readLine()) != null) {
                data = line.split(",");
                Movie vd = new Movie(data[0], Integer.parseInt(data[1]));
                if (Integer.parseInt(data[2]) == 0) {
                    continue;
                }
                if (Integer.parseInt(data[2]) == 1) {
                    vd.addactor(data[3], data[4]);
                }
                if (Integer.parseInt(data[2]) == 2) {
                    vd.addactor(data[3], data[4]);
                    vd.addactor(data[5], data[6]);
                }

                if (Integer.parseInt(data[2]) == 3) {
                    vd.addactor(data[3], data[4]);
                    vd.addactor(data[5], data[6]);
                    vd.addactor(data[7], data[8]);
                }

                if (Integer.parseInt(data[2]) == 4) {
                    vd.addactor(data[3], data[4]);
                    vd.addactor(data[5], data[6]);
                    vd.addactor(data[7], data[8]);
                    vd.addactor(data[9], data[10]);

                }
                if (Integer.parseInt(data[2]) == 5) {
                    vd.addactor(data[3], data[4]);
                    vd.addactor(data[5], data[6]);
                    vd.addactor(data[7], data[8]);
                    vd.addactor(data[9], data[10]);
                    vd.addactor(data[11], data[12]);
                }
                movieDB.addmovie(vd);
            }
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void createbloom() {

        bloom = new bloomFilter(1000000, 6);
        for (Movie s : movieDB.getMovies()) {
            s.minhash();
            bloom.add(s.getTitulo());
        }
    }

    public static void searchforamovie() {
        boolean found;

        String title;
        do {
            System.out.println("Wich movie would you like to search?");
            title = sc.nextLine();
        } while (title.length() < 1);

        found = bloom.isMember(title);
        if (found) {
            System.out.println("Your movie is possibly available");
        } else {
            System.out.println("Your movie is not available.");
        }
    }


    public static void adduser() {
        String[] dobs;


        System.out.println("Name:");
        String name = sc.nextLine();

        do {
            System.out.println("Date of birth (dd-mm-yyyy)");
            String dob = sc.nextLine();
            dobs = dob.split("-");
        } while (!Data.validDate(Integer.parseInt(dobs[0]), Integer.parseInt(dobs[1]), Integer.parseInt(dobs[2])));

        Data date = new Data(dobs);

        System.out.println("CC:");
        int cc = sc.nextInt();
        sc.nextLine();

        System.out.println("MEC");
        int mec = sc.nextInt();
        sc.nextLine();

        System.out.println("Curso");
        String curso = sc.nextLine();

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");

        String formatted = format1.format(cal.getTime());
        String[] doinsc = formatted.split("-");
        Data data2 = new Data(doinsc);


        Student toadd = new Student(name, date, cc, mec, curso, data2);

        userDB.adduser(toadd);


    }

    public static void removeUser() {
        System.out.println("Please type the client id");
        int id = sc.nextInt();
        userDB.removeUser(id);

    }





    public static void listMovies() {

        movieDB.listmovie();
    }

    public static void checkout() {
        int temp = -1;
        int tempid = -1;

        do {
            temp = Nametoid();
        }while (temp == -1);

        do {
            tempid = clientid();
        }while (tempid == -1);

        movieDB.checkout(temp, userDB.getClient(tempid));
    }

    private static int Nametoid(){
        System.out.println("Please input the name of the movie");
        String name = sc.nextLine();

        for(Movie m : movieDB.getMovies()){
            if(m.getTitulo().equalsIgnoreCase(name)){
                return m.getId();
            }
        }
        return -1;
    }

    private static int clientid(){
        System.out.println("Please input your name");
        String name = sc.nextLine();

        for(String s: userDB.getUsername()){
            if(s.equalsIgnoreCase(name)){
                return userDB.id(name);
            }
        }
        return -1;
    }

    public static void checkin() {
        int temp = -1;
        int tempid = -1;

        do {
            temp = Nametoid();
        }while (temp == -1);

        do {
            tempid = clientid();
        }while (tempid == -1);

        int clientid = movieDB.getlastcustomer(temp);
        Client cli = userDB.getClient(tempid);
        movieDB.checkin(temp, cli);
    }

    public static void listcheckoutuser() {
        int temp = -1;

        do {
            temp = Nametoid();
        }while (temp == -1);
        movieDB.listcheckout(temp);
    }

    public static void listMoviesByRating() {
        movieDB.sortByRating();
    }

    public static void RecommendMovie() {
        System.out.println("Welcome to our recomendation area, input a name or several names seperated by a comma(,)");
        System.out.println("A higher similarity degree means that the movie probably has several of the actors");
        System.out.println("A lower one means that less actors are part of the movie");
        String recommend = sc.nextLine();
        System.out.println("Based on your input our System recommends");
        String[] actors = recommend.split(",");
        for (Movie s : movieDB.getMovies()) {
            double temp = ActorSimilarity.similaritycalc(s, recommend);
            if (temp > 0.05) {
                System.out.println(s.getTitulo() + " with the reference ID of " + s.getId() + " With a similarity of " + temp);
                for (int i = 0; i < actors.length; i++) {
                    String tocheck = actors[i];
                    if (i >= 1) {
                        tocheck = tocheck.substring(1);
                    }
                    if (s.getActors().contains(tocheck)) {
                        System.out.println("Tem presente " + actors[i]);
                    }
                }
            }
        }
    }

    public static void recommendmovie(){
        System.out.println("Welcome to our recomendation area, input movie name");
        System.out.println("A higher similarity degree means that the movie probably has several of the actors of the original movie");
        System.out.println("A lower one means that less actors are part of the movie");
        String recommend = sc.nextLine();
        String actorstr = "";
        for (Movie s: movieDB.getMovies()){
            if (s.getTitulo().equalsIgnoreCase(recommend)){
                actorstr = s.getActorsasString();
            }
        }
        if(actorstr.isEmpty()){
            System.out.println("Movie does not exist");
        }

        String[] actors = actorstr.split(",");
        for (Movie s : movieDB.getMovies()) {
            if(s.getTitulo().equalsIgnoreCase(recommend)){
                continue;
            }
            double temp = ActorSimilarity.similaritycalc(s, actorstr);
            if (temp > 0.05) {
                if(s.getTitulo().equalsIgnoreCase(recommend)){
                    continue;
                }
                System.out.println(s.getTitulo() + " with the reference ID of " + s.getId() + " With a similarity of " + temp);
                for (int i = 0; i < actors.length; i++) {
                    if(s.getTitulo().equalsIgnoreCase(recommend)){
                        continue;
                    }
                    String tocheck = actors[i];
                    if (i >= 1) {
                        tocheck = tocheck.substring(1);
                    }
                    if (s.getActors().contains(tocheck)) {
                        System.out.println("Tem presente " + actors[i]);
                    }
                }
            }
        }




    }

}

