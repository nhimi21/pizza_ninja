<%--
  Created by IntelliJ IDEA.
  User: CRS
  Date: 1/30/2022
  Time: 12:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Welcome Admin </h1>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="submit" value="Log Out" class="logout"/>
</body>
</html>
