import groovy.io.FileType
class FileExample {
   static void main(String[] args) {        
      def list = []
String filepath='/home/ttnd/Desktop/file'
ArrayList pids = null
PrintWriter writer = null
File f = new File(filepath,'test/newfile.txt')
File f1= new File(filepath,'test/testile.txt')
if (f.length() > 0){
   pids = new ArrayList()

   f.eachLine { line ,number-> if (number%2!=0 ||number==1){
   
    pids.add(line) }}

   writer = new PrintWriter(f1)
   pids.each { id -> 
   println id
   writer.println(id) 
   }

   writer.close()
}
else{
   println "File is empty!"
}}}