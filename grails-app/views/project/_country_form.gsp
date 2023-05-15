<g:hiddenField name="version" value="${project?.version}" />
<div class="mb-3 mt-3 row ">
    <label for="name" class="col-sm-2 col-form-label">Название</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="name" name="name" required value="${project?.name}">
    </div>
</div>
<div class="mb-3 row">
    <label for="comment" class="col-sm-2 col-form-label">Комментарий</label>
    <div class="col-sm-9">
        <textarea type="text" class="form-control" id="comment" name="comment" required >${project?.comment}</textarea>
    </div>
</div>
<div class="mb-3 row">
    <input class="m-3 btn btn-primary" type="submit" value="Сохранить" />
    <g:link class="m-3 btn btn-outline-danger" controller="project" action="index"> Отменить </g:link>
</div>
