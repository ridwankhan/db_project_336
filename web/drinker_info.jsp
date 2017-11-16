<%--
  Created by IntelliJ IDEA.
  User: ridwankhan
  Date: 11/14/17
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1 " import="com.db_project.pkg.*"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
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


<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #0CB8B6">
    <div class="container">
        <div class="col-md-12">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="img/logo.png" class="img-responsive"
                                                      style="width: 140px; margin-top: -16px;"></a>
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

<section>
    <h1 align="center">Drinker Information</h1>
    <%
        String barName = request.getParameter("idJob");
        session.setAttribute("ob", barName);

        try {
            //Get the database connection
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();

            //Create a SQL statement
            Statement stmt = con.createStatement();

            String entity = request.getParameter("command");

            String str = "SELECT drinker FROM frequents WHERE bar = '"+barName+"'"+" ORDER BY drinker";
            //Run the query against the database.
            ResultSet rs = stmt.executeQuery(str);

    %>

    <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <div class="card-body">
                    <h4 class="card-title" align="center">
                        All Drinkers
                    </h4>

                    <p align="center">Get Information About All Your Drinkers</p>
                    <form method="post" action="drinker_detail_query.jsp" align="center">
                        <table>

                            <p>Bar: <%=barName%>
                            </p>
                        </table>
                        <p style="float:left;margin-left:25px;">Order By: &nbsp
                            <select name="order" size=1>
                                <option value="ORDER BY frequency ASC">Ascending Frequency</option>
                                <option value="ORDER BY frequency DESC">Descending Frequency</option>
                                <option value="ORDER BY drinker">Alphabetical Order</option>
                            </select>
                        </p>
                        <br>
                        <p style="float:left;margin-left:25px;">Detailed Info?&nbsp
                            <select name="dets" size="1">
                                <option value="TRUE">Yes</option>
                                <option value="FALSE">No</option>
                            </select>
                        </p>
                        <br>
                        <br>
                        <br>
                        <input type="submit" value="Submit" style="float: left; margin-left:25px">
                        <br>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">

                <div class="card-body">
                    <h4 class="card-title" align="center">
                        Specific Drinker
                    </h4>

                    <p align="center">Get the Information about a particular drinker, and what they like to drink</p>
                    <form method="post" action="specific_drinker_query.jsp" align="center">
                        <table>

                            <p>Bar: <%=barName%>
                            </p>
                        </table>
                        <p style="float:left;margin-left:25px;">Name:
                            <select name="drinker" size=1>
                                <%
                                    while(rs.next())
                                    {
                                        String fname = rs.getString("drinker");
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
                        </p>

                        <br>
                        <br>
                        <br>
                        <input type="submit" value="Submit" style="float: left; margin-left:25px">
                        <br>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">

                <div class="card-body">
                    <h4 class="card-title">
                        <a href="#">Project Three</a>
                    </h4>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error
                        quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure
                        perspiciatis mollitia recusandae vero vel quam!</p>
                </div>
            </div>
        </div>

    </div>
    <!-- /.row -->


</section>
</div>
</section>

</body>
</html>
