package hotel.directory

class CommentController {

    static scaffold = Comment

    def show(Comment comment) {
        redirect controller: 'task', action: 'show', id: comment.task.id
    }
}
