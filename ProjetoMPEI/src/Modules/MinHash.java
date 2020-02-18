package Modules;

import com.sangupta.murmur.Murmur2;

import java.nio.charset.Charset;
import java.util.Random;
import java.util.Set;

/**
 * Created by TomásFreitas on 23/11/2017.
 */
public class MinHash {

    static final long[] seeds = seedgenerator(300);



    public static long[] minHasher(Set<String> shingles){
        long[] minhashes = new long[300];
        long minHash = 1043953010;
        for(int i = 0; i < 300; i++){
            for(String s : shingles){
                long hash = Murmur2.hash(s.getBytes(Charset.forName("UTF-8")),s.getBytes(Charset.forName("UTF-8")).length, seeds[i]);
                if (hash < minHash){
                    minHash = hash;
                }
            }

            minhashes[i] = minHash;
            minHash = 1043953010;
        }
        return minhashes;
    }


    private static long[] seedgenerator(int size){
        long[] temp = new long[size];
        for (int i = 0; i < size; i++){
            Random r = new Random();
            long number = (long)(r.nextInt());
            temp[i] = number;
        }
        return temp;
    }

}
