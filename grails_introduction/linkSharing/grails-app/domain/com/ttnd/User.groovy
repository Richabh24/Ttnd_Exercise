package com.ttnd

class User {
    String email
    String userName
    String password
    String confirmPassword
    String firstName
    String lastName
    Byte photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated

    static  transients =['confirmPassword']
static  hasMany = [subscibedTopic:Topic, createdTopics :Topic]
    static  constraints = {

        email email: true, blank: false,nullable: false,unique: true
        photo blank:true,nullable: true

    }
}
