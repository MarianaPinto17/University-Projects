package TestingArea;

import com.sangupta.murmur.*;

import java.nio.charset.Charset;

/**
 * Created by TomásFreitas on 21/11/2017.
 */
public class TestHashing {

    public static void main(String[] args){
        String ola = "ola";
        long seed = 32;
        long seed2 = 33;
        long hash = Murmur2.hash(ola.getBytes(Charset.forName("UTF-8")),ola.getBytes(Charset.forName("UTF-8")).length, seed);
        System.out.println(hash);
        long hash2 = Murmur2.hash(ola.getBytes(Charset.forName("UTF-8")),ola.getBytes(Charset.forName("UTF-8")).length, seed2);
        System.out.println(hash2);

    }



}
