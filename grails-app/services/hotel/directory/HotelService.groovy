package hotel.directory

import grails.gorm.services.Service

@Service(Task)
interface HotelService {

    Task get(Serializable id)

    List<Task> list(Map args)

    Long count()

    void delete(Serializable id)

    Task save(Task hotel)

}
