import groovy.io.FileType
class FileExample {
   static void main(String[] args) {        
      def list = []
      String filepath='/home/ttnd/Desktop/file'
def dir = new File("/home/ttnd/Desktop/file")
dir.eachFileRecurse (FileType.FILES) { file ->
  list.add(file)
}
def file = new File(filepath,'/newfile.txt')
if( !file.exists() ) {
    file.createNewFile()    
} 
  file.withWriterAppend { w ->
list.each { f ->

    new File('', f ).withReader { r ->


     w << r << '\n'
   }
  }
  println "file created succesfully:-)"
}
     
     
   }
}