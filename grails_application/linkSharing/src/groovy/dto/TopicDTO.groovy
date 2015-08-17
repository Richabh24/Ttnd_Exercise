package dto

import com.ttnd.Resource
import com.ttnd.Topic
import com.ttnd.User

class TopicDTO {
    Topic topic
    List<User> users
    Integer resourceCount = 0
    List<Resource> resources
    List<Topic> subscriptions
    Integer subscriptionCount = 0

    TopicDTO(Map topicDTOMap){
        this.users=topicDTOMap.users
        this.topic=topicDTOMap.topic
        this.resources=topicDTOMap.resources
        this.subscriptions =topicDTOMap.subscriptions
        this.resourceCount=topicDTOMap.resourceCount
        this.subscriptionCount=topicDTOMap.subscriptionCount

    }
}


