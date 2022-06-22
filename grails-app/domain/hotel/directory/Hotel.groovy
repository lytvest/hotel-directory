package hotel.directory

class Hotel {
    String name
    Country country
    Integer stars
    String site

    static constraints = {
        name size: 1..255, blank: false, validator: { val, obj ->
            def hotel = Hotel.findByCountryAndName(obj.country, val)
            if (hotel != null && hotel.id != obj.id)
                ['alreadyExists']
        }
        country blank: false
        stars min: 1, max: 5, blank: false
        site blank: true, nullable: true, validator: {
            it?.startsWith("http://") || it?.startsWith("https://") || it == null ?: ['siteStarts']
        }
    }
}
