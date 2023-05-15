package hotel.directory

import java.time.LocalDate
import java.time.format.DateTimeFormatter

class Task {
    String name
    String text
    Project project
    LocalDate createDate = LocalDate.now()
    String score
    String factScore
    Status status
    TypeTask type
    User developer
    User tester

    static hasMany = [comments: Comment]


    static constraints = {
        name size: 1..255, blank: false
        project nullable: true
        score nullable: true
        factScore nullable: true
        status nullable: true
        type nullable: true
        developer nullable: true
        tester nullable: true
        text size: 1..5000
    }

}
