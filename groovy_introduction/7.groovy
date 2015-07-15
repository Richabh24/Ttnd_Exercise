public class LoopTest{
  public static void main(args){

     // 10.downto(1) {println it*3}
     // println "-----------------"
      1.upto(10) { println it*3}
      println "-----------------"
      (1..10).each {println it*3}
       println "-----------------"
      1.step 11, 1, {
   println it*3
}
      
  }  
} 

