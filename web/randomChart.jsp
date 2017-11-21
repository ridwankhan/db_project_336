<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.db_project.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="com.google.gson.*" %>
<%@page import="fusion.*" %>

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
    <script type="text/javascript" src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
</head>
<body>
<section id="service" class="section-padding">
    <div class="container" align='center'>

        <h2 class="ser-title">Update Information</h2>
        <hr class="botm-line">

        <div id="chart">

        </div>



            <%

        Gson gson = new Gson();


        //Get the database connection

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();


        //Make an insert statement for the Sells table:

         String insert="SELECT * FROM bars";




		//Create a Prepared SQL statement allowing you to introduce the parameters of the query

		PreparedStatement ps = con.prepareStatement(insert);
		ResultSet rs =ps.executeQuery();

		Map<String, String> chart = new HashMap<String, String>();

		chart.put("caption", "Top 10 Most Populous Countries");
        chart.put("showValues", "0");
        chart.put("theme", "zune");

        ArrayList data = new ArrayList();
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself


		 while(rs.next()) {
                Map<String, String> lv = new HashMap<String, String>();
                lv.put("label", rs.getString("name"));
                lv.put("value", rs.getString("zip"));
                data.add(lv);
            }

        rs.close();
		//Run the query against the DB

        Map<String, String> dataMap = new LinkedHashMap<String, String>();

         dataMap.put("chart", gson.toJson(chart));
         dataMap.put("data", gson.toJson(data));


         FusionCharts columnChart= new FusionCharts(
                        //type of chart
            			"column2d",
                        //unique chart ID
                        "chart1",
                        //width and height of the chart
                        "500","300",
                        //div ID of the chart container
                        "chart",
                        //data format
                        "json",
                        //data source
                        gson.toJson(dataMap)
                    );



        con.close();



%>

            <%=columnChart.render()%>


</section>

</body>
</html>