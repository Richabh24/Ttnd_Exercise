package com.ttnd

class Subscription {
    Topic topic
    User user
    Date createdDate
    ConstantEnum.Seriousness seriousness
    static constraints = {
        topic(unique: ['user'])

    }
}
