<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="country.label" default="Страны"/></title>
</head>

<body>
%{--        <div class="nav" role="navigation">--}%
%{--            <ul>--}%
%{--                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--            </ul>--}%
%{--        </div>--}%

<div id="list-country" class="content container" role="main">
    <h1>Список стран</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:link controller="country" action="create" class="btn btn-primary m-3">Добавить новую страну</g:link>
    <div class="card m-3">
        <div class="card-body">
            <div class="container border border-info p-2 d-flex m-1 row">
                <h5 class="col-3">Название</h5>
                <h5 class="col-3">Столица</h5>
            </div>
            <g:each in="${countryList}" var="country">
                <div class="container border p-2 d-flex m-1 row">
                    <div class="col-3"><g:link controller="country" action="show"
                                               id="${country.id}">${country.name}</g:link></div>

                    <div class="col-3">${country.capital}</div>
                    <g:link controller="country" action="edit" id="${country.id}"
                            class="btn btn-outline-info btn-sm ml-auto">Редактировать</g:link>
                    <g:form controller="country" action="delete" id="${country.id}">
                        <input type="hidden" name="_method" value="DELETE" id="_method">
                        <input class="btn btn-danger btn-sm ml-2" type="submit" value="Удалить"
                               onclick="return confirm('Вы действительно хотите удалить?');">
                    </g:form>
                </div>
            </g:each>
        </div>
    </div>

    <div class="pagination">
        <g:paginate total="${countryCount ?: 0}"/>
    </div>
</div>
</body>
</html>