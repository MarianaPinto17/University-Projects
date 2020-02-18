package TestingArea;

import java.util.UUID;
import Modules.bloomFilter;

/**
 * Created by TomásFreitas on 22/11/2017.
 */
public class TestBloomFilter {

    static String[] array = new String[10000];
    static String[] array2 = new String[1000000];
    static bloomFilter bloom = new bloomFilter(1000000, 10);
    static int falsepositives = 0;
    static int belongs = 0;
    static int populated = 0;

    public static void main(String[] args){
        //creating string array to add to bloomfilter


        for (int i = 0; i < array.length; i++){
            String s = UUID.randomUUID().toString();
            array[i] = s;
            bloom.add(s);
        }

        for (int i = 0; i< array.length; i++){
            int n = (int)(Math.random()*100000);
            if (array2[n] == null){
                array2[n] = array[i];
            }
        }

        for(int i = 0 ; i < array2.length; i++){
            if (array2[i] != null){
                populated++;
            }
        }

        for (int i = 0; i < array2.length; i++){
            if(array2[i] == null){
                array2[i] = UUID.randomUUID().toString();
            }
        }

        for(String s : array2){
            if (bloom.isMember(s)){
                if (check(s)){
                    //System.out.println("It really belongs");
                    belongs++;
                }else{
                    //System.out.println("False Positive");
                    falsepositives++;
                }


            }else{
                //System.out.println("Does not belong");

            }
        }

        System.out.println("The bloom filter has 10000 elements");
        System.out.println("Array2 was populated with " + String.valueOf(populated) + " elements from the bloomfilter");
        System.out.println("We detected " + String.valueOf(falsepositives) + " false positives");
        System.out.println("We found " + String.valueOf(belongs) + " elements");
        System.out.println("Overall the bloomfilter accused " + String.valueOf(belongs+falsepositives) + " elements");


    }

    public static boolean check(String s){
        for(int i = 0; i < array.length; i++){
            if(array[i].equalsIgnoreCase(s)){
                return true;
            }
        }
        return false;
    }



}
