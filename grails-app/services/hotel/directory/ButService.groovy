package hotel.directory

import grails.gorm.services.Service

@Service(But)
interface ButService {

    But get(Serializable id)

    List<But> list(Map args)

    Long count()

    void delete(Serializable id)

    But save(But but)

}