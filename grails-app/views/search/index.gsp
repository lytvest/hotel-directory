<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Поиск</title>
</head>

<body>
<div id="list-hotel" class="content scaffold-list" role="main">


    <div class="card m-3">
        <div class="card-body">
            <g:form method="GET">
                <div class="row">
                    <g:select class="form-select form-control col-3 m-2" name="projectId"
                              from="${hotel.directory.Project.list()}"
                              optionValue="${{ it.name }}"
                              value="${params?.projectId}"
                              optionKey="id"/>
                    <input type="text" class="form-control col-6 m-2" value="${params?.search}" id="search"
                           name="search" maxlength="255" placeholder="Введите слово для поиска...">
                    <input type="submit" class="btn btn-primary col-2 m-2" value="Найти"/>
                </div>
            </g:form>
            <div class="container m-3">
                <h5>
                    <g:if test="${taskCount == null}"></g:if>
                    <g:elseif test="${taskCount as Integer == 0}">По Вашему запросу ничего не найдено.</g:elseif>
                    <g:else>Количество результатов: ${taskCount}</g:else>
                </h5>
            </div>


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

            <g:if test="${taskList}">
                <div class="container d-flex">
                    <g:link controller="search" class="btn btn-outline-info ml-auto mr-4">Начать новый поиск</g:link>
                </div>
            </g:if>
        </div>
    </div>

    <div class="pagination">
        <g:paginate total="${taskCount ?: 0}" params="${params}"/>
    </div>


</div>
</body>
</html>
