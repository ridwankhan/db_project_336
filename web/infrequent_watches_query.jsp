<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.db_project.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Infrequent Customers</title>
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

        <h2 class="ser-title">Get infrequent Customers to return by advertising to them</h2>
        <hr class="botm-line">
            <%!

public String getTime(String i){

String mytime;

        if (i.equals("0")) mytime = "12:00 AM";


        else if (i.equals("0.5")) mytime = "12:30 AM";


         else if (i.equals("1")) mytime = "1:00 AM";


         else if (i.equals("1.5")) mytime = "1:30 AM";


         else if (i.equals("2")) mytime = "2:00 AM";


         else if (i.equals("2.5")) mytime = "2:30 AM";



         else if (i.equals("3")) mytime = "3:00 AM";


         else if (i.equals("3.5")) mytime = "3:30 AM";


         else if (i.equals("4")) mytime = "4:00 AM";


         else if (i.equals("4.5")) mytime = "4:30 AM";


        else if (i.equals("5")) mytime = "5:00 AM";


         else if (i.equals("5.5")) mytime = "5:30 AM";



         else if (i.equals("6")) mytime = "6:00 AM";


         else if (i.equals("6.5")) mytime = "6:30 AM";

         else if (i.equals("7")) mytime = "7:00 AM";


         else if (i.equals("7.5")) mytime = "7:30 AM";


         else if (i.equals("8")) mytime = "8:00 AM";


         else if (i.equals("8.5")) mytime = "8:30 AM";



         else if (i.equals("9")) mytime = "9:00 AM";


         else if (i.equals("9.5")) mytime = "9:30 AM";

         else if (i.equals("10")) mytime = "10:00 AM";


         else if (i.equals("10.5")) mytime = "10:30 AM";


         else if (i.equals("11")) mytime = "11:00 AM";


         else if (i.equals("11.5")) mytime = "11:30 AM";



         else if (i.equals("12")) mytime = "12:00 PM";


         else if (i.equals("12.5")) mytime = "12:30 PM";


          else if (i.equals("13")) mytime = "1:00 PM";


         else if (i.equals("13.5")) mytime = "1:30 AM";



         else if (i.equals("14")) mytime = "2:00 PM";


         else if (i.equals("14.5")) mytime = "2:30 PM";


          else if (i.equals("15")) mytime = "3:00 PM";


         else if (i.equals("15.5")) mytime = "3:30 PM";



         else if (i.equals("16")) mytime = "4:00 PM";


         else if (i.equals("16.5")) mytime = "4:30 PM";


          else if (i.equals("17")) mytime = "5:00 PM";


         else if (i.equals("17.5")) mytime = "5:30 PM";



         else if (i.equals("18")) mytime = "6:00 PM";


         else if (i.equals("18.5")) mytime = "6:30 PM";


          else if (i.equals("19")) mytime = "7:00 PM";


         else if (i.equals("19.5")) mytime = "7:30 PM";



         else if (i.equals("20")) mytime = "8:00 PM";


         else if (i.equals("20.5")) mytime = "8:30 PM";

         else if (i.equals("21")) mytime = "9:00 PM";


         else if (i.equals("21.5")) mytime = "9:30 PM";



         else if (i.equals("22")) mytime = "10:00 PM";


         else if (i.equals("22.5")) mytime = "10:30 PM";


         else if (i.equals("23")) mytime = "11:00 PM";


         else if (i.equals("23.5")) mytime = "11:30 PM";


      else {
          mytime = "8:00 PM";
      }


return mytime;
}

%>

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

       String drinker = request.getParameter("drinker");
       String order = request.getParameter("order");


        String str = "SELECT * FROM watches w JOIN frequents f WHERE w.name = f.drinker AND f.bar = '"+ barName+ "' ORDER BY frequency asc";
        out.print(str);

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

         out.print("<td>");
        //print out column header
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
            out.print(result.getString("name"));
            out.print("</td>");

             out.print("<td>");
            out.print(getTime(result.getString("time")));
            out.print("</td>");

             out.print("<td>");
            out.print((result.getString("day")));
            out.print("</td>");

             out.print("<td>");
            out.print(result.getString("channel"));
            out.print("</td>");

             out.print("<td>");
            out.print(result.getString("frequency"));
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