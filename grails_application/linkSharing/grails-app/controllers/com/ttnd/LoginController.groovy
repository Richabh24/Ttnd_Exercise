package com.ttnd

import co.UserRegisterCO
import dto.HomePageDTO

class LoginController {
    def  userService
    def  homeService
    def index() {
        HomePageDTO homeDTO = homeService.home()
        println homeDTO.properties
        render view:'index', model:  [data:homeDTO]
    }
def login(){
        def tempuser= User.findByEmailAndPassword(params.email, params.password)
        if(!tempuser)
            tempuser= User.findByUsernameAndPassword(params.email, params.password)
        if (tempuser) {
            session.user = tempuser
            println session.user
                      redirect(controller:'user',action:'dashboard')
        } else {
            flash.message = "User not found"
            redirect(controller:'login',action: 'index')
        }
}

    def register(UserRegisterCO registerCO) {

        println registerCO.properties

        if (!registerCO.hasErrors()) {
            User user =new User()
            user.properties = registerCO.properties
            if(user.photo==[]){
                File f = grailsAttributes.getApplicationContext()
                        .getResource("/images/human.png").getFile()
                user.photo = new FileInputStream(f).getBytes()
            }
            userService.saveUser(user,false)
            session.user =user
            redirect(controller:'user',action:'dashboard')
        } else {

            println "in errors"
            HomePageDTO homeDTO = homeService.home()
            render (model: [registerCO:registerCO,data:homeDTO] ,view: 'index')
        }
    }

    def logout(){
        session.user=null
        redirect(controller:'login',action: 'index')
    }
 
}
