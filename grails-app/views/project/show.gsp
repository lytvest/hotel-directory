<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Проект ${project.name}</title>
</head>

<body>
<div id="show-country" class="content scaffold-show" role="main">
    <h1>Подробности проекта</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="card m-3">
        <div class="card-body">
            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-3">Название</h5>
                <h6 class="col-9">${project.name}</h6>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-3">Комментарий</h5>
                <h6 class="col-9">${project.comment}</h6>
            </div>

            <div class="container p-2 d-flex m-1 row">
                <g:link controller="project" action="edit" id="${project.id}"
                        class="btn btn-outline-info  mr-auto">Редактировать</g:link>
                <g:form controller="project" action="delete" id="${project.id}">
                    <input type="hidden" name="_method" value="DELETE" id="_method">
                    <input class="btn btn-danger ml-2" type="submit" value="Удалить"
                           onclick="return confirm('Вы действительно хотите удалить?');">
                </g:form>
            </div>
        </div>
    </div>

</div>
</body>
</html>
