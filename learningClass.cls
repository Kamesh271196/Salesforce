public class learningClass {
    public string helloworld;
    public integer result;
   private static final string defaultstring;
    static
    {
        defaultstring='Hello Kamesh';
    }
    public void printout1(string stringtodisplay)
    {
        System.debug('Hey the output is: '+stringtodisplay);
    }
    public learningClass()
    {
        this(defaultstring);
    }
     public learningClass(String stringtodisplay)
    {
        this.helloworld = stringtodisplay;
    }
    public  void printout(){
        System.debug(helloworld);
    }
    public static void printout2(){
        System.debug('Static method');
    }
 private static integer add(integer a,integer b)
 {
     return a+b;
 }
    private static integer multiply(integer a,integer b)
 {
     return a*b;
 }
    private static integer subtract ( integer a, integer b ) 
    {
     return a-b;
}
 
private static void printOutput(Integer a, Integer b){
    System.debug('Summation of 2 values:' + add(a,b));
    System.debug('Multiplication of 2 values:' + multiply(a,b));
   System.debug('Substraction of 2 values:' + subtract(a,b));
}
public void doMath(Integer a, Integer b){
printOutput(a, b);
}
    
    

}