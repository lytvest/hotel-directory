package hotel.directory

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class TaskServiceSpec extends Specification {

    HotelService hotelService
    SessionFactory sessionFactory

    private Long setupData() {

    }

    void "test get"() {
        setupData()

        expect:
        hotelService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Task> hotelList = hotelService.list(max: 2, offset: 2)

        then:
        hotelList.size() == 2
    }


}
