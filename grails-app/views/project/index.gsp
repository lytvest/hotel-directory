<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="project.label" default="Проекты"/></title>
</head>

<body>

<div id="list-country" class="content container" role="main">
    <h1>Список проектов</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:link controller="project" action="create" class="btn btn-primary m-3">Добавить новый проект</g:link>
    <div class="card m-3">
        <div class="card-body">

            <g:each in="${projectList}" var="project">
                <div class="container border p-2 d-flex m-1 row">
                    <div class="col-6 d-flex flex-column">
                    <div ><g:link controller="project" action="show"
                                               id="${project.id}">${project.name}</g:link></div>

                    <div >${project.comment}</div>
                    </div>
                    <a href="/search/index?projectId=${project.id}"
                            class="btn btn-outline-success h-50 btn-sm ml-auto">Список задач</a>
                    <g:link controller="project" action="edit" id="${project.id}"
                            class="btn btn-outline-info h-50 btn-sm ml-2">Редактировать</g:link>
                    <g:form controller="project" action="delete" id="${project.id}">
                        <input type="hidden" name="_method" value="DELETE" id="_method">
                        <input class="btn btn-outline-danger btn-sm ml-2" type="submit" value="Удалить"
                               onclick="return confirm('Вы действительно хотите удалить?');">
                    </g:form>
                </div>
            </g:each>
        </div>
    </div>

    <div class="pagination">
        <g:paginate total="${projectCount ?: 0}"/>
    </div>
</div>
</body>
</html>
