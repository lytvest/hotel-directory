package hotel.directory

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class CountryController {

    static scaffold = Country

    CountryService countryService
    HotelService hotelService



    /**
     * delete the country and all hotels in the country
     * @param id
     * @return
     */
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        def country = Country.get(id)
        Hotel.deleteAll(country.hotels)

        countryService.delete(id)


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'country.label', default: 'Country'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
}
