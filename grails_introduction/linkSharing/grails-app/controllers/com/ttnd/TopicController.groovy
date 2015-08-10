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
    def asynchronousMailService
    def resourceService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model: [topicInstanceCount: Topic.count()]
    }

    def createTopic(TopicCO topicCO) {
        println "---------" + topicCO.properties
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
        println "topic params" + params
        println "topic:::" + topic.properties
        if (topic) {
            TopicDTO topicDTO = topicService.show(topic,session.user)
            println 'topicDTO:::'+topicDTO.properties
            render view: 'showTopic', model: [data: topicDTO]
        }
    }

    def unsubscribe() {
        topicService.unsubscribe(params.topic, params.user)
        flash.message = "You have unsubscribed Successfully !!! "
        redirect controller: 'user', action: 'dashboard'
    }

    def subscriptionList() {
        User user = session.user
        println "subscriptionList user ::::" + params
        UserDashboardDTO dashboardDTO = topicService.subsciptionList(user, params)
        println "dashboardDTO::::" + dashboardDTO.properties
        [data: dashboardDTO]
    }





    def deleteTopic() {
        topicService.deleteTopic(params)
        flash.message = "Topic successfully deleted! "
        redirect controller: 'user', action: 'dashboard'
    }


    def subscribe(){
        println params
        topicService.subscribe(params,session.user)

        flash.message = "You have subscribed Successfully !!! "
        redirect controller: 'user', action: 'dashboard'
    }


    def sendMail() {
        println "sendmail...."
        asynchronousMailService.sendMail {
            to "rbhadani24@gmail.com"
            subject "Test"
            body "Mail body111111111"
        }
    }

    def createLinkResource(LinkResource resource){
        resource.createdBy=session.user
        println "resource added: "+resource.properties
        resourceService.saveLinkResource(resource)
        redirect controller: 'user', action: 'dashboard'
    }


    def createDocResource(ResourceCO resourceCO) {
        println("resourceCO::::::::" + resourceCO.properties)
        println resourceCO.file.originalFilename
        if (!resourceCO.hasErrors()) {
        }
        if (resourceCO.file) {


            println resourceCO.filePath
            resourceCO.filePath = System.getProperty('user.home') + File.separator + 'Uploads' + File.separator + resourceCO.file.originalFilename
            resourceCO.file.transferTo(new File(resourceCO.filePath))


            resourceCO.fileType = resourceCO.file.originalFilename
            resourceService.saveDocResource(resourceCO,session.user)
        }
        else {
            flash.message = "error "+resourceCO.errors
        }
        //   params.id=resourceCO.topic
        println "prms:::"+params
        redirect controller: 'topic', action: 'show',params: [id:resourceCO.topic.id]
    }
    def markAsRead(){
        println params
        resourceService.markRead(params)
        flash.message = "Marked As Read Successfully !!! "
        redirect controller: 'user', action: 'dashboard'

    }



    def updateTopic(TopicCO topicCO) {
        println "updateTopic:::::::" + topicCO.properties
        if(topicCO.hasErrors()){
            flash.message = topicCO.errors
            render(action: 'dashboard', model: [topicCO: topicCO], view: 'dashboard1')
        }
        else{
            topicService.editTopic(params, session.user)
            flash.message = "Topic successfully updated !!! "
            redirect controller: 'user', action: 'dashboard'
        }
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
            render file:contentStream,contentType: resource.fileType
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
            return  resource.url
        }
        finally {
        }
    }




    def showPost(){
        UserDashboardDTO dashboardDTO = topicService.showPost(params)
        println "dashboardDTO::::" + dashboardDTO.properties
        [data: dashboardDTO]
    }

}
