<%@ page language="java" contentType="text/html; charset=ISO-8859-1 " import="com.db_project.pkg.*"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BarManager</title>
  <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">


  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.8.23/jquery-ui.js"></script>


  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <!-- =======================================================
    Theme Name: Medilab
    Theme URL: https://bootstrapmade.com/medilab-free-medical-bootstrap-theme/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<!--banner-->
<section id="banner" class="banner">
  <div class="bg-color">
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="col-md-12">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="img/logo.png" class="img-responsive" style="width: 140px; margin-top: -16px;"></a>
          </div>
          <div class="collapse navbar-collapse navbar-right" id="myNavbar">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#banner">Login</a></li>
              <li class=""><a href="#about">About</a></li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
    <div class="container">
      <div class="row">
        <div class="banner-info">
          <div class="banner-logo text-center">
            <img src="img/logo.png" class="img-responsive">
          </div>
          <div class="banner-text text-center">
            <h1 class="white">Making your bar make business!</h1>

            <form method="post" action="barhome.jsp">

              <%
                try {
                  //Get the database connection
                  ApplicationDB db = new ApplicationDB();
                  Connection con = db.getConnection();

                  //Create a SQL statement
                  Statement stmt = con.createStatement();

                  String entity = request.getParameter("command");

                  String str = "SELECT * FROM bars";
                  //Run the query against the database.
                  ResultSet rs = stmt.executeQuery(str);
              %>
              <h2 class = "white"> Bar Login </h2>
              <br>

                <select name = "bar" style = "
                        font-family: 'Candal', sans-serif;
                        background: border-box;
                        text-align-last: center;
                        width: 70%;
                        -webkit-box-align: center;
                ">

                  <%
                    while(rs.next())
                    {
                      String fname = rs.getString("name");
                  %>

                  <option value="<%=fname %>"><%=fname %></option>

                  <%
                    }

                  %>

                </select>

              <%
                }
                catch (Exception e) {
                  out.print(e);
                }

              %>
              <br>
              <input type="submit" value="Submit" class="btn btn-appoint">
            </form>
          </div>
          <div class="overlay-detail text-center">
            <a href="#service"><i class="fa fa-angle-down"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="about" class="section-padding">
  <div class="container">
    <div class="row">
      <div class="col-md-3 col-sm-4 col-xs-12">
        <div class="section-title">
          <h2 class="head-title lg-line">The BarManager+ <br>Ultimate Dream</h2>
          <hr class="botm-line">
          <p class="sec-para">The team at BarManager+ has only one mission, and that is to have you understand your bar, your beers, and your drinkers.</p>
        </div>
      </div>
      <div class="col-md-9 col-sm-8 col-xs-12">
        <div style="visibility: visible;" class="col-sm-9 more-features-box">
          <div class="more-features-box-text">
            <div class="more-features-box-text-icon"> <i class="fa fa-angle-right" aria-hidden="true"></i> </div>
            <div class="more-features-box-text-description">
              <h3>See the important things</h3>
              <p>BarManger+ gives users multiple kinds information requests to get different, useful information about their bar and customers to maximize customer acquisition and service</p>
            </div>
          </div>
          <div class="more-features-box-text">
            <div class="more-features-box-text-icon"> <i class="fa fa-angle-right" aria-hidden="true"></i> </div>
            <div class="more-features-box-text-description">
              <h3>Quality Matters</h3>
              <p>Just like in the bar business, quality matters. We are dedicated to having the highest quality website with clean and simple interface</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="cta-2" class="section-padding">
  <div class="container">
    <div class=" row">
      <div class="col-md-2"></div>
      <div class="text-right-md col-md-4 col-sm-4">
        <h2 class="section-title white lg-line">Don't Wait<br>Start Managing Your Bar Now</h2>
      </div>
      <div class="col-md-4 col-sm-5">
"Quality is the best business plan" <p class="text-right text-primary"><i>John Lasseter</i></p>
      </div>
      <div class="col-md-2"></div>
    </div>
  </div>
</section>

<footer id="footer">

  <div class="footer-line">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          © Copyright Medilab Theme. All Rights Reserved
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Medilab
            -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade.com</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
<!--/ footer-->

<!--
<script src="js/jquery.min.js"></script>-->

<script src="js/jquery.easing.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>
<script src="contactform/contactform.js"></script>

</body>

</html>