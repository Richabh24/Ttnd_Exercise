package com.ttnd

class LinkResource extends Resource {
    String url
    static mapping = {
        tablePerHierarchy false
    }
    static constraints = {
        url  url: true ,blank: true,nullable: true
    }
}
