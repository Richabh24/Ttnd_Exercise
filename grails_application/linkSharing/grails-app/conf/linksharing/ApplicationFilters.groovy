package linksharing

class ApplicationFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
           /*log.info("ip address =,${request.getRemoteHost()} params:${params}"
                )
*/
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
