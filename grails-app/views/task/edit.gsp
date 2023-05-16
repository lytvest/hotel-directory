<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Редактировать задачу</title>
</head>

<body>

<div id="edit-hotel" class="content scaffold-edit" role="main">
    <h1>Редактировать задачу</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <% task?.attach() %>
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
            <g:form resource="${task}" method="PUT">
                <g:render template="hotel_form"
                          model="[task: task, projectList: projectList, project: task.project]"/>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
