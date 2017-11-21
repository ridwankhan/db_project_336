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
    <title>WingMan</title>
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
                    <%--<li class="active"><a href="./index.jsp">Login</a></li>--%>
                </ul>
            </div>
        </div>
    </div>
</nav>
<br>
<br>
<br>

<section>
    <h1 align="center">Be the WingMan</h1>
    <%
        String barName = request.getParameter("idJob");
        session.setAttribute("ob", barName);

        try {
            //Get the database connection
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();
            Connection con2 = db.getConnection();

            //Create a SQL statement
            Statement stmt = con.createStatement();
            Statement stmt2 = con2.createStatement();

            String entity = request.getParameter("command");

            String str = "SELECT drinker FROM frequents WHERE bar = '"+barName+"'"+" ORDER BY drinker";
            //Run the query against the database.
            ResultSet rs = stmt.executeQuery(str);
            ResultSet rs2 = stmt2.executeQuery(str);

    %>

    <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <div class="card-body">
                    <h4 class="card-title" align="center">
                        Who's interested?
                    </h4>

                    <p align="center">Find drinkers interested in the customer that just entered your bar. Maybe they will want to stop by and have a talk and more importantly, a beer. This is great way to attract new and old customers</p>
                    <form method="post" action="interested_query.jsp" align="center">
                        <table>

                            <p>Bar: <%=barName%>
                            </p>
                        </table>
                        <p style="float:left;margin-left:25px;">Customer at Bar:
                        <select name="drinker" size=1>
                            <%
                                while(rs.next())
                                {
                                    String fname = rs.getString("drinker");
                            %>

                            <option value="<%=fname %>"><%=fname %></option>

                            <%
                                }
                                con.close();

                            %>

                        </select>


                        </p>

                        <br>

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
                        Interested in who?
                    </h4>

                    <p align="center">Find out who your customer is interested in. May the can get other drinkers to come into the bar.</p>
                    <form method="post" action="interest_who_query.jsp" align="center">
                        <table>

                            <p>Bar: <%=barName%>
                            </p>
                        </table>
                        <p style="float:left;margin-left:25px;">Customer:
                            <select name="drinker" size=1>
                                <%
                                    while(rs2.next())
                                    {
                                        String fname = rs2.getString("drinker");
                                %>

                                <option value="<%=fname %>"><%=fname %></option>

                                <%
                                    }
                                    con2.close();

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
                        Matches made in Bar Heaven
                    </h4>

                    <p align="center">Find two people interested in each other who frequent your bar. Call them both in, have them grab some beers and watch the magic unfold</p>
                    <form method="post" action="matches_query.jsp" align="center">
                        <table>

                            <p>Bar: <%=barName%>
                            </p>
                        </table>

                        <br>
                        <br>
                        <br>
                        <br>
                        <input type="submit" value="Submit" style="float: left; margin-left:25px">
                        <br>
                    </form>
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