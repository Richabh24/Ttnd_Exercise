package com.ttnd

import javax.xml.soap.Text

class Resource {
    String title
    Text description
    Date createdDate
    Date lastUpdated
    Topic topic
    User createdBy


static  mapping = {

description column: 'summary'
}


    static  belongsTo = [topics:Topic]
    static constraints = {
        title(unique: ['topic'])

        description size:1..1024
    }
}
