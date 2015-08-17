package dto

import com.ttnd.Resource


class HomePageDTO {
    List<Resource> recentResources
    List<Resource> topResources

    HomePageDTO(Map homeMap){
        this.recentResources=homeMap.recentResources
        this.topResources=homeMap.topResources
    }
}
