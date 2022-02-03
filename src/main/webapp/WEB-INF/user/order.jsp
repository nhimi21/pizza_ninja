<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Pizza</title>
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
    <div class="order">
        <p>You say I am hungry, I say order pizza!</p>
        <h3>Choose your favorite Pizza</h3>
        <hr>
        <form:form  modelAttribute="order" action="/order" method="post">
        <div class="form-row">
            <div class="form-group col-md-6">
                <form:label path="pizzaName">Pizza</form:label>
                <form:select path="pizzaName" class="form-control">
                    <form:option value="Pizza Di Tonne">Pizza Di Tonne</form:option>
                    <form:option value="Pizza Pepperoni">Pizza Pepperoni</form:option>
                    <form:option value="Pizza Supreme">Pizza Supreme</form:option>
                    <form:option value="Pizza Hawaiian">Pizza Hawaiian</form:option>
                    <form:option value="Pizza Sausage & Kale">Pizza Sausage & Kale</form:option>
                    <form:option value="Pizza Margherita" >Pizza Margherita</form:option>
                    <form:option value="Pizza Capricious">Pizza Capricious</form:option>
                </form:select>
            </div>
            <div class="form-group col-md-6">
                <form:label path="size">Size of Pizza</form:label>
                <form:select path="size" class="form-control">
                    <form:option value="Small">Small</form:option>
                    <form:option value="Medium">Medium</form:option>
                    <form:option value="Large">Large</form:option>
                </form:select>
            </div>
        </div>
        <div class="form-group">
            <form:label path="quantity">Quantity</form:label>
            <form:input type="number" class="form-control" path="quantity" placeholder="Quantity..."/>
        </div>
        <div class="form-group">
            <form:label path="note">Note</form:label>
            <form:textarea type="text" class="form-control" path="note" placeholder="With peperoni, patate, tomate"/>
        </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-danger">Order Pizza</button>
        </form:form>

    </div>

</div>
</body>
</html>
