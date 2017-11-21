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
    <title>Advertisement</title>
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
    <h1 align="center">Advertisement Information</h1>
    <p align ="center">
    <%
        String barName = request.getParameter("idJob");
        session.setAttribute("ob", barName);


        out.print(barName);
        out.print("</p>");



        try {
            //Get the database connection
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();

            //Create a SQL statement
            Statement stmt = con.createStatement();

            String entity = request.getParameter("command");

            String str = "SELECT channel FROM channels ";
            //Run the query against the database.
            ResultSet rs = stmt.executeQuery(str);

            Connection con2 = db.getConnection();
            String str2 = "SELECT drinker FROM frequents WHERE bar = '"+barName+"'";
            //out.print(str2);

            Statement stmt2 = con2.createStatement();

            ResultSet rs2 = stmt2.executeQuery(str2);

    %>

    <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <div class="card-body">
                    <h4 class="card-title" align="center">
                        Who will see my advertisement?
                    </h4>

                    <p align="center">Given a starting time slot (11:30 means 11:30 - 12), day of week, and channel, see which of your drinkers will see your advertisement.</p>
                    <form method="post" action="whos_watching_query.jsp" align="center">
                        <table>

                            <%--<p>Bar: <%=barName%>--%>
                            <%--</p>--%>
                        </table>
                        <p style="float:left;margin-left:25px;">Time: &nbsp
                            <select name="time" size=1>
                                <option value=0.0>12:00 AM</option>
                                <option value=0.5>12:30 AM</option>
                                <option value=1.0>1:00 AM</option>
                                <option value=1.5>1:30 AM</option>
                                <option value=2.0>2:00 AM</option>
                                <option value=2.5>2:30 AM</option>
                                <option value=3.0>3:00 AM</option>
                                <option value=3.5>3:30 AM</option>
                                <option value=4.0>4:00 AM</option>
                                <option value=4.5>4:30 AM</option>
                                <option value=5.0>5:00 AM</option>
                                <option value=5.5>5:30 AM</option>
                                <option value=6.0>6:00 AM</option>
                                <option value=6.5>6:30 AM</option>
                                <option value=7.0>7:00 AM</option>
                                <option value=7.5>7:30 AM</option>
                                <option value=8.0>8:00 AM</option>
                                <option value=8.5>8:30 AM</option>
                                <option value=9.0>9:00 AM</option>
                                <option value=9.5>9:30 AM</option>
                                <option value=10.0>10:00 AM</option>
                                <option value=10.5>10:30 AM</option>
                                <option value=11.0>11:00 AM</option>
                                <option value=11.5>11:30 AM</option>
                                <option value=12.0>12:00 PM</option>
                                <option value=12.5>12:30 PM</option>
                                <option value=13.0>1:00 PM</option>
                                <option value=13.5>1:30 PM</option>
                                <option value=14.0>2:00 PM</option>
                                <option value=14.5>2:30 PM</option>
                                <option value=15.0>3:00 PM</option>
                                <option value=15.5>3:30 PM</option>
                                <option value=16.0>4:00 PM</option>
                                <option value=16.5>4:30 PM</option>
                                <option value=17.0>5:00 PM</option>
                                <option value=17.5>5:30 PM</option>
                                <option value=18.0>6:00 PM</option>
                                <option value=18.5>6:30 PM</option>
                                <option value=19.0>7:00 PM</option>
                                <option value=19.5>7:30 PM</option>
                                <option value=20.0>8:00 PM</option>
                                <option value=20.5>8:30 PM</option>
                                <option value=21.0>9:00 PM</option>
                                <option value=21.5>9:30 PM</option>
                                <option value=22.0>10:00 PM</option>
                                <option value=22.5>10:30 PM</option>
                                <option value=23.0>11:00 PM</option>
                                <option value=23.5>11:30 PM</option>

                            </select>
                        </p>
                        <br>
                        <br>
                        <p style="float:left;margin-left:25px;">Day of Week&nbsp
                            <select name="day" size="1">
                                <option value="Sunday">Sunday</option>
                                <option value="Monday">Monday</option>
                                <option value="Tuesday">Tuesday</option>
                                <option value="Wednesday">Wednesday</option>
                                <option value="Thursday">Thursday</option>
                                <option value="Friday">Friday</option>
                                <option value="Saturday">Saturday</option>
                            </select>
                        </p>
                        <p style="float:left;margin-left:25px;">Channel:
                            <select name="channel" size=1>
                                <%
                                    while(rs.next())
                                    {
                                        String fname = rs.getString("channel");
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
                        <input type="submit" value="Submit" class="btn btn-appoint" style="float: left; margin-left:25px">
                        <br>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">

                <div class="card-body">
                    <h4 class="card-title" align="center">
                        How to advertise to a certain customer
                    </h4>

                    <p align="center">Get when and what channel a specfic drinker of yours watches</p>
                    <form method="post" action="drinker_watches_query.jsp" align="center">
                        <table>

                            <%--<p>Bar: <%=barName%>--%>
                            <%--</p>--%>
                        </table>
                        <p style="float:left;margin-left:25px;">Name:
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
                        <p style="float:left;margin-left:25px;">Order By:
                            <select name ="order" size =1>

                                <option value="ORDER BY channel">Channel</option>
                                <option value="ORDER BY day">Day</option>
                                <option value="ORDER BY time">Time</option>


                            </select>
                        </p>

                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <input type="submit" value="Submit"  class="btn btn-appoint" style="float: left; margin-left:25px">
                        <br>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">

                <div class="card-body">
                    <h4 class="card-title" align="center">
                        Let's Get Them Coming
                    </h4>

                    <p align="center">Drinkers that haven't been coming often and you want to advertise to them</p>
                    <form method="post" action="infrequent_watches_query.jsp" align="center">
                        <table>

                            <%--<p>Bar: <%=barName%>--%>
                            <%--</p>--%>
                        </table>

                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <input type="submit" value="Submit" class="btn btn-appoint" style="float: left; margin-left:25px">
                        <br>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">

                <div class="card-body">
                    <h4 class="card-title" align="center">
                        Let's get new people here
                    </h4>

                    <p align="center">Drinkers in the same state as your bar, but need you to grab their attention so they become your customer</p>
                    <form method="post" action="noncustomer_watches_query.jsp" align="center">
                        <table>

                            <%--<p>Bar: <%=barName%>--%>
                            <%--</p>--%>
                        </table>


                        <br>
                        <br>
                        <input type="submit" value="Submit" class="btn btn-appoint" style="float: left; margin-left:25px">
                        <br>
                    </form>
                </div>
            </div>

        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">

                <div class="card-body">
                    <h4 class="card-title" align="center">
                        Patterns
                    </h4>

                    <p align="center">Click below to see the Time vs. Age graph</p>
                    <form method="post" action="newRandomChart.jsp" align="center">
                        <table>
                            <%--<p>Bar: <%=barName%>--%>
                            <%--</p>--%>
                        </table>

                        <br>
                        <br>
                        <br>
                        <br>


                        <input type="submit" value="Submit" class="btn btn-appoint" style="float: left; margin-left:25px">
                        <br>
                    </form>
                </div>
            </div>

        </div>

    </div>


</section>
</div>
</section>

</body>
</html>
