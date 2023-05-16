<%--
  Created by IntelliJ IDEA.
  User: bashkirtsev
  Date: 5/15/23
  Time: 9:15 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Отчеты</title>
</head>

<body>

<div id="list-hotel" class="content scaffold-list" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="container">
        <nav class="navbar navbar-light ">
            <div class="container">


                <ul class="navbar-nav me-auto mb-2 mb-lg-0 d-flex flex-row">
                    <li class="nav-item ">
                        <div class="nav-link p-2 pl-3 pr-3" style="color: darkred; font-weight: bold">Отчеты</div>
                    </li>
                    <li class="nav-item ">
                        <g:link controller="stats" class="nav-link p-2 pl-3 pr-3" >Разработчики</g:link>
                    </li>
                    <li class="nav-item ">
                        <g:link controller="stats" action="testers" class="nav-link  p-2 pl-3 pr-3">Тестировщики</g:link>
                    </li>
                </ul>

            </div>
        </nav>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="container border border-info p-2 d-flex m-1 row">
                <h5 class="col-2">ФИО</h5>
                <g:each in="${names}" var="status">
                    <h5 class="col-2">${status ?: ""}</h5>
                </g:each>
            </div>
            <g:each in="${map}" var="st">

                <div class="container border p-2 d-flex m-1 row">

                    <div class="col-2">${st.user ?: "???"}</div>
                    <g:each in="${st.numbers}" var="num">
                        <h5 class="col-2">${num}</h5>
                    </g:each>
                </div>
            </g:each>
        </div>
    </div>
</div>
</body>
</html>
