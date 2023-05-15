package hotel.directory

class SearchController {

    def index(Integer projectId, String search) {
        if (projectId == null) {
            redirect(controller: 'project', action: 'index')
            return
        }
        if(!search) {
            search = ""
        }
        def project = Project.get(projectId)
        def list = Task.findAllByProjectAndNameIlike(project, "%$search%",
                [
                        sort: [name:'asc'],
                        max: Math.min(params.max as Integer ?: 10, 100),
                        offset: params?.offset ?: 0
                ])
        def count = Task.countByProjectAndNameIlike(project, "%$search%")
        [taskList:list, taskCount: count]
    }
}
