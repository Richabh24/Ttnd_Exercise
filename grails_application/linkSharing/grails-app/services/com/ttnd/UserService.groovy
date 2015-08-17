package com.ttnd

import grails.transaction.Transactional
import org.springframework.web.context.request.RequestContextHolder

@Transactional
class UserService {



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
        List<Topic> trendingtopic =gettrendings()
        List<Resource> inbox= inbox(user)
        println inbox.size()
        List topics = Topic.findAllByCreatedBy(user)
        Integer topicCount = 0
        if(topics && topics!=[])
            topicCount = topics.size()

        //Integer subscriptionCount = Subscription.findByUser(user).count()
        Integer subscriptionCount = Subscription.createCriteria().count(){

            eq("user",user)
        }


        println subscriptionCount
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

    List<Topic> gettrendings(){

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
        topicList=updateTopicsList(topicList)
            return topicList

    }

    def updateTopicsList(List<Topic> topicList)
    {
        def session = RequestContextHolder.currentRequestAttributes().getSession()
        User user  = session.user
        topicList.each {
          Subscription s  =  Subscription.findByTopicAndUser(it,user)
            if (s)
            it.isSubscribed =true
            else
                it.isSubscribed=false

        }
        return  topicList
    }


    List<Resource> inbox(User user){
        List<ReadResources> readResources = ReadResources.createCriteria().list(max:5){
                        eq('user',user)
            eq('readFlg',Boolean.FALSE)
        }
        return readResources.resource
    }




}
