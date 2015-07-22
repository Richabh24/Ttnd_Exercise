(1..100).each{
 println value =(it%3==0&& it%5!=0)?"Fizz": ((it%5==0&& it%3!=0)?"Buzz":((it%5==0&& it%3==0)?"FizzBuzz":it))
 }
