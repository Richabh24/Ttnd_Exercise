List li = [1, 2, 3, "element1", 0.3, [2, 4, 6], 0..10 ] 
li.each{
println it.class
}

println li.get(6).get(9)