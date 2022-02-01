<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pizza</title>
    <link href="${pageContext.request.contextPath}/css/userstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container col-12">
    <div class="nav">
        <h1>Pizza<span>~</span>Ninja</h1>
        <form id="logoutForm" method="POST" action="/logout">
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/order">Order</a></li>
                <li><a href="/account/${currentUser.id}">Account</a></li>
                <li>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Log Out" class="logout"/>
                </li>
            </ul>
        </form>
    </div>
    <div class="hed">
        <h1>Welcome back <c:out value="${currentUser.firstName}"/> <c:out value="${currentUser.lastName}"/>!</h1>
        <p>You say I am hungry, I say order pizza</p>
    </div>
    <div class="img-box col-4">
        <img src="${pageContext.request.contextPath}/img/pica6.jpg" alt="pica1" width="400" height="300">
        <img src="${pageContext.request.contextPath}/img/pica5.jpg" alt="pica5" width="400" height="300">
        <img src="${pageContext.request.contextPath}/img/pica3.jpg" alt="pica3" width="400" height="300">
    </div>

</div>
</body>
