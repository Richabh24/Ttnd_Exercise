package com.ttnd


class Topic {
    String name
    User createdBy
    Date createdDate
    Date lastUpdated
    ConstantEnum.Visibility visibility
    static  hasMany = [resourceavailable:Resource]
    static constraints = {
       // name(unique: ['createdBy'])
    }
}
