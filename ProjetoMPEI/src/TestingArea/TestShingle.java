package TestingArea;


import java.util.Set;
import java.util.UUID;
import Modules.ShingleCreate;
/**
 * Created by TomásFreitas on 23/11/2017.
 */
public class TestShingle {

    public static void main(String[] args){


        String toShingle = "ola pessoal o meu nome é wuant";
        System.out.println(toShingle);
        Set<String> shingles = ShingleCreate.CreateShingle(toShingle);
        for (String s : shingles){
            System.out.println(s);
        }



    }

}
