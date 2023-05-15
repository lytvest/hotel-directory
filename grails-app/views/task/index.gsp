<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Отели</title>
</head>

<body>

<div id="list-hotel" class="content scaffold-list" role="main">
    <h1>Список задач</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:link controller="task" action="create" class="btn btn-primary m-3">Создать новую задачу</g:link>
    <div class="card">
        <div class="card-body">
            <div class="container border border-info p-2 d-flex m-1 row">
                <h5 class="col-4">Название</h5>
                <h5 class="col-3">Проект</h5>
                <h5 class="col-2">Тип</h5>
                <h5 class="col-2">Статус</h5>
            </div>
            <g:each in="${taskList}" var="task">

                <div class="container border p-2 d-flex m-1 row">
                    <div class="col-4"><g:link controller="task" action="show"
                                               id="${task.id}">${task.name}</g:link></div>

                    <div class="col-3"><g:link controller="project" action="show"
                                               id="${task.project.id}">${task.project.name}</g:link></div>

                    <div class="col-2">${task.type?.name ?: "Нет типа"}</div>
                    <div class="col-2">${task.status?.name ?: "Нет cтатуса"}</div>


                    <g:link controller="task" action="edit" id="${task.id}"
                            class="btn btn-outline-info btn-sm ml-auto h-50">Редактировать</g:link>
                    <g:form controller="task" action="delete" id="${task.id}">
                        <input type="hidden" name="_method" value="DELETE" id="_method">
                        <input class="btn btn-outline-danger btn-sm ml-2" type="submit" value="Удалить"
                               onclick="return confirm('Вы действительно хотите удалить?');">
                    </g:form>
                </div>
            </g:each>
        </div>
    </div>

    <div class="pagination">
        <g:paginate total="${taskCount ?: 0}"/>
    </div>

</div>
</body>
</html>
