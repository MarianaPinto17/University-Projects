package TestingArea;

import Modules.MinHashCompare;

public class TestMinhashCompare {

    public static void main(String[] args){
        String str = "A Mariana é mesmo burra";
        String str2 = "A Mari é mesmo burra";

        double lol = MinHashCompare.Compare(str, str2);
        System.out.println(lol);

    }




}
