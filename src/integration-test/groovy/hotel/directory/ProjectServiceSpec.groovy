package hotel.directory

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ProjectServiceSpec extends Specification {

    CountryService countryService
    SessionFactory sessionFactory

    private Long setupData() {
        def c1 = new Project(name: "Poccия1", comment: "Москва").save(flush: true)
        def c2 = new Project(name: "Нидерланды2", comment: "Амстердам").save(flush: true)
        def c3 = new Project(name: "Андорра3", comment: "Андорра-ла-Велья").save(flush: true, failOnError: true)
        def c4 = new Project(name: "Греция4", comment: "Афины").save(flush: true)
        def c5 = new Project(name: "Сербия5", comment: "Белград").save(flush: true)
        def c6 = new Project(name: "Германия6", comment: "Берлин").save(flush: true)

        c3.id
    }

    void "test get"() {
        setupData()

        expect:
        countryService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Project> countryList = countryService.list(max: 2, offset: 2)

        then:
        countryList.size() == 2
        countryList[0].name == "Андорра"
        countryList[1].name == "Греция"
    }

    void "test count"() {
        setupData()

        expect:
        countryService.count() == 6 + 9
    }

    void "test delete"() {
        Long countryId = setupData()

        expect:
        countryService.count() == 6 + 9

        when:
        countryService.delete(countryId)
        sessionFactory.currentSession.flush()

        then:
        countryService.count() == 5 + 9
    }

    void "test save"() {
        when:

        Project country = new Project(name: "Словакия1", comment: "Братислава")
        countryService.save(country)

        then:
        country.id != null
    }
}
