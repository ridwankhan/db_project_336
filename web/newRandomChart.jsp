<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
    <title>Pattern Information</title>
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

        <h2 class="ser-title">Pattern Information</h2>
        <hr class="botm-line">
        <p style="float:left;margin-left:25px;">Pattern Description: Our pattern involves biasing people's ages and the time they would watch TV. The pattern is:
            People between the ages of 65 and 90 only watch tv between 10 am and 8pm.
            People between the ages of 30 and 65 only watch tv between 8pm and 12 am.
            People between the ages of 21 and 30 only watch tv between 8pm and 3am.
            This is across all our drinkers in the database
        <div id="chart">

        </div>



            <%

        Gson gson = new Gson();


        //Get the database connection

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();


        //Make an insert statement for the Sells table:

         String insert="SELECT * FROM watches limit 30000";
         String message;





		//Create a Prepared SQL statement allowing you to introduce the parameters of the query

		PreparedStatement ps = con.prepareStatement(insert);
		ResultSet rs =ps.executeQuery();

		JSONObject dataSource = new JSONObject();

		JSONObject chartObject = new JSONObject();
		chartObject.put("caption", "Age vs Time Watching");
		chartObject.put("Charttopmargin","20");
		chartObject.put("yaxisname","Time (24 hour)");
		chartObject.put( "xaxisname", "Age (Years)");
		chartObject.put("showAlternateHGridColor", "0");
		chartObject.put( "yaxismaxvalue", "24");
		chartObject.put( "showlegend", "0");
		chartObject.put( "bgcolor", "#40526A");
		chartObject.put("bgAlpha", "100");
		chartObject.put("canvasbgAlpha", "0");
		chartObject.put("baseFontColor", "#F7F3E7");
		chartObject.put("divlineAlpha", "100");
		chartObject.put("divLineDashed","0");
		chartObject.put("ToolTipBgColor","#F37C7E");
		chartObject.put("rotateYAxisName", "1");
		chartObject.put("canvasBorderColor", "#ffffff");
		chartObject.put("canvasBorderThickness", ".5");
		chartObject.put("canvasBorderAlpha","100");
		chartObject.put("plotTooltext", "<div id='valueDiv'>Age : <b>$xDataValue</b>, Time : <b>$yDataValue</b></div>");





		dataSource.put("Chart",chartObject);

        JSONArray dataSetArray = new JSONArray();
       	JSONObject dataSetObject = new JSONObject();

       	dataSetObject.put("drawline", "0");
       	dataSetObject.put("color", "#6baa01");
       	dataSetObject.put("anchorradius", "4");
       	dataSetObject.put("anchorbgcolor", "#40526A");
       	dataSetObject.put("anchorBorderThickness", "3");
       	dataSetObject.put("anchorbordercolor", "#F37C7E");


       	JSONArray dataArray = new JSONArray();
//       	JSONObject dataObject = new JSONObject();
//       	JSONObject dataObject2 = new JSONObject();


       	while(rs.next()) {
                JSONObject dataObject = new JSONObject();
                dataObject.put("id","tk01");
                dataObject.put("x",rs.getString("age"));
                dataObject.put("y",rs.getString("time"));

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

       	dataSetObject.put("data",dataArray);
       	dataSetArray.add(dataSetObject);
       	dataSource.put("dataset",dataSetArray);










		message = dataSource.toString();
		message = message.replaceAll("\"", "\\\\\"");
		//out.print(message);

		/*

         FusionCharts column2DChart= new FusionCharts(
	"ZoomScatter",// chartType
	"chart1",// chartId
	"600", //   chartWidth
	"400",//    chartHeight
	"chart",//  chartContainer
	"json",//   dataFormat
    "{\"chart\": {\"caption\": \"Customer Happiness by Response time\",\"Charttopmargin\": \"20\"," +
     "\"yaxisname\": \"Customer Happiness\"," +
      "\"xaxisname\": \"Time to respond (in minutes)\"," +
       "\"showAlternateHGridColor\": \"0\",\"yaxismaxvalue\": \"9\", " +
        "\"showlegend\": \"0\",\"bgcolor\": \"#40526A\", " +
         "\"bgAlpha\": \"100\", " +
          "\"canvasbgAlpha\": \"0\"," +
           " \"baseFontColor\": \"#F7F3E7\", \"divlineAlpha\": \"100\"," +
            "\"divLineDashed\": \"0\"," +
             "\"ToolTipBgColor\": \"#F37C7E\"," +
              "\"rotateYAxisName\": \"1\"," +
               "\"canvasBorderColor\": \"#ffffff\", " +
                "\"canvasBorderThickness\": \".5\"," +
                 "\"canvasBorderAlpha\": \"100\"," +
                  "\"plotTooltext\": \"<div id='valueDiv'>Response time : <b>$xDataValue</b>, " +
                   "Satisfaction : <b>$yDataValue</b></div>\"}," +
                    "\"dataset\": [{\"drawline\": \"0\",\"color\": \"#6baa01\"," +
                     "\"anchorradius\": \"4\", " +
                      "\"anchorbgcolor\": \"#40526A\"," +
                       "\"anchorBorderThickness\": \"3\"," +
                        "\"anchorbordercolor\": \"#F37C7E\"," +
                         "\"data\": [{\"id\": \"tkt01\"," +
                          "\"x\": \"5\"," +
                           "\"y\": \"7.8\"}, " +
                            "{\"id\": \"tkt02\"," +
                             "\"x\": \"7\"," +
                              "\"y\": \"8.45\"}, {\"id\": \"tkt70\"," +
                               "\"x\": \"5\"," +
                                "\"y\": \"7.033\"" +
                                 "}]" +
                                  "}]}"

);


*/



         FusionCharts column2DChart= new FusionCharts(
	"ZoomScatter",// chartType
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