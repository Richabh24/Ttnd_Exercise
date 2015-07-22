class Stack {
List l =new ArrayList()
void push1(def value){
l.add(value)
println l
}

void pop(){
def a = l.remove(0)
println a
}
void top(){
def a = l.get(0)
println a
}
static void main(ARGS){
Stack a =new Stack()
println "push element"
 a.push1('b')
a.push1('a')
a.push1('c')
println "Top element"
a.top()

println "pop  element"
a.pop()
println "now Top element"
a.top()
println "again pop  element"
a.pop()
a.pop()

}

}