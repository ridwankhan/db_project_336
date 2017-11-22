<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.db_project.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Beers You Sell</title>
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

        <h2 class="ser-title">Beers And Prices</h2>
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

        String manu = request.getParameter("manu");
        //out.print(manu);

        String order = request.getParameter("order");
        //Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the barhomebarhome.jsp
        String str;
        if (manu.equals("TRUE")) {
            str = "SELECT * FROM sells s JOIN beers b ON s.beer = b.name WHERE s.bar= '"+barName+"' "+order;
        }
        else{
             str = "SELECT * FROM sells WHERE bar= '"+barName+"' "+order;
             }
        //out.print(str);

        //Run the query against the database.
        ResultSet result = stmt.executeQuery(str);

        out.print("<p>Note: Rating of: 1 - kind of likes, 2-likes,3-really likes</p>");

        //Make an HTML table to show the results in:
        out.print("<table>");

        //make a row
        out.print("<tr>");
        //make a column
        out.print("<td>");
        //print out column header
        out.print("Beer");
        out.print("</td>");
        //make a column


        out.print("<td>");
        out.print("Price");
        out.print("</td>");

        if (manu.equals("TRUE")){
             out.print("<td>");
            out.print("Manufacturer");
            out.print("</td>");

        }

        if (manu.equals("TRUE")){
            out.print("<td>");
            out.print("Manufacturer Price");
            out.print("</td>");

        }



        out.print("</tr>");

        //parse out the results
        while (result.next()) {
            //make a row
            out.print("<tr>");
            //make a column
            out.print("<td>");
            out.print(result.getString("Beer"));
            out.print("</td>");


            out.print("<td>");

            out.print("$"+result.getString("price"));

            out.print("</td>");

            if (manu.equals("TRUE")){
             out.print("<td>");
            out.print(result.getString("manf"));
            out.print("</td>");

        }

        if (manu.equals("TRUE")){
            out.print("<td>");
            out.print("$"+result.getString("retailprice"));
            out.print("</td>");

        }



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