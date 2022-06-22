package hotel.directory

import grails.gorm.transactions.Transactional

class BootStrap {

    def init = { servletContext ->

        def c1 = new Country(name: "Poccия", capital: "Москва").save()
        def c2 = new Country(name: "Нидерланды", capital: "Амстердам").save()
        def c3 = new Country(name: "Андорра", capital: "Андорра-ла-Велья").save()
        def c4 = new Country(name: "Греция", capital: "Афины").save()
        def c5 = new Country(name: "Сербия", capital: "Белград").save()
        def c6 = new Country(name: "Германия", capital: "Берлин").save()
        def c7 = new Country(name: "Швейцария", capital: "Берн").save()
        def c8 = new Country(name: "Словакия", capital: "Братислава").save()
        def c9 = new Country(name: "Бельгия", capital: "Брюссель").save()

        def countries = [c1, c2, c3, c4, c5, c6, c7, c8, c9]
        createHotels(countries)

    }
    @Transactional
    void createHotels(countries){
        def labels = ["на", "бо", "ве", "фи", "гу", "ме", "ту", "ке"]
        def random = new Random()
        def set = [] as Set
        for (i in 0..<100) {
            def name = "Отель ${labels[random.nextInt(labels.size)]}${labels[random.nextInt(labels.size)]}${labels[random.nextInt(labels.size)]}"
            if (name in set)
                continue
            set += name
            new Hotel(
                    name: name ,
                    stars: random.nextInt(5) + 1,
                    country: countries[random.nextInt(countries.size)],
                    site: random.nextBoolean() ? "https://yandex.ru" : null
            ).save()
        }
    }
    def destroy = {
    }
}
