package dto

import com.ttnd.Resource
import com.ttnd.Topic

class TopicDTO {
    Topic topic
    List<User> users
    List<Resource> resources
    List<Topic> subscriptions
    TopicDTO(Map topicDTOMap){
        this.users=topicDTOMap.users
        this.topic=topicDTOMap.topic
        this.resources=topicDTOMap.resources
        this.subscriptions =topicDTOMap.subscriptions
    }
}


import com.ttnd.User
