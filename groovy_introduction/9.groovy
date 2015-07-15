

class FileExample1 {
   static void main(String[] args) {
   (1..3).each{
   def file = new File("file$it")  
file << "Sample content for ${file.absolutePath}"}
def f1 =new File("/home/ttnd/Desktop/f1.txt");
      new File("/home/ttnd/Desktop/file").eachFile() { file->
         f1<< new File(file.getAbsolutePath())
         println f1
      }
   }
}