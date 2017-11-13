<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.db_project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<h1>Price of Beer</h1>
<%
    List<String> list = new ArrayList<String>();

    try {

        //Get the database connection
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        //Create a SQL statement
        Statement stmt = con.createStatement();
        //Get the combobox from the index.jsp
        String price = request.getParameter("price");
        String bar = request.getParameter("bar");
        String beer = request.getParameter("beer");

        //Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
        String str = "SELECT * FROM sells WHERE bar = '" +bar+ "' AND beer = '" + beer + "'";
        //Run the query against the database.
        out.print(str);
        ResultSet result = stmt.executeQuery(str);

        //Make an HTML table to show the results in:
        out.print("<table>");

        //make a row
        out.print("<tr>");
        //make a column
        out.print("<td>");
        //print out column header
        out.print("bar");
        out.print("</td>");
        //make a column
        out.print("<td>");
        out.print("beer");
        out.print("</td>");
        //make a column
        out.print("<td>");
        out.print("price");
        out.print("</td>");
        out.print("</tr>");

        //parse out the results
        while (result.next()) {
            //make a row
            out.print("<tr>");
            //make a column
            out.print("<td>");
            //Print out current bar name:
            out.print(result.getString("bar"));
            out.print("</td>");
            out.print("<td>");
            //Print out current beer name:
            out.print(result.getString("beer"));
            out.print("</td>");
            out.print("<td>");
            //Print out current price
            out.print(result.getString("price"));
            out.print("</td>");
            out.print("</tr>");

        }
        out.print("</table>");

        //close the connection.
        con.close();

    } catch (Exception e) {
    }
%>

</body>
</html>