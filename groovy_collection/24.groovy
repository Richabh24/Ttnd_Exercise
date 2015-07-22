String fetchValueFromKey(String url,String key)

{ def map = [:]
 url.splitEachLine("&"){
   it.each{ x ->
     def object = x.split("=")
     map.put(object[0], object[1])
   }
 }
if(map[key]) {
    return map[key]
}

}
String splitString(String url)
{    List  url1 = url.tokenize("?") as List
      url= url1.get(1)
     
 }
static  main(ARGS){
String url ="http://www.google.com?name=johny&age=20&hobby=cricket"
String key1="hobby"
String text= fetchValueFromKey(splitString(url),key1)
println "$key1  = $text"

}


