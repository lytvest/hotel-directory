package hotel.directory

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class CountryServiceSpec extends Specification {

    CountryService countryService
    SessionFactory sessionFactory

    private Long setupData() {
        def c1 = new Country(name: "Poccия1", capital: "Москва").save(flush: true)
        def c2 = new Country(name: "Нидерланды2", capital: "Амстердам").save(flush: true)
        def c3 = new Country(name: "Андорра3", capital: "Андорра-ла-Велья").save(flush: true, failOnError: true)
        def c4 = new Country(name: "Греция4", capital: "Афины").save(flush: true)
        def c5 = new Country(name: "Сербия5", capital: "Белград").save(flush: true)
        def c6 = new Country(name: "Германия6", capital: "Берлин").save(flush: true)

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
        List<Country> countryList = countryService.list(max: 2, offset: 2)

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

        Country country = new Country(name: "Словакия1", capital: "Братислава")
        countryService.save(country)

        then:
        country.id != null
    }
}
