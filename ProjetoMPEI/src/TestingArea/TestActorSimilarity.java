package TestingArea;

import Modules.ActorSimilarity;
import Modules.Similarity;
import Modules.bloomFilter;
import VideoClube.Movie;
import VideoClube.MovieDatabase;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;

/**
 * Created by TomásFreitas on 30/11/2017.
 */
public class TestActorSimilarity {
    private static bloomFilter bloom;
    private static MovieDatabase movieDB;

    public static void main(String[] args){
        readMovies();
        createbloom();
        String original = "Leonardo DiCaprio";

        for(Movie temp: movieDB.getMovies()){
            if(ActorSimilarity.similaritycalc(temp, original)>0.05){
                System.out.println(temp.getActorsasString());
                System.out.println(temp.getTitulo());
            }
        }

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

}
