package com.ttnd

class Resource {
    String description
    Date createdDate
    Date lastUpdated
   // Topic topic
    User createdBy

static  mapping = {

description column: 'summary'
}


    static  belongsTo = [topics:Topic]
    static constraints = {
        description size:1..1024
    }
}
