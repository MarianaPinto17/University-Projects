package Modules;
import VideoClube.Movie;

public class MinHashCompare {


    public static double Compare(Movie movie1, Movie movie2){
        double similarity = 0;
        long[] minhash1 = movie1.getMinhash();
        long[] minhash2 = movie2.getMinhash();
        int count=0;

        for (int i=0; i<300; i++){
            if(minhash1[i] == minhash2[i]){
                count++;
            }
        }
        similarity=count/300;
        return similarity;
    }

    public static double Compare(String s, Movie movie1){
        double similarity = 0;
        long[] minhash1 = movie1.getMinhash();
        long[] minhash2 = MinHash.minHasher(ShingleCreate.CreateShingle(s));
        double count=0;

        for (int i=0; i<300; i++){
            if(minhash1[i] == minhash2[i]){
                count++;
            }
        }
        similarity=count/(double)(300);
        return similarity;
    }

    public static double Compare(String um, String dois){
        double similarity = 0;
        long[] minhash1 = MinHash.minHasher(ShingleCreate.CreateShingle(um));
        long[] minhash2 = MinHash.minHasher(ShingleCreate.CreateShingle(dois));
        double count=0;

        for (int i=0; i<300; i++){
            if(minhash1[i] == minhash2[i]){
                count++;
            }
        }
        similarity= count/ (double)(300);
        return similarity;
    }
}


