package TestingArea;

import Modules.*;

import java.util.Set;

/**
 * Created by TomásFreitas on 23/11/2017.
 */
public class TestMinHasher {

    public static void main(String[] args){

        String toShingle = "ola pessoal o meu nome é wuant";
        Set<String> shingles = ShingleCreate.CreateShingle(toShingle);

        long[] minhash = MinHash.minHasher(shingles);
        long[] minhash2 = MinHash.minHasher(shingles);

        for (int i = 0; i < minhash.length; i++){
            System.out.println(minhash[i]);
            System.out.println(minhash2[i]);


        }


    }

}
