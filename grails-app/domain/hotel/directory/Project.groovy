package hotel.directory

class Project {
    String name
    String comment
    static hasMany = [hotels: Task]


    static constraints = {
        name size:0..255, blank:false, unique:true
        comment size:0..1000, blank:false
    }
}
