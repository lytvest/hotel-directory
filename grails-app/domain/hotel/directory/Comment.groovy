package hotel.directory

import java.time.LocalDate

class Comment {

    String text
    String author
    LocalDate date = LocalDate.now()
    Task task

    static constraints = {
        text size: 1..1000, blank: false
        author size: 1..1000, blank: false
        task nullable: false
    }
}
