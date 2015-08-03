package dto

import  com.ttnd.Resource
import  com.ttnd.Topic
import com.ttnd.User

class UserDashboardDTO {
    User user
    List<Topic> subscriptions
    List<Topic> trendings
    List<Resource> inbox
    Integer subscriptionCount = 0
    Integer topicCount = 0

    UserDashboardDTO(Map dashboardMap){
        this.user=dashboardMap.user
        this.inbox=dashboardMap.inbox
        this.trendings=dashboardMap.trendings
        this.subscriptions=dashboardMap.subscriptions
        this.subscriptionCount=dashboardMap.subscriptionCount
        this.topicCount=dashboardMap.topicCount
    }
}
