package com.ttnd

class Invitation {

    User sender
    String receiverEmail
    String token
    Date dateCreated
    Topic topic
    static  transients =['topic']
    static belongsTo = [sender:User]
    static constraints = {
        receiverEmail email: true,blank:false
        token blank: false

    }
}
