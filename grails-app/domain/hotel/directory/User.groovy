package hotel.directory

class User {

    String name
    String role

    static String DEVELOPER = "DEVELOPER"
    static String TESTER = "TESTER"

    static constraints = {
        role size: 1..100, blank: false
        name size: 1..200, blank: false
    }

    static def developers() {
        return findAllByRole(DEVELOPER)
    }

    static def testers() {
        return findAllByRole(TESTER)
    }
}
