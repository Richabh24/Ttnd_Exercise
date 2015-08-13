package com.ttnd

import co.ResourceCO
import co.TopicCO
import dto.UserDashboardDTO
import dto.TopicDTO
import grails.transaction.Transactional
import org.apache.commons.io.IOUtils

@Transactional
class TopicController {
    def topicService
    def resourceService
    def mailService
    def groovyPageRenderer
    def grailsLinkGenerator
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model: [topicInstanceCount: Topic.count()]
    }

    def createTopic(TopicCO topicCO) {
        if (!topicCO.hasErrors()) {
            def topicobj = topicService.createTopic(topicCO)
            redirect(controller: 'user', action: 'dashboard', model: [Topic: topicobj], view: 'userDashBoard')
        } else {
            println topicCO.errors
            render(action: 'dashboard', model: [topicCO: topicCO], view: 'userDashBoard')
        }
    }

    def show() {
        Topic topic = Topic.load(params.id)
        println "topic:::" + topic.properties
        if (topic) {
            TopicDTO topicDTO = topicService.show(topic, session.user,params)
            println 'topicDTO:::' + topicDTO.properties

            render view: 'showTopic', model: [data: topicDTO]
        }
    }

    def unsubscribe() {
        topicService.unsubscribe(params.topic, params.user)
        flash.message = "unsubscribed Successfully !!! "
        redirect controller: 'user', action: 'dashboard'
    }

    def fetchsubscriptionList() {
        User user = session.user
        UserDashboardDTO dashboardDTO = topicService.subsciptionList(user, params)
        [data: dashboardDTO]
    }
    // not in use   -   richa
    def trendingTopicList() {
        User user = session.user
        UserDashboardDTO dashboardDTO = topicService.trendingTopicList(user, params)
        [data: dashboardDTO]
        render view: "fetchsubscriptionList"
    }

    def deleteTopic() {
        topicService.deleteTopic(params)
        flash.message = "Topic successfully deleted! "
        redirect controller: 'user', action: 'dashboard'
    }


    def subscribe() {
        println params
        topicService.subscribe(params, session.user)

        flash.message = "subscribed Successfully !!! "
        redirect controller: 'user', action: 'dashboard'
    }


    def subscribeForAnyUser() {
        println params
        session.user=  User.findById(params.user)
        topicService.subscribe(params, session.user)

        flash.message = "subscribed Successfully !!! "
        redirect controller: 'user', action: 'dashboard'
    }



    def sendMail() {
        String link = grailsLinkGenerator.serverBaseURL
        String acceptlink=link
        mailService.sendMail {
            println "sendmail...."

            to params.receiverEmail
            subject "Junk mail.. delete it"
         User   user = User.findByEmail(params.receiverEmail)

            if(user){
                acceptlink =link
                link = link+"/topic/show/"+params.topic

            }else{
                link =link+"/login"

            }
                def content = groovyPageRenderer.render(view: '/layouts/email',model: [link:link,acceptlink:acceptlink,topic:params.topic,user:user])
                html(content)

            }

        redirect controller: 'user', action: 'dashboard'

    }

    def createLinkResource(LinkResource resource) {
        resource.createdBy = session.user
        println "link resource added------> " + resource.properties
        resourceService.saveLinkResource(resource)
        redirect controller: 'user', action: 'dashboard'
    }


    def createDocResource(ResourceCO resourceCO) {
        println("resourceCO" + resourceCO.properties)
        println resourceCO.file.originalFilename
        if (!resourceCO.hasErrors()) {
        }
        if (resourceCO.file) {


            File f = new File(System.getProperty('user.home') + File.separator + "Uploads")
            if (!f.exists()) {
                f.mkdir();

            }
            resourceCO.filePath = System.getProperty('user.home') + File.separator + 'Uploads' + File.separator + resourceCO.file.originalFilename
            resourceCO.file.transferTo(new File(resourceCO.filePath))


            resourceCO.fileType = resourceCO.file.originalFilename
            resourceService.saveDocResource(resourceCO, session.user)
        } else {
            flash.message = "error " + resourceCO.errors
        }
        redirect controller: 'user', action: 'dashboard'
    }

    def markAsRead() {
        println params
        resourceService.markRead(params)
        flash.message = "Marked As Read Successfully !!! "
        redirect controller: 'user', action: 'dashboard'

    }


    def updateTopic(TopicCO topicCO) {
      println  topicCO.properties
        if (topicCO.hasErrors()) {
            flash.message = topicCO.errors
            render(action: 'dashboard', model: [topicCO: topicCO], view: 'userDashBoard')
        } else {
            topicService.editTopic(params, session.user)
            flash.message = "Topic successfully updated ! "
            redirect controller: 'user', action: 'dashboard'
        }
    }
    def updateTopicProperty(params) {

            topicService.editTopic(params, session.user)
            render "<h2><b><p>Topic successfully updated!</p></b></h2>"

    }
    def downloadFile() {
        InputStream contentStream
        try {
            DocumentResource resource = DocumentResource.findById(params.resId)
            File file = new File(resource.filePath)
            response.setHeader "Content-disposition", "attachment; filename=${resource.fileType}"
            response.setHeader("Content-Length", "file-size")
            response.setContentType("file-mime-type")
            contentStream = file.newInputStream()
            render file: contentStream, contentType: resource.fileType
            //  response.outputStream << contentStream
            webRequest.renderView = true
        }
        finally {
            IOUtils.closeQuietly(contentStream)
        }
    }

    def viewFullSite() {
        try {
            LinkResource resource = LinkResource.findById(params.resId)
            println resource.url
            return resource.url
        }
        finally {
        }
    }


    def showPost() {
        UserDashboardDTO dashboardDTO = topicService.showPost(params)
        [data: dashboardDTO]
    }

}
