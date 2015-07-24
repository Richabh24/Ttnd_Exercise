package com.ttnd

class DocumentResource extends Resource{
    String filePath
    String file
    String fileContentType
    static  transients=['file','fileContentType']
    static mapping = {
        tablePerHierarchy false
    }
    static constraints = {
        file blank: true ,nullable: true
        fileContentType blank: true,nullable: true
        filePath blank: true,nullable: true
    }
}

