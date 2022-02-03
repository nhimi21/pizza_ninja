<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Orders Info</title>
    <link href="${pageContext.request.contextPath}/css/account.css" rel="stylesheet" type="text/css">
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

    <h2 style="text-align: center;color: orangered;padding: 15px ">Welcome to Orders <c:out value="${currentUser.firstName}"/>!</h2>

<div class="col-12">
    <h3>All orders in processing</h3>
<hr>

    <table class="table table-hover">
        <thead>
            <tr>
                <th>Pizza name</th>
                <th>Pizza size</th>
                <th>Pizza quantity</th>
                <th>Notes</th>
                <th>Order by</th>
                <th>Email</th>
                <th>Address</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.pizzaName}</td>
                <td>${order.size}</td>
                <td>${order.quantity}</td>
                <td>${order.note}</td>
                <td>${order.user.firstName} ${order.user.lastName}</td>
                <td>${order.user.username}</td>
                <td>${order.user.address}</td>
                <td>unprepared</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>

