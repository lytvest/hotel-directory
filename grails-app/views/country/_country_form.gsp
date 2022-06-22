<g:hiddenField name="version" value="${country?.version}" />
<div class="mb-3 mt-3 row ">
    <label for="name" class="col-sm-2 col-form-label">Название</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="name" name="name" required value="${country?.name}">
    </div>
</div>
<div class="mb-3 row">
    <label for="capital" class="col-sm-2 col-form-label">Столица</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="capital" name="capital" required value="${country?.capital}">
    </div>
</div>
<div class="mb-3 row">
    <input class="m-3 btn btn-primary" type="submit" value="Сохранить" />
    <g:link class="m-3 btn btn-outline-danger" controller="country" action="index"> Отменить </g:link>
</div>