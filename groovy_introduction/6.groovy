class HourMinute {

int hour
int minute

       

  HourMinute plus(HourMinute hm) {
        new HourMinute(hour: hour+hm.hour, minute: minute +hm.minute)
    }
 
 
 String toString(){
 return "hour : $hour , minute :$minute "
 
 }
}

static main(ARGS){
 
HourMinute hm =new HourMinute(hour:7,minute:10)

HourMinute hm1 =new HourMinute(hour:40,minute:10)
    
   HourMinute hhh =hm +hm1 
    
    
    println (hhh)
    
    
    }