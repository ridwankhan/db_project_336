<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
    <nav class="navbar navbar-default navbar-fixed-top" style >
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
              <li class="active"><a href="./index.jsp">Login</a></li>
              <li class="active"><a href="#banner">Home</a></li>
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
            <%
                String entity = request.getParameter("bar");
                out.print("<h1 class = \"white\" >");
                out.print("Welcome " + entity);
                out.print("</h1>");
%>


            <p>Navigate to any of our feature pages</p>
            <a href="./drinker_info.jsp?idJob=<%=entity%>" class="btn btn-appoint">Drinkers</a>
            <a href="./beers_info.jsp?idJob=<%=entity%>" class="btn btn-appoint">Beers</a>
            <a href="./watches_info.jsp?idJob=<%=entity%>" class="btn btn-appoint">Advertising</a>
            <a href="./interested_info.jsp?idJob=<%=entity%>" class="btn btn-appoint">WingMan</a>

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
          <h2 class="head-title lg-line">Features</h2>
          <hr class="botm-line">
          <p class="sec-para">We have created a number of types of information requests you can make on each of the following pages.</p>
        </div>
      </div>
      <div class="col-md-9 col-sm-8 col-xs-12">
        <div style="visibility: visible;" class="col-sm-9 more-features-box">
          <div class="more-features-box-text">
            <div class="more-features-box-text-icon"> <i class="fa fa-angle-right" aria-hidden="true"></i> </div>
            <div class="more-features-box-text-description">
              <h3>Drinkers</h3>
              <p>Find out who your drinkers are, detailed information about them what beers they like, and even help getting potential customers.</p>
            </div>
          </div>
          <div class="more-features-box-text">
            <div class="more-features-box-text-icon"> <i class="fa fa-angle-right" aria-hidden="true"></i> </div>
            <div class="more-features-box-text-description">
              <h3>Beers</h3>
              <p>Find what beers you sell and what price, manufacturers of your beers, what beers a customer likes,
                beers you might want to start selling, and be able to update beer prices, add beers to sell, and stop selling some beers.</p>
            </div>
          </div>
          <div class="more-features-box-text">
            <div class="more-features-box-text-icon"> <i class="fa fa-angle-right" aria-hidden="true"></i> </div>
            <div class="more-features-box-text-description">
              <h3>Advertising</h3>
              <p>Manage your advertisements to TV channels by seeing when your customers are watching TV,
                and which customers to advertise to and when and what channel to advertise to potential customers.</p>
            </div>
          </div>
          <div class="more-features-box-text">
            <div class="more-features-box-text-icon"> <i class="fa fa-angle-right" aria-hidden="true"></i> </div>
            <div class="more-features-box-text-description">
              <h3>WingMan</h3>
              <p>At BarManager+, we believe we are all here for one reason, and that is to find someone to grab a beer with.
              That is why, with carefully recorded information about who people are interested, we allow bar owners to see who drinkers are interested in
              so that they can ultimately get people interested in each other into the bar.fir</p>
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
          � Copyright Medilab Theme. All Rights Reserved
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
<!--/ footer-->

<!--
<script src="js/jquery.min.js"></script>-->

<script src="js/jquery.easing.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>
<script src="contactform/contactform.js"></script>

</body>

</html>