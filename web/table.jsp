<%--
  Created by IntelliJ IDEA.
  User: kirill
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DB table query</title>
</head>
<body>
    <h1>Data from test_table</h1>
    <table border=1 cellpadding=3 cellspacing=1>
        <tr>
            <th>ID</th>
            <th>TEXT</th>
            <th>INSERT_DATE</th>
        </tr>

        <%@ page import = "java.sql.*" %>
        <%@ page import="java.io.PrintWriter" %>
        <%@ page import="main.java.db_helper.TablePopulator" %>
        <%
            PrintWriter outStream = response.getWriter();
            String message = request.getParameter("rows");
            Integer rows;
            try {
                rows = Integer.parseInt(message);
            } catch (NumberFormatException e) {
                rows = 10;
            }
            if (rows < 1 || rows > 200)
                rows = 10;
        %>
        <p>Rows: <%=rows%></p>
        <%
            TablePopulator.populate(rows);

        try {
            Class.forName("org.h2.Driver");
            Connection conn = DriverManager.getConnection("jdbc:h2:~/web-app/testDB", "test", "test");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM test_table");
            while( rs.next() ) {
        %>
        <tr>
            <td><%= rs.getString("ID") %></td>
            <td><%= rs.getString("TEXT")%></td>
            <td><%= rs.getString("INSERT_DATE")%></td>
        </tr>
        <%

            }
            st.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            outStream.println(e);
        } catch (SQLException e) {
                outStream.println(e);
        }
        %>
    </table>

</body>
</html>
