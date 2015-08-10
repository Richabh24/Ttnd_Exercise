package com.ttnd

class Topic {
    String name
    Date dateCreated
    Date lastUpdated
    User createdBy
    enum VisibilityEnum {PUBLIC,PRIVATE}
    VisibilityEnum visibility
    boolean  isSubscribed
    Subscription.SeriousnessValue seriousness
    static hasMany = [resources:Resource,subscriptions:Subscription]
    static belongsTo =[createdBy:User]
    static transients = ['seriousness','isSubscribed']
    static constraints = {
        name size:5..15,blank:false,unique: 'createdBy'
    }

    def afterInsert = {
        if(this.seriousness.toString()!=null&&!this.seriousness.toString().equals("null")){
            Subscription subscription = new Subscription(user:this.createdBy,topic: this,seriousness: this.seriousness)
            addToSubscriptions(subscription)

        }else{
            Subscription subscription = new Subscription(user:this.createdBy,topic: this,seriousness: Subscription.SeriousnessValue.SERIOUS)
            addToSubscriptions(subscription)

        }
    }

}

