package com.ttnd

import grails.transaction.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }

    def saveUser(User user,boolean updateFlg) {

        user.validate()
        if (!user.hasErrors()) {
            if(updateFlg) {
        user.merge()
            }
            else
                user.save(flush:true)
        }
        else{
            println user.errors
        }
    }



    Map dashboard(User user){
        User user1=user
        List<Topic> subscriptions = subscriptions(user)
        List<Topic> trendingtopic =trendings()
        List<Resource> inbox= inbox(user)
        println "inboxsize====================="

        println inbox.size()
        List topics = Topic.findAllByCreatedBy(user)
        Integer topicCount = 0
        if(topics && topics!=[])
            topicCount = topics.size()
        Integer subscriptionCount = Subscription.findByUser(user)?.count()
        [user:user1,subscriptions:subscriptions,trendings:trendingtopic,inbox:inbox,topicCount:topicCount,subscriptionCount:subscriptionCount]
    }


    List<Topic> subscriptions(User user){
        List<Subscription> subscriptions = Subscription.createCriteria().list([max:5]){
            eq('user',user)
            order('dateCreated','desc')
        }

        List<Topic> topicList =[]
        subscriptions?.each {Subscription s->
            Topic t = s.topic
            t.seriousness = s.seriousness
            topicList.add(t)
        }
        return topicList
    }

    List<Topic> trendings(){

            List list = Resource.createCriteria().list {
                projections {
                    groupProperty('topic')
                    'topic' {
                        eq('visibility', Topic.VisibilityEnum.PUBLIC)
                    }
                    count('id', 'count')
                    maxResults 5
                    order('count', 'desc')
                }

            }

            List<Topic> topicList = []
            list?.each {
                topicList.add(it[0])
            }

            return topicList

    }


    List<Resource> inbox(User user){
        List<ReadResources> readResources = ReadResources.createCriteria().list(max:5){
                        eq('user',user)
            eq('readFlg',Boolean.FALSE)
        }
        return readResources.resource
    }
}
