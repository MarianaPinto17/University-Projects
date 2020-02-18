package Modules;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by TomásFreitas on 23/11/2017.
 */
public class ShingleCreate {


    private ShingleCreate(){}

    public static Set<String> CreateShingle(String s){
        Set<String> uniqueShingles = new LinkedHashSet<>();

        for(int i = 0; i < s.length() - 5; i++){
            String shingle = s.substring(i, i+4);
            uniqueShingles.add(shingle);
        }

        return uniqueShingles;

    }

}
