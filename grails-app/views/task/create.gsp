<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Создать новую задачу</title>
</head>

<body>

<div id="create-hotel" class="content scaffold-create" role="main">
    <h1>Создать новую задачу</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${task}">
        <ul class="errors" role="alert">
            <g:eachError bean="${task}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div class="card m-3">
        <div class="card-body">
            <g:form resource="${task}" method="POST">
                <g:render template="hotel_form" model="[task: task, projectList: projectList]"/>
            </g:form>
        </div>
    </div>

</div>
</body>
</html>
