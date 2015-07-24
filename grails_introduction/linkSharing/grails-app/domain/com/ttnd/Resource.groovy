package com.ttnd

import javax.xml.soap.Text

class Resource {
    String title
    String description
    Date dateCreated
    Date lastUpdated
    Topic topic
    User createdBy


static  mapping = {

    description column: 'summary'
    description type: "text"
}


    //static  belongsTo = [topic:Topic]
    static constraints = {
        title(unique: ['topic'])
        description size:1..1024
    }
}
