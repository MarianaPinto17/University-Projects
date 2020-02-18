package TestingArea;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Map.Entry;

import Modules.LSHSimilarity;
import Modules.bloomFilter;
import VideoClube.*;


public class TestBucket {
    private static bloomFilter bloom;
    private static MovieDatabase movieDB = new MovieDatabase();


    public static void main(String[] args){
        readMovies();
        createbloom();
        printbandas(LSHSimilarity.similarity(movieDB.getMovies()), movieDB.getMovies());

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


    public static void printbandas(LinkedList<HashMap<Long, LinkedList<Integer>>> bandas, LinkedList<Movie> filmes) {
        int i = 0;
        for (HashMap<Long, LinkedList<Integer>> s : bandas) {
            Iterator<Entry<Long, LinkedList<Integer>>> it = s.entrySet().iterator();

            while (it.hasNext()) {

                Entry<Long, LinkedList<Integer>> pair = it.next();
                if (pair.getValue().size() > 1) {
                    System.out.println(pair.getKey() + " " + pair.getValue());
                    for (int temp : pair.getValue()) {
                        System.out.println(filmes.get(temp).getTitulo());
                    }
                }


            }i++;

        }


    }
}