class Employee{
String Name 
Integer Age
Integer Salary
Employee(String name, Integer age, Integer salary){
this.Name=name;
this.Age=age;
this.Salary=salary;
}
}
 List li =new ArrayList()
(1..10).each {
Employee e =new Employee("richa$it",20+it,4998+it)
li.add(e)
}
 List lesssalary=li.findAll{emp->
 emp.Salary<5000
 }
 lesssalary.each{
 println  "Employees who earn less than 5000----->"+ it.Name +" " + it.Salary+" "+ it.Age
}
println "Oldest age Employee ---->"+li.max{it.Age}.Name
println "youngest age Employee ------> "+li.min{it.Age}.Name
println "Maximum salary Employee ---->"+li.max{it.Salary}.Name
println"list of names of all the employees-->"
li.each{
 println it.Name
}