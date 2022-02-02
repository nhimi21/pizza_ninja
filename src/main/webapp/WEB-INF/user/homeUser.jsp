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
        <h1>Welcome to Pizza~Ninja  <c:out value="${currentUser.lastName}"/>!</h1>
    </div>
    <hr>
    <div class="img-box">
        <div class="box-cont">
            <h2>Pizza Pepperoni</h2>
            <img src="${pageContext.request.contextPath}/img/pica6.jpg" alt="pica1" width="400" height="300">
            <span>Price: 5$</span>
            <button class="btn btn-danger"><a href="/order" style="text-decoration: none; color: white; font-weight: bold">Order Now</a></button>
        </div>
        <div class="box-cont">
            <h2>Pizza Supreme</h2>
            <img src="${pageContext.request.contextPath}/img/pica5.jpg" alt="pica5" width="400" height="300">
            <span>Price: 7$</span>
            <button class="btn btn-danger"><a href="/order" style="text-decoration: none; color: white; font-weight: bold">Order Now</a></button>
        </div>
       <div class="box-cont">
           <h2>Pizza Pizza Hawaiian</h2>
           <img src="${pageContext.request.contextPath}/img/pica3.jpg" alt="pica3" width="400" height="300">
           <span>Price: 10$</span>
           <button class="btn btn-danger"><a href="/order" style="text-decoration: none; color: white; font-weight: bold">Order Now</a></button>
       </div>

    </div>
    <hr>
    <div class="img-box">
        <div class="box-cont">
            <h2>Pizza Sausage & Kale</h2>
            <img src="${pageContext.request.contextPath}/img/pica1.jpg" alt="pica1" width="400" height="300">
            <span>Price: 4$</span>
            <button class="btn btn-danger"><a href="/order" style="text-decoration: none; color: white; font-weight: bold">Order Now</a></button>
        </div>
        <div class="box-cont">
            <h2>Pizza Capricious</h2>
            <img src="${pageContext.request.contextPath}/img/pica8.jpg" alt="pica5" width="400" height="300">
            <span>Price: 8$</span>
            <button class="btn btn-danger"><a href="/order" style="text-decoration: none; color: white; font-weight: bold">Order Now</a></button>
        </div >
        <div class="box-cont">
            <h2>Pizza Margherita</h2>
            <img src="${pageContext.request.contextPath}/img/pica4.jpg" alt="pica3" width="400" height="300">
            <span>Price: 12$</span>
            <button class="btn btn-danger"><a href="/order" style="text-decoration: none; color: white; font-weight: bold">Order Now</a></button>
        </div>

    </div>

</div>
</body>
