package TestingArea;

import java.util.*;

import Modules.*;

/**
 * Created by TomásFreitas on 23/11/2017.
 */
public class TestSimilarity {

    public static void main(String[] args){
        String um = "AS armas e os Barões assinalados" +
                "Que da Ocidental praia Lusitana" +
                "Por mares nunca de antes navegados" +
                "Passaram ainda além da Taprobana," +
                "Em perigos e guerras esforçados" +
                "Mais do que prometia a força humana," +
                "E entre gente remota edificaram" +
                "Novo Reino, que tanto sublimaram;";
        String dois = "Novo Reino, que tanto sublimaram;" +
                "Que da Ocidental praia Lusitana" +
                "Por mares nunca de antes navegados" +
                "Passaram ainda além da Taprobana," +
                "Em perigos e guerras esforçados" +
                "Mais do que prometia a força humana," +
                "E entre gente remota edificaram" +
                "AS armas e os Barões assinalados";

        Set<String> shingle1 = ShingleCreate.CreateShingle(um);
        Set<String> shingle2 = ShingleCreate.CreateShingle(dois);

        for(int i = 0; i < shingle1.toArray().length; i++){
            System.out.println(shingle1.toArray()[i]);
        }
        for(int i = 0; i < shingle2.toArray().length; i++){
            System.out.println(shingle2.toArray()[i]);
        }


        long[] minhash1 = MinHash.minHasher(shingle1);
        long[] minhash2 = MinHash.minHasher(shingle2);



        int ncomum = getcommon(minhash1,minhash2);
        int nunicos = getunique(minhash1, minhash2);

        System.out.println(ncomum + " , " + nunicos);

        double similarity = (double)ncomum / (double)nunicos;

        System.out.println(similarity);
        System.out.println(1-similarity);



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
