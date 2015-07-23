package com.ttnd

class DocumentResource {
    String filePath
    String file
    String fileContentType
    static  transients=['file','fileContentType']
    static constraints = {
        file blank: false ,nullable: false
        fileContentType blank: false,nullable: false
    }
}

