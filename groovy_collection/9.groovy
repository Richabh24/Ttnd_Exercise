String s = "this string needs to be split" 
println s.tokenize(" ") 
println s.tokenize() 

assert s.tokenize(" ")==s.tokenize()

String s1 = "this string needs to be split" 
println s1.split(" ") 
println s1.split(/\s/)
println s1.tokenize(/\s/)
assert s1.split(" ")==s1.split(/\s/) 


String s2 = "are.you.trying.to.split.me.mister?" 
println s2.tokenize(".")
println s2.split(".") 
assert s2.tokenize(".")==s2.split(".") 
