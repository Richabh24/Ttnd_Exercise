package com.ttnd

import co.PasswordCO
import co.ProfileCO
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

    def updateProfile(ProfileCO profileCO){
        println params
        if (!profileCO.hasErrors()) {
            User user = session.user as User
            user.properties =profileCO.properties
            userService.saveUser(user,true)
            session.user =user
            redirect(controller:'user',action:'profile')
        } else {
            UserDashboardDTO dashboardDTO = userService.dashboard(session.user)
            render (view: 'profile',model: [profileCO:profileCO,data:dashboardDTO])
        }
    }


    def updatePassword(PasswordCO passwordCO){
        if (!passwordCO.hasErrors()) {
            User user = session.user
            user.properties =passwordCO.properties
            userService.saveUser(user,true)
            session.user =user
            redirect(controller:'user',action:'profile')
        } else {
            UserDashboardDTO dashboardDTO = userService.dashboard(session.user)
            render (view: 'profile',model: [passwordCO:passwordCO,data:dashboardDTO])
        }
    }






}
