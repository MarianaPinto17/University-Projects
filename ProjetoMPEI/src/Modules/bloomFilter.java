package Modules;


import com.sangupta.murmur.Murmur2;

import java.nio.charset.Charset;
import java.util.BitSet;
import java.util.Random;

public class bloomFilter
{
    private int nFuncoes, size;
    private boolean[] bloom;
    private long[] hash = new long[1000000];

    public bloomFilter(int size, int nFuncoes)
    {
        this.nFuncoes = nFuncoes;
        bloom = new boolean[size];
        this.size = size;
        generateSeeds();
    }

    private void generateSeeds(){
        for (int i = 0; i <= this.nFuncoes; i++ ){
            Random r = new Random();
            long number = (long)(r.nextInt());
            hash[i] = Math.abs(number);

        }
    }

    public void add(String s)
    {
        for (int i = 0; i <= nFuncoes; i++)
        {
            bloom[hash(s,size,hash[i])] = true;
        }
    }

    private static int hash(String word, int maxSize, long i)
    {
        long hash = Murmur2.hash(word.getBytes(Charset.forName("UTF-8")),word.getBytes(Charset.forName("UTF-8")).length,i);

        int a = Math.abs((int)(hash % maxSize));
        return a;
    }

    public boolean isMember(String s) {
        boolean found = true;
        for (int i = 1; i < nFuncoes; i++)
        {
            found = found && bloom[(hash(s,size,hash[i]))];
        }

        return found;
    }

    /**
     * @param dataSize (the data to be inserted in the filter)
     * @param collisionProb (probability of collision allowed between 0 and 1)
     * @return returns ideal size of BloomFilter
     */
    public static int getIdealSize(int dataSize, double collisionProb){
        return (int) (Math.ceil((dataSize * Math.log(collisionProb)) / Math.log(1.0 / (Math.pow(2.0, Math.log(2.0))))));
    }

    /**
     * @param idealBloomSize (calculated in previews method)
     * @param dataSize (the data to be inserted in the filter
     * @return ideal number of hashes to be used in each element of the filter
     */
    public static int getIdealNumberOfHashs(int idealBloomSize, int dataSize){
        return (int) (Math.log(2.0) * idealBloomSize / dataSize);
    }

}

