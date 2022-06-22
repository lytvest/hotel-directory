<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Отели</title>
    </head>
    <body>
%{--        <a href="#list-hotel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--        <div class="nav" role="navigation">--}%
%{--            <ul>--}%
%{--                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--            </ul>--}%
%{--        </div>--}%
        <div id="list-hotel" class="content scaffold-list" role="main">
            <h1>Список отелей</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:link controller="hotel" action="create" class="btn btn-primary m-3"> Добавить новый отель</g:link>
        <div class="card">
            <div class="card-body">
            <div class="container border border-info p-2 d-flex m-1 row">
                <h5 class="col-3">Название</h5>
                <h5 class="col-2">Страна</h5>
                <h5 class="col-2">Звездность</h5>
                <h5 class="col-2">Сайт</h5>
            </div>
            <g:each in="${hotelList}" var="hotel">

                <div class="container border p-2 d-flex m-1 row">
                    <div class="col-3"><g:link controller="hotel" action="show" id="${hotel.id}">${hotel.name}</g:link></div>
                    <div class="col-2"><g:link controller="country" action="show" id="${hotel.country.id}">${hotel.country.name}</g:link></div>
                    <div class="col-2 d-flex">
                        <g:set var="num" value="${0}" />
                        <g:while test="${num < hotel.stars }">
                            <% num++ %>
                            <img src="${resource(dir: 'images', file: 'star.png')}" alt="*"/>
                        </g:while>
                    </div>
                    <div class="col-2">
                        <g:if test="${hotel.site}"><a href="${hotel.site}">Перейти на сайт</a></g:if>
                        <g:else> - </g:else>
                    </div>
                    <g:link controller="hotel" action="edit" id="${hotel.id}" class="btn btn-outline-info btn-sm ml-auto"> Редактировать</g:link>
                    <g:form controller="hotel" action="delete" id="${hotel.id}">
                        <input type="hidden" name="_method" value="DELETE" id="_method">
                        <input class="btn btn-danger btn-sm ml-2" type="submit" value="Удалить" onclick="return confirm('Вы действительно хотите удалить?');">
                    </g:form>
                </div>
            </g:each>
            </div>
        </div>


            <div class="pagination">
                <g:paginate total="${hotelCount ?: 0}" />
            </div>

        </div>
    </body>
</html>