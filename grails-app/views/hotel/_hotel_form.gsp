<g:hiddenField name="version" value="${hotel?.version}" />
%{--<fieldset class="form">--}%
%{--    <f:all bean="country"/>--}%
%{--</fieldset>--}%
<div class="mb-3 mt-3 row ">
    <label for="name" class="col-sm-2 col-form-label">Название</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="name" name="name" value="${hotel?.name}" required maxlength="255">
    </div>
</div>

<div class="mb-3 row">
    <label for="stars" class="col-sm-2 col-form-label">Звездность</label>
    <div class="col-sm-9">
    <g:select class="form-select form-control" name="stars"
              from="${1..5}"
              value="${hotel?.stars}"/>
    </div>
</div>
<div class="mb-3 row">

    <label class="col-sm-2 col-form-label">Страна</label>
    <div class="col-sm-9">
        <g:select class="form-select form-control" name="country"
                  from="${hotel.directory.Country.list()}"
                  value="${country?.id}"
                  optionValue="${{it.name}}"
                  optionKey="id" />
    </div>
</div>
<div class="mb-3 row">
    <label for="site" class="col-sm-2 col-form-label">Ссылка на сайт</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="site" name="site" value="${hotel?.site}">
    </div>
</div>
<div class="mb-3 row">
    <input class="m-3 btn btn-primary" type="submit" value="Сохранить" />
    <g:link class="m-3 btn btn-outline-danger" controller="hotel" action="index"> Отменить </g:link>
</div>
