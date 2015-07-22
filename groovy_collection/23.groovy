class Employee{
String Name 
Integer Age
Integer Salary
String DepartmentName 
String EmployeeNumber 
Employee(String name, Integer age, Integer salary,String departmentName,String employeeNumber){
this.Name=name;
this.Age=age;
this.Salary=salary;
this.DepartmentName=departmentName;
this.EmployeeNumber= employeeNumber;
}
}
 List li =new ArrayList()
(1..50).each {

if(it<20){dept ='Development'
name="richa$it"
}else if(it>=20&&it<=40){dept='Testing'
name="priya$it"
}else{name="anshu$it" 
dept='Marketing'}
Employee e =new Employee(name,15+it,4998+it*10,dept,"E00G$it")

li.add(e)
}

//a


//b
 
println li.countBy { it.DepartmentName}
 //c
 List lesssalary=li.findAll{emp->
 emp.age>18 && emp.age<35
 }
 lesssalary.each{
println  "Employees whose age is between 18 and 35 ---->"+ it.Name +" " + it.Salary+" "+ it.Age
}



//d

def result =li.groupBy({it.name[0]})

result.each{
print "------------------->-$it"
}

