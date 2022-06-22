<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Страна</title>
</head>

<body>
<div id="show-country" class="content scaffold-show" role="main">
    <h1>Подробности страны</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="card m-3">
        <div class="card-body">
            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Название</h5>
                <h6 class="col-2">${country.name}</h6>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Столица</h5>
                <h6 class="col-2">${country.capital}</h6>
            </div>

            <div class="container p-2 d-flex m-1 row">
                <g:link controller="country" action="edit" id="${country.id}"
                        class="btn btn-outline-info  mr-auto">Редактировать</g:link>
                <g:form controller="country" action="delete" id="${country.id}">
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
