<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Отель</title>
</head>

<body>

<div id="show-hotel" class="content scaffold-show" role="main">
    <h1>Подробности отеля</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="card">
        <div class="card-body">
            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Название</h5>
                <h6 class="col-5">${hotel.name}</h6>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Страна</h5>
                <h6 class="col-5">${hotel.country.name}</h6>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Звездность</h5>

                <div class="col-5 d-flex">
                    <g:set var="num" value="${0}"/>
                    <g:while test="${num < hotel.stars}">
                        <% num++ %>
                        <img src="${resource(dir: 'images', file: 'star.png')}" alt="*"/>
                    </g:while>
                </div>
            </div>

            <div class="container border p-2 d-flex m-1 row">
                <h5 class="col-2">Сайт</h5>
                <h6 class="col-5">
                    <g:if test="${hotel.site}"><a href="${hotel.site}">Перейти на сайт</a></g:if>
                    <g:else>Сайт не указан.</g:else>
                </h6>
            </div>

            <div class="container p-2 d-flex m-1 row">
                <g:link controller="hotel" action="edit" id="${hotel.id}"
                        class="btn btn-outline-info  mr-auto">Редактировать</g:link>
                <g:form controller="hotel" action="delete" id="${hotel.id}">
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
