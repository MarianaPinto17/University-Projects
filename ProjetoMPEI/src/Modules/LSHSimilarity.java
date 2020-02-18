package Modules;

import Modules.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.*;
import VideoClube.*;
import com.sangupta.murmur.Murmur2;

/**
 * Created by TomásFreitas on 27/11/2017.
 */
public class LSHSimilarity {

    static int[] vetorrandom = new int[5];
    static LinkedList<HashMap<Long, LinkedList<Integer>>> bandas = new LinkedList<HashMap<Long, LinkedList<Integer>>>();

    public static LinkedList<HashMap<Long, LinkedList<Integer>>> similarity(LinkedList<Movie> n) {
        //creating the

        int i = 0;
        long[][] matrix = new long[100][n.size()];

        for (Movie temp : n) {
            long[] temparray = temp.getMinhash();
            for (int k = 0; k < 100; k++){
                matrix[k][i] = temparray[k];
            }
            i++;
        }


        for (int k = 0; k < 5; k++){
            vetorrandom[k] = (int)(Math.random()*100109 - 1);
        }


        for(int k = 0; k < 100; k+=5){
            bandas.add(k/5, (new HashMap<Long, LinkedList<Integer>>()));
            for (int j = 0; j<n.size(); j++){
                long[] bandat = {matrix[k][j], matrix[k+1][j], matrix[k+2][j], matrix[k+3][j], matrix[k+4][j]};

                long valuetohash = bandat[0] * vetorrandom[0] + bandat[1] * vetorrandom[1] + bandat[2] * vetorrandom[2]+ bandat[3] * vetorrandom[3] + bandat[4] * vetorrandom[4];

                long hash = Murmur2.hash(String.valueOf(valuetohash).getBytes(Charset.forName("UTF-8")), String.valueOf(valuetohash).getBytes(Charset.forName("UTF-8")).length,vetorrandom[1]);
                if(j == 2089){
                    System.out.println("from main loop");
                    System.out.println(hash);
                }
                if(!bandas.get(k/5).containsKey(hash)){
                    bandas.get(k/5).put(hash, new LinkedList<Integer>());
                }
                bandas.get(k/5).get(hash).add(n.get(j).getId());
            }
        }

        return bandas;
    }

    public static void Comparemovies(Movie m){


        //calcular bandas para o filme a comparar
        LinkedList<HashMap<Long, LinkedList<Integer>>> banda = new LinkedList<HashMap<Long, LinkedList<Integer>>>();
        long[] temparray = m.getMinhash();
        for(int k = 0; k < 20; k++){
            banda.add(k, (new HashMap<Long, LinkedList<Integer>>()));
            long[] bandat = {temparray[k], temparray[k+1], temparray[k+2], temparray[k+3], temparray[k+4]};
            long valuetohash = bandat[0] * vetorrandom[0] + bandat[1] * vetorrandom[1] + bandat[2] * vetorrandom[2]+ bandat[3] * vetorrandom[3] + bandat[4] * vetorrandom[4];
            long hash = Murmur2.hash(String.valueOf(valuetohash).getBytes(Charset.forName("UTF-8")), String.valueOf(valuetohash).getBytes(Charset.forName("UTF-8")).length,vetorrandom[1]);
            System.out.println("from comparemovies");
            System.out.println(hash);
        }




    }




}
