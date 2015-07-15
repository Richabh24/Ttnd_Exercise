class Person {
   public  String name,age,address
    
 }


 class PersonDetail extends Person {
  private String  empId, company
     int salary 
   
   public String toString(){
  return "Sachin is a man aged ${age} who lives at ${address}. He works for ${company} with employee id ${empId} and draws lots of money !!!!." 
   
   }  

     
 }
static  main(ARGS){
     
    PersonDetail js = new PersonDetail();


 js.name="priya"
 js.age = 23
 js.address="delhi"
 js.empId="10001"
 js.company="TTND"
 js.@empId = '55555' 
 println js;
// println "Employee id = $js.empId , company = $js.company, $js.name is $js.age years old, Address = $js.address"
     }


 