<g:hiddenField name="version" value="${task?.version}" />
<% if (task?.id ) { task = hotel.directory.Task.get(task?.id) } %>

<div class="mb-3 mt-3 row ">
    <label for="name" class="col-sm-2 col-form-label">Название</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="name" name="name" value="${task?.name}" required maxlength="255">
    </div>
</div>


<div class="mb-3 row">

    <label class="col-sm-2 col-form-label">Проект</label>
    <div class="col-sm-9">
        <g:select class="form-select form-control" name="project"
                  from="${hotel.directory.Project.list()}"
                  value="${project?.id}"
                  optionValue="${{it.name}}"
                  optionKey="id" />
    </div>
</div>

<div class="mb-3 row">

    <label class="col-sm-2 col-form-label">Тип</label>
    <div class="col-sm-9">
        <g:select class="form-select form-control" name="type"
                  from="${hotel.directory.TypeTask.list()}"
                  value="${task?.type?.id}"
                  optionValue="${{it.name}}"
                  optionKey="id" />
    </div>
</div>

<div class="mb-3 row">

    <label class="col-sm-2 col-form-label">Статус</label>
    <div class="col-sm-9">
        <g:select class="form-select form-control" name="status"
                  from="${hotel.directory.Status.list()}"
                  value="${task?.status?.id ?: 0}"
                  optionValue="${{it.name}}"
                  optionKey="id" />
    </div>
</div>

<div class="mb-3 row">

    <label class="col-sm-2 col-form-label">Разработчик</label>
    <div class="col-sm-9">
        <g:select class="form-select form-control" name="developer"
                  from="${hotel.directory.User.developers()}"
                  value="${task?.developer?.id}"
                  optionValue="${{it.name}}"
                  optionKey="id" />
    </div>
</div>

<div class="mb-3 row">

    <label class="col-sm-2 col-form-label">Тестировщик</label>
    <div class="col-sm-9">
        <g:select class="form-select form-control" name="tester"
                  from="${hotel.directory.User.testers()}"
                  value="${task?.tester?.id}"
                  optionValue="${{it.name}}"
                  optionKey="id" />
    </div>
</div>

<div class="mb-3 row">

    <label class="col-sm-2 col-form-label">Дата создания задачи</label>

    <div class="col-sm-9">
        <input type="date" class="form-control" value="${task.createDate}">
    </div>
</div>

<div class="mb-3 row">

    <label class="col-sm-2 col-form-label">Оценка</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" name="score" value="${task.score}">
    </div>
</div>

<div class="mb-3 row">

    <label class="col-sm-2 col-form-label">Затраченное время</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" name="factScore" value="${task.factScore}">
    </div>
</div>


<div class="mb-3 row">
    <label for="text" class="col-sm-2 col-form-label">Задание</label>
    <div class="col-sm-9">
        <textarea type="text" class="form-control" id="text" name="text" >${task?.text}</textarea>
    </div>
</div>
<div class="mb-3 row">
    <input class="m-3 btn btn-primary" type="submit" value="Сохранить" />
    <g:link class="m-3 btn btn-outline-danger" controller="task" action="index"> Отменить </g:link>
</div>
