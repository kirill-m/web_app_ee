<%--
  Created by IntelliJ IDEA.
  User: kirill
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create table</title>
</head>
<body>
    <h1>Hello!</h1>
    <h4>How many rows do you want to input in table?</h4>
    <form method="post" action="/web_app_ee_war/table.jsp">
        <input name="rows" type="number" min="1" step="1" max="100">
        <input type="submit" value="Create table" ><br/>
    </form>
</body>
</html>
