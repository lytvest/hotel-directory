package hotel.directory

import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration

import groovy.transform.CompileStatic

import java.time.LocalDate
import java.time.format.DateTimeFormatter

@CompileStatic
class Application extends GrailsAutoConfiguration {
    static void main(String[] args) {
        GrailsApp.run(Application, args)
    }

    static DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy")

    static String date(LocalDate date) {
        return date.format(formatter)
    }
}
