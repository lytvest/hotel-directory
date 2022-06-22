<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Поиск</title>
</head>

<body>
<div id="list-hotel" class="content scaffold-list" role="main">
    <h1>Поиск</h1>

    <div class="card m-3">
        <div class="card-body">
            <g:form method="GET">
                <div class="row">
                    <g:select class="form-select form-control col-3 m-2" name="countryId"
                              from="${hotel.directory.Country.list()}"
                              optionValue="${{ it.name }}"
                              value="${params?.countryId}"
                              optionKey="id"/>
                    <input type="text" class="form-control col-6 m-2" value="${params?.search}" id="search"
                           name="search" maxlength="255" placeholder="Введите слово для поиска...">
                    <input type="submit" class="btn btn-primary col-2 m-2" value="Найти"/>
                </div>
            </g:form>
            <div class="container m-3">
                <h5>
                    <g:if test="${hotelCount == null}"></g:if>
                    <g:elseif test="${hotelCount as Integer == 0}">По Вашему запросу ничего не найдено.</g:elseif>
                    <g:else>Количество результатов: ${hotelCount}</g:else>
                </h5>
            </div>

            <div class="container m-3">
                <g:if test="${hotelList}">
                    <div class="container border border-info p-2 d-flex m-1 row">
                        <h5 class="col-2">Название</h5>
                        <h5 class="col-3">Звездность</h5>
                        <h5 class="col-2">Сайт</h5>
                    </div>
                </g:if>
                <g:each in="${hotelList}" var="hotel">

                    <div class="container border p-2 d-flex m-1 row">
                        <div class="col-2"><g:link controller="hotel" action="show"
                                                   id="${hotel.id}">${hotel.name}</g:link></div>

                        <div class="col-3 d-flex">
                            <g:set var="num" value="${0}"/>
                            <g:while test="${num < hotel.stars}">
                                <% num++ %>
                                <img src="${resource(dir: 'images', file: 'star.png')}" alt="*"/>
                            </g:while>
                        </div>

                        <div class="col-2">
                            <g:if test="${hotel.site}"><a href="${hotel.site}">Перейти на сайт</a></g:if>
                            <g:else>-</g:else>
                        </div>
                    </div>
                </g:each>
            </div>
            <g:if test="${hotelList}">
                <div class="container d-flex">
                    <g:link controller="search" class="btn btn-outline-info ml-auto mr-4">Начать новый поиск</g:link>
                </div>
            </g:if>
        </div>
    </div>

    <div class="pagination">
        <g:paginate total="${hotelCount ?: 0}" params="${params}"/>
    </div>

</div>
</body>
</html>