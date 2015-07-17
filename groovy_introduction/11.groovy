import groovy.io.FileType
class FileExample {
   static void main(String[] args) {        
String filepath='/home/ttnd/Desktop/file'
PrintWriter writer = null
 String newLine=""
File f = new File(filepath,'test/newfile.txt')
File f1= new File(filepath,'test/testile.txt')
if (f.length() > 0){

   f.eachLine { line ,number->   
    newLine+= line.replaceAll("\\s","") }
println newLine
   
   writer = new PrintWriter(f1)
   writer.println(newLine.replaceAll("\\s","")) 
   writer.close()
}
else{
   println "File is empty!"
}}}