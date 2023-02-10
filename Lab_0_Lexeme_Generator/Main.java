import java.io.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.regex.Pattern;

public class Main {
    static String stack = "",operator="=+-/*%",number="0123456789",op="",id="();{}.\"\'";
    static String ke = "int";//Other keywords can be added as well(using hashmap), but the question was only for int
    //this functions identifies varibles using regular expressions
    void print(){
        if(Pattern.matches("[0-9]+",stack)){
            System.out.println(stack +" -- Number");
        }
        else if(Pattern.matches("[A-Za-z]+",stack)){
            if(ke.contains(stack)){
                System.out.println(stack +" -- KeyWord");
            }
            else {
                System.out.println(stack +" -- Variable");
            }
        }
        else if(Pattern.matches("[A-Za-z0-9]+",stack)){
            System.out.println(stack +" -- Variable");
        }
        stack="";
    }
    //This function prints operators
    void printop(){
        System.out.println(op+" -- Operator");
        op= "";
    }
    //This functions identifies the tokens and converts them into tokens
    void lexical_tokenizer(String s){
        for (int i = 0; i < s.length(); i++){
            String c = s.substring(i,i+1);
            if(c.equals(" ")) {
                if(!stack.isEmpty()) print();
                if(!op.isEmpty()) printop();
            }
            else if(operator.contains(c)){
                if(!stack.isEmpty()) print();
                op +=c;
            }
            else if(id.contains(c)){
                if(!stack.isEmpty()) print();
                if(!op.isEmpty()) printop();
                System.out.println(c+" -- Punctuation");
                if(c.equals(";")){
                    i+=1;
                }
            }
            else{
                if(!op.isEmpty()) printop();
                stack += c;
            }
        }
    }

    public static void main(String[] args) {
        try {
            Path fileName = Path.of("input.txt");
            String code = Files.readString(fileName);
            Main l = new Main();
            l.lexical_tokenizer(code);
        }
        catch(IOException e) {
          e.printStackTrace();
        }
        
        
    }
}

