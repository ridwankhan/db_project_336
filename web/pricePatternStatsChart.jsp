\<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
          pageEncoding="ISO-8859-1" import="com.db_project.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="com.google.gson.*" %>
<%@page import="org.json.simple.*" %>
<%@page import="fusion.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Price Pattern Statistics</title>
    <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
    <meta name="keywords"
          content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript" src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
</head>
<body>
<section id="service" class="section-padding">
    <div class="container" align='center'>

        <h2 class="ser-title">Price Pattern Statistics</h2>
        <hr class="botm-line">
        <p style="float:left;margin-left:25px;">Pattern Description: It can be seen, as capacity increases the price of a given beer decreases indicating that the larger sized bars sell beers for a cheaper price.
        <div id="chart">

        </div>



            <%

        String beer = request.getParameter("beer4");


        //Get the database connection

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();


        //Make an insert statement for the Sells table:
         String insert = "SELECT capacity, price FROM sells s JOIN bars b WHERE s.bar = b.name AND beer = '"+beer+"' ORDER BY capacity ";

         String message;





		//Create a Prepared SQL statement allowing you to introduce the parameters of the query

		PreparedStatement ps = con.prepareStatement(insert);
		ResultSet rs =ps.executeQuery();

		JSONObject dataSource = new JSONObject();

		JSONObject chartObject = new JSONObject();
		chartObject.put("caption", "Price Vs. Capacity");
        //chartObject.put("subcaption", "Jan 2008 - April 2016");
        chartObject.put("yaxisname", "Price of selected beer");
        chartObject.put("xaxisname", "Capacity of bar");
        chartObject.put("captionpadding", "20");
        chartObject.put("showvalues", "0");
        chartObject.put("plotgradientcolor", "");
        chartObject.put("divlinealpha", "50");
        chartObject.put("formatnumberscale", "1");
        //chartObject.put("defaultnumberscale", "hrs");
       // chartObject.put("numberscalevalue", "24,31,12");
        //chartObject.put("numberscaleunit", " days, months, years");
        chartObject.put("plottooltext", "Capacity : $labelPrice : $value ");
        chartObject.put("theme", "zune");



        dataSource.put("Chart",chartObject);



       	JSONArray dataArray = new JSONArray();
//       	JSONObject dataObject = new JSONObject();
//       	JSONObject dataObject2 = new JSONObject();


       	while(rs.next()) {
                JSONObject dataObject = new JSONObject();
                dataObject.put("label",rs.getString("capacity"));
                dataObject.put("value",rs.getString("price"));

                dataArray.add(dataObject);
            }

        rs.close();
//       	dataObject.put("id", "tkt01");
//       	dataObject.put("x", "5");
//       	dataObject.put( "y","7.8");
//       	dataArray.add(dataObject);
//       	dataObject2.put("id", "tkt02");
//       	dataObject2.put("x", "4");
//       	dataObject2.put( "y","7.8");
//       	dataArray.add(dataObject2);


       	dataSource.put("data",dataArray);










		message = dataSource.toString();
		message = message.replaceAll("\"", "\\\\\"");
		//out.print(message);



         FusionCharts column2DChart= new FusionCharts(
	"column2d",// chartType
	"chart1",// chartId
	"800", //   chartWidth
	"550",//    chartHeight
	"chart",//  chartContainer
	"json",//   dataFormat
    message

);


        con.close();



%>

            <%=column2DChart.render()%>


</section>

</body>
</html>