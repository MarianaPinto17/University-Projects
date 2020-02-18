package Modules;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by TomásFreitas on 30/11/2017.
 */
public class Similarity {
    public static double similaritycalc(String um, String dois){
        Set<String> shingle1 = ShingleCreate.CreateShingle(um);
        Set<String> shingle2 = ShingleCreate.CreateShingle(dois);

//        for(int i = 0; i < shingle1.toArray().length; i++){
//            System.out.println(shingle1.toArray()[i]);
//        }
//        for(int i = 0; i < shingle2.toArray().length; i++){
//            System.out.println(shingle2.toArray()[i]);
//        }


        long[] minhash1 = MinHash.minHasher(shingle1);
        long[] minhash2 = MinHash.minHasher(shingle2);



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
