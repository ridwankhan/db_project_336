<%--
  Created by IntelliJ IDEA.
  User: ridwankhan
  Date: 11/14/17
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Drinkers</title>
    <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
    <meta name="keywords"
          content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">


    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.8.23/jquery-ui.js"></script>


    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<br>


    <nav class="navbar navbar-default navbar-fixed-top" style ="background-color: #0CB8B6">
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
                        <li class="active"><a href="#banner">Home</a></li>
                        <li class=""><a href="#service">Services</a></li>
                        <li class=""><a href="#about">About</a></li>
                        <li class=""><a href="#testimonial">Testimonial</a></li>
                        <li class=""><a href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <br>
    <br>
    <br>

<section align="center">
    <div class = "container" align="center">
        <h1 class="ser-title">Drinkers</h1>
        <br>
        <p>Learn about your customers</p>
        <hr class="botm-line">

        <section align="center">
            <h1>Drinker Information</h1>
            <p>Get Information About All Your Drinkers</p>
            <form method="post" action="drinker_detail_query.jsp">
                <table align = "center">
                    <tr>
                        <td>Bar</td>
                        <td><input type="text" name="bar"></td>
                    </tr>
                </table>
                <p>Order By: </p>
                <select name="order" size=1>
                    <option value="ORDER BY frequency ASC">Ascending Frequency</option>
                    <option value="ORDER BY frequency DESC">Descending Frequency</option>
                    <option value="ORDER BY drinker">Alphabetical Order</option>
                </select>&nbsp; <br><br>
                <p>Detailed Info?</p>
                <select name="dets" size="1">
                    <option value="TRUE">Yes</option>
                    <option value="FALSE">No</option>
                </select>
                <br>
                <input type="submit" value="Submit">
                <br>

            </form>

        </section>
    </div>
</section>

</body>
</html>
