<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.db_project.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Drinkers</title>
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
        //Get the combobox from the barhomebarhome.jsp
        String bar = request.getParameter("bar");

        String drinker = request.getParameter("drinker");
        //Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the barhomebarhome.jsp
        String str = "SELECT drinker, frequency, age,gender,tolerance, street_address,city,state, zipcode " +
         "FROM frequents f JOIN drinkers d on f.drinker = d.name WHERE bar = '" + barName+"' AND drinker = '"+drinker+"' ";
        //out.print(str);

        //Run the query against the database.
        ResultSet result = stmt.executeQuery(str);
        out.print(result);

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
        out.print("Age");
        out.print("</td>");


        out.print("<td>");
        out.print("Gender");
        out.print("</td>");



        out.print("<td>");
        out.print("Tolerance");
        out.print("</td>");


        out.print("<td>");
        out.print("Street Address");
        out.print("</td>");

        out.print("<td>");
        out.print("City");
        out.print("</td>");



        out.print("<td>");
        out.print("State");
        out.print("</td>");


        out.print("<td>");
        out.print("Zip Code");
        out.print("</td>");


        out.print("<td>");
        out.print("Frequency");
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
            out.print(result.getString("age"));
            out.print("</td>");



            out.print("<td>");
            out.print(result.getString("gender"));
            out.print("</td>");



            out.print("<td>");
            out.print(result.getString("tolerance"));
            out.print("</td>");


            out.print("<td>");
            out.print(result.getString("street_address"));
            out.print("</td>");


            out.print("<td>");
            out.print(result.getString("city"));
            out.print("</td>");


            out.print("<td>");
            out.print(result.getString("state"));
            out.print("</td>");


            out.print("<td>");
            if(Integer.parseInt(result.getString("zipcode"))<10000){
                out.print("0"+result.getString("zipcode"));

            }
            else
                out.print(result.getString("zipcode"));
            out.print("</td>");


            out.print("<td>");
            out.print(result.getString("frequency"));
            out.print("</td>");




            out.print("</tr>");

        }
        out.print("</table>");
        con.close();

         Connection con2 = db.getConnection();
        String str2 = "SELECT beer,rating FROM likes WHERE drinker = '"+drinker+"'";
         out.print(str2);
        Statement stmt2 = con2.createStatement();

        ResultSet result2 = stmt2.executeQuery(str2);
        //out.print(result2);

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
        out.print("Rating");
        out.print("</td>");

        out.print("</tr>");



         while (result2.next()) {
             out.print("here");
            //make a row
            out.print("<tr>");
            //make a column
            out.print("<td>");
            out.print(result.getString("beer"));
            out.print("</td>");

            out.print("<td>");
            out.print(result.getString("rating"));
            out.print("</td>");

             out.print("</tr>");

        }
        out.print("</table>");


        //close the connection.
        con2.close();


    } catch (Exception e) {
    }
%>
</section>

</body>
</html>