List l=[]
[1..10].each{
l= it
l.each{
if (it % 2 == 0)
println it
   }
}