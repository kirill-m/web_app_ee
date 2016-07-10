<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %><%--
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
    <h4>You can overwrite or create new table. How many rows do you want to input in table?</h4>
    <form method="post" action="/web_app_ee_war/table.jsp">
        <input name="rows" type="number" min="1" step="1" max="100">
        <input type="submit" value="Create table" >
    </form>
    <h4>Existing table:</h4>


    <%
        PrintWriter outStream = response.getWriter();
        try {
            Class.forName("org.h2.Driver");
            Connection conn = DriverManager.getConnection("jdbc:h2:~/web-app/testDB", "test", "test");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM test_table");
    %>
    <table border=1 cellpadding=3 cellspacing=1>
        <tr>
            <th>ID</th>
            <th>TEXT</th>
            <th>INSERT_DATE</th>
        </tr>
    <%
            while( rs.next() ) {
    %>
    <tr>
        <td><%= rs.getString("ID") %></td>
        <td><%= rs.getString("TEXT")%></td>
        <td><%= rs.getString("INSERT_DATE")%></td>
    </tr>
    <%
            }
            rs.close();
            st.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            outStream.println(e);
        } catch (SQLException e) {
            outStream.println("Table \"TEST_TABLE\" not found. Create a new one.");
        }
    %>
    </table>
</body>
</html>
