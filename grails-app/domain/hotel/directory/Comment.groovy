package hotel.directory

import java.time.LocalDate
import java.time.LocalDateTime

class Comment {

    String text
    String author
    LocalDateTime date = LocalDateTime.now()
    Task task

    static constraints = {
        text size: 1..1000, blank: false
        author size: 1..1000, blank: false
        task nullable: false
    }
}
