package TestingArea;

import Modules.ActorSimilarity;
import Modules.bloomFilter;
import VideoClube.Movie;
import VideoClube.MovieDatabase;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by TomásFreitas on 30/11/2017.
 */
//This Class is to provide with reason why the selected treshold in the main class was chosen
// Esta Classe tem o objetivo de demonstrar quantos falsos positivos existem consoante o valor de semelhança escolhido


public class TesteFalsePositives {
    private static MovieDatabase movieDB = new MovieDatabase();
    private static bloomFilter bloom;


    public static void main(String[] args) {
        readMovies();
        createbloom();
        HashMap<Double, Integer> falsos = new HashMap<>();
        HashMap<Double, Integer> encontrados = new HashMap<>();
        HashMap<Double, Integer> verdadeiros = new HashMap<>();
        ArrayList<String> str = new ArrayList<>();
        str.add("Leonardo DiCaprio");
        str.add("Daniel Radcliffe");
        str.add("Morgan Freeman");
        for (String strr : str) {
            for (double i = 0.01; i <= 0.08; i += 0.01) {
                for (Movie m : movieDB.getMovies()) {
                    if (ActorSimilarity.similaritycalc(m, strr) > i) {
                        System.out.println(strr + " " + i + " " + m.getTitulo());
                        if (!m.getActors().contains(strr)) {
                            if (!falsos.containsKey(i)) {
                                falsos.put(i, 1);
                                if (!encontrados.containsKey(i)) {
                                    encontrados.put(i, 1);
                                }
                            } else {
                                int var = falsos.get(i);
                                var++;
                                falsos.put(i, var);
                                encontrados.put(i, encontrados.get(i) + 1);
                            }
                        } else {
                            if (!verdadeiros.containsKey(i)) {
                                verdadeiros.put(i, 1);
                                if (!encontrados.containsKey(i)) {
                                    encontrados.put(i, 1);
                                }
                            } else {
                                int var = verdadeiros.get(i);
                                var++;
                                verdadeiros.put(i, var);
                                encontrados.put(i, encontrados.get(i) + 1);
                            }
                        }
                    }

                }
            }
            System.out.println("Falsos");
            for (Map.Entry<Double, Integer> entry : falsos.entrySet()) {
                System.out.println(entry.getKey() + " -->" + entry.getValue());
            }
            System.out.println("Verdadeiros");
            for (Map.Entry<Double, Integer> entry : verdadeiros.entrySet()) {
                System.out.println(entry.getKey() + " -->" + entry.getValue());
            }
            System.out.println("Total");
            for (Map.Entry<Double, Integer> entry : encontrados.entrySet()) {
                System.out.println(entry.getKey() + " -->" + entry.getValue());
            }


        }
    }





    private static void readMovies()
    {
        BufferedReader in;
        String line;
        String data[];
        try {
            in = new BufferedReader(new FileReader("src\\VideoClube\\finaldata.csv"));
            while ((line = in.readLine()) != null)
            {
                data = line.split(",");
                Movie vd = new Movie(data[0], Integer.parseInt(data[1]));
                if(Integer.parseInt(data[2]) == 0){
                    continue;
                }
                if(Integer.parseInt(data[2]) == 1){
                    vd.addactor(data[3],data[4]);
                }
                if(Integer.parseInt(data[2]) == 2){
                    vd.addactor(data[3],data[4]);
                    vd.addactor(data[5],data[6]);
                }

                if(Integer.parseInt(data[2]) == 3){
                    vd.addactor(data[3],data[4]);
                    vd.addactor(data[5],data[6]);
                    vd.addactor(data[7],data[8]);
                }

                if(Integer.parseInt(data[2]) == 4){
                    vd.addactor(data[3],data[4]);
                    vd.addactor(data[5],data[6]);
                    vd.addactor(data[7],data[8]);
                    vd.addactor(data[9],data[10]);

                }
                if(Integer.parseInt(data[2]) == 5){
                    vd.addactor(data[3],data[4]);
                    vd.addactor(data[5],data[6]);
                    vd.addactor(data[7],data[8]);
                    vd.addactor(data[9],data[10]);
                    vd.addactor(data[11],data[12]);
                }
                movieDB.addmovie(vd);
            }
            in.close();
        } catch(IOException e) {
            e.printStackTrace();
        }
    }
    public static void createbloom(){

        bloom = new bloomFilter(1000000, 6);
        for (Movie s : movieDB.getMovies()){
            s.minhash();
            bloom.add(s.getTitulo());
        }
    }



}
