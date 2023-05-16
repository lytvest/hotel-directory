<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Задача ${task.name}</title>
</head>

<body>

<div id="show-hotel" class="content scaffold-show" role="main">
    <h1>Подробности задачи</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="card">
        <div class="card-body">
            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Название</h5>
                <h6 class="col-5">${task.name}</h6>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Проект</h5>
                <h6 class="col-5">${task.project.name}</h6>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Тип</h5>

                <div class="col-5 d-flex">
                    ${task.type?.name ?: "Нет типа"}
                </div>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Статус</h5>

                <div class="col-5 d-flex">
                    ${task.status?.name ?: "Нет cтатуса"}
                </div>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Разработчик</h5>

                <div class="col-5 d-flex">
                    ${task.developer?.name ?: "Нет разработчика"}
                </div>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Тестировщик</h5>

                <div class="col-5 d-flex">
                    ${task.tester?.name ?: "Нет Тестировщика"}
                </div>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Дата создания задачи</h5>

                <div class="col-5 d-flex">
                    <input type="date" class="form-control" value="${task.createDate}" disabled>
                </div>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Оценка</h5>

                <div class="col-5 d-flex">
                    ${task.score ?: "Нет оценки"}
                </div>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Затраченное время</h5>

                <div class="col-5 d-flex">
                    ${task.factScore ?: "Нет затраченного времени"}
                </div>
            </div>


            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Задание</h5>
                <h6 class="col-5">
                    ${task.text}
                </h6>
            </div>

            <div class="container p-2 d-flex m-1 row">
                <g:link controller="task" action="edit" id="${task.id}"
                        class="btn btn-outline-info  mr-auto">Редактировать</g:link>
                <g:form controller="task" action="delete" id="${task.id}">
                    <input type="hidden" name="_method" value="DELETE" id="_method">
                    <input class="btn btn-danger ml-2" type="submit" value="Удалить"
                           onclick="return confirm('Вы действительно хотите удалить?');">
                </g:form>
            </div>

            <g:if test="${task.comments }">
                <div class="row d-flex justify-content-center container">

                    <g:each in="${task.comments.sort { it.date }}" var="comment">
                        <div class="col-12 card mb-4">
                            <div class="card-body">
                                <p>${comment.text}</p>

                                <div class="d-flex justify-content-between">
                                    <div class="d-flex flex-row align-items-center">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(4).webp"
                                             alt="avatar" width="25"
                                             height="25"/>

                                        <p class="small mb-0 ms-2">${comment.author}</p>
                                    </div>

                                    <div class="d-flex flex-row align-items-center">
                                        <p class="small text-muted mb-0">${hotel.directory.Application.date(comment.date)}</p>
                                        <i class="far fa-thumbs-up mx-2 fa-xs text-black"
                                           style="margin-top: -0.16rem;"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:each>

                </div>
            </g:if>
            <g:else>
                <div>Комментарии отсутствуют</div>
            </g:else>

            <form action="/comment/save" method="post">

                <div class="row d-flex">
                    <input name="task" type="hidden" value="${task.id}">
                    <input id="add-comment" class="form-control m-1 col-10" name="text" type="text"
                           placeholder="Введите комментарий...">
                    <input type="submit" class="btn btn-primary m-1 ml-auto" style="width: 14%" value="Добавить">
                    <g:select class="form-select form-control m-1" name="author"
                              from="${hotel.directory.User.list()}"
                              value="${task?.tester?.id}"
                              optionValue="${{it.name}}"
                              optionKey="name" />
                </div></form>
            </div>
        </div>

    </div>
    </body>
    </html>
