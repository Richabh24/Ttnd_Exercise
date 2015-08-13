package com.ttnd

import co.TopicCO
import grails.transaction.Transactional
import org.springframework.web.context.request.RequestContextHolder

@Transactional
class TopicService {
    def userService

    def serviceMethod() {

    }

    def createTopic(TopicCO topic) {


        Topic top = new Topic()

        //        top.properties = topic.properties
        top.name = topic.name
        top.createdBy = User.get(topic.createdById)
        if (topic.visibility.toString().equals(Topic.VisibilityEnum.PUBLIC.toString()))
            top.visibility = Topic.VisibilityEnum.PUBLIC
        else
            top.visibility = Topic.VisibilityEnum.PRIVATE

        if (topic.seriousness.toString().equals(Subscription.SeriousnessValue.SERIOUS.toString()))
            top.seriousness = Subscription.SeriousnessValue.SERIOUS
        else if (topic.seriousness.toString().equals(Subscription.SeriousnessValue.VERY_SERIOUS.toString()))
            top.seriousness = Subscription.SeriousnessValue.VERY_SERIOUS
        else
            top.seriousness = Subscription.SeriousnessValue.CASUAL
        top.validate()
        top.save(flush: true)
        return top


    }

    Map show(Topic topic, User user, Map params) {
        if (!params.offset)
            params.offset = 0
        if (!params.max)
            params.max = 5
        List<User> users = users(topic)
        List<Topic> subscriptions = []
        if (user)
            subscriptions = userService.subscriptions(user)
        // List<Resource> resources = resources(topic)
        List<Topic> topiclist = new ArrayList<Topic>();
        topiclist.add(topic)
        Integer resourceCount = 0
        resourceCount = Resource.findAllByTopicInList(topiclist).size()
        List<Resource> resources = resourcesList(topiclist, params)

        [topic: topic, users: users, resources: resources, resourceCount: resourceCount, subscriptions: subscriptions]
    }


    List<User> users(Topic topic) {
        List<Subscription> list = Subscription.createCriteria().list {
            projections {
                groupProperty('user')
                eq('topic', topic)
                count('id', 'count')
                maxResults 5
                order('count', 'desc')
            }


        }


        List<User> users = []
        list?.each {
            User u = (it[0] as User)
            u.setSubcribetotalCount(it[1])
            users.add(u)
        }

        println "users List " + users
        return users
    }

    List<Resource> resources(Topic topic) {
        println "Topic::::::" + topic.properties
        List<Resource> resourceList = []
        if (topic.resources == null || topic.resources != [])
            resourceList = topic.resources as List
        return resourceList
    }

    List<Resource> resourcesByPage(Topic topic) {
        println "Topic::::::" + topic.properties
        List<Resource> resourceList = []
        if (topic.resources == null || topic.resources != [])
            resourceList = topic.resources as List
        return resourceList
    }


    def unsubscribe(String topic, String user) {
        Topic t = Topic.load(topic)
        User u = User.load(user)
        Subscription subscription = Subscription.findByTopicAndUser(t, u)
        List<Resource> resources = Resource.findAllByTopic(t)
        resources.each { Resource r ->
            ReadResources.findByUserAndResource(u, r).delete(flush: true)
        }
        subscription.delete(flush: true)

    }


    def subscribe(Map params, User user) {
        Topic t = Topic.load(params.topic)
        Subscription.SeriousnessValue seriousnessValue = Subscription.SeriousnessValue.CASUAL

        Subscription subscription = new Subscription(user: user, topic: t, seriousness: seriousnessValue)
        subscription.save(flush: true)
        t.resources.each {
            ReadResources readResources = new ReadResources(resource: it, user: user, readFlg: false)
            readResources.save(flush: true)
            it.addToReadResources(readResources)
            it.merge()
            println "new Read resource" + readResources.properties
        }

    }

    def updateTopicsList(List<Topic> topicList) {
        def session = RequestContextHolder.currentRequestAttributes().getSession()
        User user = session.user
        topicList.each {
            Subscription s = Subscription.findByTopicAndUser(it, user)
            if (s)
                it.isSubscribed = true
            else
                it.isSubscribed = false

        }
        return topicList
    }

    Map trendingTopicList(User user, Map params) {
        if (!params.offset)
            params.offset = 0
        if (!params.max)
            params.max = 5
        List<Topic> topics = []

        List<Topic> trendings = []
        List<Resource> resources = []
        trendings = getAlltrendings(params)
        println trendings
        Integer topicCount = 0


        if (trendings != []) {
            topicCount = Resource.findAllByTopicInList(trendings).size()

            if (trendings != [])
                resources = resourcesList(trendings, params)
        }

        Integer subscriptionCount = Subscription.findAllByUser(user).size()
        println "topicCount---------------" + topicCount
        [user: user, subscriptions: topics, trendings: trendings, inbox: resources, trendingtopicCount: trendingtopicCount, topicCount: topicCount, subscriptionCount: subscriptionCount]
    }

    Map subsciptionList(User user, Map params) {
        if (!params.offset)
            params.offset = 0
        if (!params.max)
            params.max = 5
        List<Topic> topics = []
        topics = subscriptions(user, params)
        topics = updateTopicsList(topics)

        List<Topic> trendings = []
        List<Resource> resources = []
        //  trendings =getAlltrendings(params)
        println trendings
        Integer topicCount = 0
        Integer resourceCount = 0


        if (topics != []) {
            topicCount = Topic.findAllByCreatedBy(user).size();
            resourceCount = Resource.findAllByTopicInList(topics).size()

            if (topics != [])
                resources = resourcesList(topics, params)
        }

        Integer subscriptionCount = Subscription.findAllByUser(user).size()
        println "topicCount---------------" + topicCount
        [user: user, subscriptions: topics, trendings: trendings, inbox: resources, topicCount: topicCount, resourceCount: resourceCount, subscriptionCount: subscriptionCount]
    }

    List<Topic> getAlltrendings(Map params) {

        List list = Resource.createCriteria().list {
            projections {
                groupProperty('topic')
                'topic' {
                    eq('visibility', Topic.VisibilityEnum.PUBLIC)
                }
                count('id', 'count')
                maxResults params.max
                order('count', 'desc')
            }

        }

        List<Topic> topicList = []
        list?.each {
            topicList.add(it[0])
        }
        topicList = updateTopicsList(topicList)
        return topicList

    }


    List<Topic> subscriptions(User user, Map params) {
        List<Subscription> subscriptions = Subscription.createCriteria().list(params) {
            eq('user', user)
            order('dateCreated', 'desc')
        }
        println "subscriptions:::::" + subscriptions.topic

        List<Topic> topicList = []
        subscriptions?.each { Subscription s ->
            Topic t = s.topic
            t.seriousness = s.seriousness
            topicList.add(t)
        }
        return topicList

    }

    List<Resource> resourcesList(List<Topic> topics, Map params) {
        List<Resource> resources = Resource.createCriteria().list(params) {
            inList('topic', topics)

        }
        println "resources:::::" + resources.size()
        return resources
    }

    def deleteTopic(Map params) {
        Topic t = Topic.load(params.id)
        t.delete(flush: true)
    }


    def editTopic(Map params, User user) {
        Topic t = Topic.load(params.id)
        t.name = params.name
        t.visibility = params.visibility
        t.validate()
        if (!t.hasErrors())
            t.merge()

        Subscription s = Subscription.findByTopicAndUser(t, user)
        if (s) {
            s.seriousness = params.seriousness
            s.validate()
            if (!s.hasErrors())
                s.merge()
        }
    }


    def showPost(Map params) {
        Resource resource = Resource.load(params.resId)
        Integer sumRating = 0
        if (resource.resourceRatings) {
            sumRating = resource.resourceRatings.score.sum() / resource.resourceRatings.size()
            println "sumRating" + sumRating
        }
        [inbox: resource as List, trendings: userService.gettrendings(), topicCount: sumRating]
    }
}
