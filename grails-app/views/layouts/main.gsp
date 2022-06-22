<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>
<div class="container">
<nav class="navbar navbar-expand-lg navbar-dark ">
    <div class="container-fluid">

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Переключатель навигации">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                <li class="nav-item ">
                    <g:link controller="search" class="nav-link p-2 pl-3 pr-3" >Поиск</g:link>
                </li>
                <li class="nav-item ">
                    <g:link controller="country" class="nav-link  p-2 pl-3 pr-3">Страны</g:link>
                </li>
                <li class="nav-item ">
                    <g:link controller="hotel" class="nav-link  p-2 pl-3 pr-3">Отели</g:link>
                </li>
            </ul>
        </div>
    </div>
</nav>
</div>

<div class="container">
    <g:layoutBody/>
</div>

<div class="row mt-4" role="contentinfo">

</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
