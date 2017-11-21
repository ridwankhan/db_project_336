<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" import="com.db_project.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Potential Customers</title>
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

		<h2 class="ser-title">Update Information</h2>
		<hr class="botm-line">


			<%
                float newPrice = Float.valueOf(request.getParameter("price1"));
				String newBeer = request.getParameter("beer1");
				String barName = (String) session.getAttribute("ob");

				if(newPrice<1.6 || newPrice >7.5)
				    {
				        out.print("The price inserted is not valid. The price has to be in the range of $1.6 and $7.5" +
				         " (inclusive)");
				    }

				 else
				     {
%>
			<%
    List<String> list = new ArrayList<String>();

    try {

        //Get the database connection

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        //Create a SQL statement
        Statement stmt = con.createStatement();


        //Make an insert statement for the Sells table:
		String insert = "INSERT INTO sells(bar, beer, price)"
				+ "VALUES (?, ?, ?)";



		//Create a Prepared SQL statement allowing you to introduce the parameters of the query

		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, barName);
		ps.setString(2, newBeer);
		ps.setFloat(3, newPrice);


		//Run the query against the DB

		ps.executeUpdate();

		out.print("<br>");
		out.print("The Insertion was Successful!");
		out.print("<br>");
		out.print("You now sell " + newBeer + " for $" + newPrice);
		out.print("<br>");

        //close the connection.
        con.close();

    } catch (Exception e) {
        out.print("<br>");
        out.print("The Insertion was Unsuccessful");
    }
    }

%>
</section>

</body>
</html>