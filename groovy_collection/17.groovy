Map friendmap=['anshu':24,'udit':28,'ankush':40,'umesh':25,'deepak':26]
println friendmap
friendmap.each{
println it.key +"  "+ it.value
}
friendmap.eachWithIndex{it, index->
println it.key +"  "+ it.value+ " "+index
friendmap.every{
println it.key +"  "+ it.value
}

}