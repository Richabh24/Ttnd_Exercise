package co

import grails.validation.Validateable
import com.ttnd.Topic
import org.springframework.web.multipart.MultipartFile

@Validateable
class ResourceCO {
    String title
    String description
    Topic topic
    MultipartFile file
    String filePath
    String fileType

    static constraints ={
        fileType nullable: true
        filePath nullable: true
    }
}
