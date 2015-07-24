package com.ttnd

class Subscription {
    Topic topic
    User user
    Date dateCreated
    ConstantEnum.Seriousness seriousness
    static constraints = {
        topic(unique: ['user'])

    }
}
