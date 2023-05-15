package hotel.directory


import static org.springframework.http.HttpStatus.*

class ProjectController {

    static scaffold = Project

    CountryService countryService
    HotelService hotelService



//    /**
//     * delete the country and all hotels in the country
//     * @param id
//     * @return
//     */
//    def delete(Long id) {
//        if (id == null) {
//            notFound()
//            return
//        }
//        def country = Project.get(id)
//
//        Task.deleteAll(country.hotels)
//        countryService.delete(id)
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'country.label', default: 'Country'), id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
//    }
//
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//    }
}
