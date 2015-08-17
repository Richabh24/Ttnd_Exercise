package co

import grails.validation.Validateable
import com.ttnd.User


@Validateable
class ProfileCO {
    String firstName
    String lastName
    String username
    byte[] photo
    static constraints = {
        username size: 5..15, blank: false, validator: { val, obj ->
            if (User.findByUsername(val)) {
                return false
            } else
                return true
        }
        lastName nullable:true
        photo nullable:true,maxSize: 10*1024*1024
    }

}
