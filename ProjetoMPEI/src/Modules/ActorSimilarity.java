package Modules;

import VideoClube.Movie;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by TomásFreitas on 30/11/2017.
 */
public class ActorSimilarity {

    public static double similaritycalc(Movie um, String actor){
        Set<String> shingle = ShingleCreate.CreateShingle(actor);


        long[] minhash1 = um.getMinhash();
        long[] minhash2 = MinHash.minHasher(shingle);



        int ncomum = getcommon(minhash1,minhash2);
        int nunicos = getunique(minhash1, minhash2);


        double similarity = (double)ncomum / (double)nunicos;

        return similarity;



    }




    public static int getcommon (long[] um, long[] dois){
        ArrayList<Long> comum = new ArrayList<>();

        for(int i = 0; i < um.length; i++){
            for(int j = 0; j<dois.length; j++){
                if(um[i] == dois[j]){
                    if(!comum.contains(um[i])){
                        comum.add(um[i]);
                    }
                }
            }
        }
        return comum.size();
    }

    public static int getunique(long[] um, long[] dois){
        Set<Long> unique = new LinkedHashSet<>();
        for (long s : um){
            unique.add(s);
        }

        for (long s : dois){
            unique.add(s);
        }
        return unique.size();
    }
}
