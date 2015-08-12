import com.ttnd.DocumentResource
import com.ttnd.LinkResource
import com.ttnd.ResourceRating
import com.ttnd.Topic
import com.ttnd.User

class BootStrap {

    def init = { servletContext ->
        createUsers()

    }
    void  createUsers(){

        List<User> users = new ArrayList<User>();
        User user1 =new User(email: 'rbhadani24@gmail.com',firstName: 'richa',lastName: 'bhadani',password: 'r243611',username: 'richa',admin: true,photo:new FileInputStream(new File("/home/ttnd/Desktop/images/pic1.jpeg")).getBytes())
        User  user2 =new User(email: 'test@gmail.com',firstName: 'chitra',lastName: 'gupta',password: 'r242611',username: 'chitra',admin: false,photo:new FileInputStream(new File("/home/ttnd/Desktop/images/pic2.jpeg")).getBytes())

        users.add(user1)
        users.add(user2)


        users.each {u ->
            u.save(failOnError: true)
            createTopics(u)
            u.save(failOnError: true)
        }





    }
   void createTopics(User u){

       5.times { i->
           // println(i)
           Topic t =    new Topic(createdBy: u, name: "Power Test:  ${i}", visibility: Topic.VisibilityEnum.PUBLIC)
           t.save(failOnError: true)
           createResources(t,u) ;
           u.addToTopics(t)
          // createReadingItems(u)

       }


   }
    void createResources(Topic t,User u){


        5.times{j->
            LinkResource lr = new LinkResource(title: "titleResource${j}",url:"http://www.google.com",topic: t,description: " THe greatest power is your capacity to choose."
                    ,createdBy: u)
            lr.title="titleResource${j}"
            lr.save(failOnError: true)
            createRatings(u,lr,null);
            t.addToResources(lr)

        }
        5.times{j->
            DocumentResource dr = new DocumentResource(title: "titleDocumentResource${j}",filePath: "/home/ttnd/Desktop/images/pic1.jpeg",fileType: "pic1.jpeg", topic: t,description: "DocResource${j}"
                    ,createdBy: u)
            dr.title="titleDocResource${j}"

            dr.save(failOnError: true)
            createRatings(u,null,dr);

            t.addToResources(dr)

        }


    }
    void createRatings(User u,LinkResource lr,DocumentResource dr){
        if(lr!=null) {
            ResourceRating resourceRating1 = new ResourceRating(user: u, resource: lr, score: 2)
            resourceRating1.save(flush: true, failOnError: true)
            lr.addToResourceRatings(resourceRating1)
            lr.merge(flush: true)
        }
        if(dr!=null) {

            ResourceRating resourceRating = new ResourceRating(user: u, resource: dr, score: 3)
            resourceRating.save(flush: true, failOnError: true)
            dr.addToResourceRatings(resourceRating)
            dr.merge(flush: true)
        }

    }
    /*

     void createReadingItems(User user1)
    {
        Random rand = new Random()
        int max = 10
        (1..3).each {
            long num =rand.nextInt(max+1)
            if (num==0) { num =1}
            Resource resource = Resource.findById(num)
            ReadResources r =new ReadResources(user:user1,resource: resource,isRead: true)
            r.validate()
            r.save(flush: true, failOnError: true)
        }

    }



    void subscribeTopic(Topic topic,User user){
        Subscription subsctopic = new Subscription(user:user,topic:topic,seriousness: ConstantEnum.Seriousness.SERIOUS)
        subsctopic.validate()
        subsctopic.save(flush: true, failOnError: true)

    }*/


    def destroy = {
    }
}
