package hotel.directory

class StatsController {

    def index() {

        def role = User.DEVELOPER

        def users = User.findAllByRole(role)

        def statuses = Status.list().subList(0, 5)
        def result = []
        users.each { user ->
            def st = []
            statuses.each {status ->
                def number = 0;
                if (role == User.DEVELOPER) {
                    number = Task.countByStatusAndDeveloper(status, user)
                } else  {
                    number = Task.countByStatusAndTester(status, user)
                }
                st.add(number)
            }
            result.add([user: user.name, numbers: st])
        }

        [map:result, names: statuses.name]
    }
}
