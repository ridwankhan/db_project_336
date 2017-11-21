<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.db_project.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Who likes?</title>
    <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
    <meta name="keywords"
          content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<section id="service" class="section-padding">
    <div class="container" align='center'>

        <h2 class="ser-title">Your Drinkers</h2>
        <hr class="botm-line">

            <%
                String barName = (String) session.getAttribute("ob");
%>
            <%
    List<String> list = new ArrayList<String>();

    try {

        //Get the database connection
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        //Create a SQL statement
        Statement stmt = con.createStatement();

        String beer = request.getParameter("beer");
        String order = request.getParameter("order");

        String str = "SELECT l.drinker, l.beer, l.rating FROM likes l JOIN frequents f ON f.drinker = l.drinker WHERE bar = '"+barName+"' AND beer= '"+beer+"' "+order;
        //out.print(str);

        //Run the query against the database.
        ResultSet result = stmt.executeQuery(str);

        //Make an HTML table to show the results in:
        out.print("<table>");

        //make a row
        out.print("<tr>");
        //make a column
        out.print("<td>");
        //print out column header
        out.print("Drinker");
        out.print("</td>");
        //make a column

        out.print("<td>");
        out.print("Beer");
        out.print("</td>");


        out.print("<td>");
        out.print("Rating");
        out.print("</td>");




        //make a column
        out.print("</tr>");

        //parse out the results
        while (result.next()) {
            //make a row
            out.print("<tr>");
            //make a column
            out.print("<td>");
            out.print(result.getString("drinker"));
            out.print("</td>");


            out.print("<td>");
            out.print(result.getString("beer"));
            out.print("</td>");



            out.print("<td>");
            out.print(result.getString("rating"));
            out.print("</td>");

            out.print("</tr>");

        }
        out.print("</table>");
        con.close();



    } catch (Exception e) {
    }
%>
</section>

</body>
</html>