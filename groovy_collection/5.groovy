list = [4,5,60,7,55,99,100]
Iterator itr = list.iterator()
for (i =0;itr.hasNext();i++){
    def apple = itr.next() 
   i%2!=0?itr.remove():"" 
}
print list