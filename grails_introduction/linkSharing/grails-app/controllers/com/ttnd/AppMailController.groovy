package com.ttnd

class AppMailController {
def asynchronousMailService
    def index() {

        println "index.."
    }

    def sendMail()
    {

        println "sendmail...."
        asynchronousMailService.sendMail{
            // Mail parameters
            to "rbhadani24@gmail.com"
            subject "Test"
            body "Mail body111111111"

        }


    }
}
