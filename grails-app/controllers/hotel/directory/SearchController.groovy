package hotel.directory

class SearchController {

    def index(Integer countryId, String search) {
        if (countryId == null)
            return
        def country = Country.get(countryId)
        def list = Hotel.findAllByCountryAndNameIlike(country, "%$search%",
                [
                        sort: [stars:'desc', name:'asc'],
                        max: Math.min(params.max as Integer ?: 10, 100),
                        offset: params.offset ?: 0
                ])
        def count = Hotel.countByCountryAndNameIlike(country, "%$search%")
        [hotelList:list, hotelCount: count]
    }
}
