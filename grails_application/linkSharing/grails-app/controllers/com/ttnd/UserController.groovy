package com.ttnd
import dto.UserDashboardDTO

//@Transactional(readOnly = true)
class UserController {
    def userService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }


    def displayLogo() {
        def user = User.get(params.id)
        response.contentType = "image/png"
        response.contentLength = user?.photo.length
        response.outputStream.write(user?.photo)
        response.outputStream.flush()
    }

    def dashboard() {
        User user = session.user
        if (user) {
        UserDashboardDTO dashboardDTO = userService.dashboard(user)
        render view: 'userDashBoard', model: [data: dashboardDTO]
    }
    else{
        redirect controller: 'login', action: 'index'
    }
    }

    def dashboardResource() {
        User user = session.user
        if (user) {



            render view: 'dashboard1', model: [data: userService.inbox(user)]
        }
        else{
            redirect controller: 'login', action: 'index'
        }
    }
    def publicProfile() {
        User user = User.findById(params.userId)
        if (user) {

            UserDashboardDTO dashboardDTO = userService.dashboard(user)
            render view: 'publicProfile', model: [data: dashboardDTO]
        }

    }
    def profile(){
        User user = session.user
        if (user) {

            UserDashboardDTO dashboardDTO = userService.dashboard(user)

            render view: 'profile', model: [data: dashboardDTO]
        }
        else{
            redirect controller: 'login', action: 'index'
        }
    }







}
