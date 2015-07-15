class HourMinute{
int hours;
int minute;
HourMinute(){}
HourMinute(int hours,int minute){
this.hours =hours;
this.minute =minute;
}

}

static  main(ARGS){
     
  HourMinute js = new HourMinute(10,5);
  HourMinute j1 = new HourMinute(5,5);
  HourMinute j2 =js+j1
  println j2.hours;

     }


