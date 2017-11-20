<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.db_project.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Who's Watching?</title>
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

        <h2 class="ser-title">Who is watching?</h2>
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
        //Get the combobox from the barhome.jsp

       String strtime = request.getParameter("time");
       double time = Double.parseDouble(strtime);
       String day = request.getParameter("day");
       String channel = request.getParameter("channel");

        //Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the barhomebarhome.jsp
        String str = "SELECT * FROM watches WHERE time ="+time+" AND day= '"+day+"' AND channel= '"+channel+"' AND name IN (SELECT drinker FROM frequents WHERE bar= '"+barName+"')";
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

         out.print("<td>");
        //print out column header
        out.print("Time");
        out.print("</td>");

        out.print("<td>");
        //print out column header
        out.print("Day");
        out.print("</td>");

        out.print("<td>");
        //print out column header
        out.print("Channel");
        out.print("</td>");
        //make a column

         out.print("</tr>");

         if(result.next()==false){
             out.print("None of your drinkers watch this channel at this time and day");
         }

        //parse out the results
        while (result.next()) {
            //make a row
            out.print("<tr>");
            //make a column
            out.print("<td>");
            out.print(result.getString("name"));
            out.print("</td>");

             out.print("<td>");
            out.print(result.getString("time"));
            out.print("</td>");

             out.print("<td>");
            out.print(result.getString("day"));
            out.print("</td>");

             out.print("<td>");
            out.print(result.getString("channel"));
            out.print("</td>");



            out.print("</tr>");

        }
        out.print("</table>");

        //close the connection.
        con.close();

    } catch (Exception e) {
    }
%>
</section>

</body>
</html>