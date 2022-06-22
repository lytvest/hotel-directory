package hotel.directory

class Country {
    String name
    String capital
    static hasMany = [hotels: Hotel]


    static constraints = {
        name size:0..255, blank:false, unique:true
        capital size:0..128, blank:false
    }
}
