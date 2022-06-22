<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Создать новый отель</title>
</head>

<body>

<div id="create-hotel" class="content scaffold-create" role="main">
    <h1>Создать новый отель</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${hotel}">
        <ul class="errors" role="alert">
            <g:eachError bean="${hotel}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div class="card m-3">
        <div class="card-body">
            <g:form resource="${hotel}" method="POST">
                <g:render template="hotel_form" model="[hotel: hotel, countryList: countryList]"/>
            </g:form>
        </div>
    </div>

</div>
</body>
</html>
