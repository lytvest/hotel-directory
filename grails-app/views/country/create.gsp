<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Добавить страну</title>
</head>

<body>
<div id="create-country" class="content scaffold-create" role="main">
    <h1>Добавить страну</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.country}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.country}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="card m-3">
        <div class="card-body">
            <g:form resource="${this.country}" method="POST">
                <g:render template="country_form" model="[country: this.country]"/>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
