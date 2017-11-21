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
    <title>Beers</title>
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
    <h1 align="center">Beer Information</h1>
    <%
        String barName = request.getParameter("idJob");
        session.setAttribute("ob", barName);

        try {
            //Get the database connection
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();
            Connection con2 = db.getConnection();
            Connection con3 = db.getConnection();

            //Create a SQL statement
            Statement stmt = con.createStatement();
            Statement stmt2 = con2.createStatement();
            Statement stmt3 = con3.createStatement();

            String entity = request.getParameter("command");

            String str = "SELECT beer FROM sells WHERE bar = '"+barName+"'"+" ORDER BY beer";
            String str2 = "SELECT beer FROM sells WHERE bar = '"+barName+"'"+" ORDER BY beer";
            String str3 = "SELECT beer FROM sells WHERE bar = '"+barName+"'"+" ORDER BY beer";
            //Run the query against the database.
            ResultSet rs = stmt.executeQuery(str);
            ResultSet rs2 = stmt2.executeQuery(str2);
            ResultSet rs3 = stmt3.executeQuery(str3);

    %>

    <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <div class="card-body">
                    <h4 class="card-title" align="center">
                        Beers You Sell
                    </h4>

                    <p align="center">The Beers You Sell and Their Price</p>
                    <form method="post" action="beer_sells_query.jsp" align="center">
                        <table>

                            <p>Bar: <%=barName%>
                            </p>
                        </table>
                        <p style="float:left;margin-left:25px;">Order By: &nbsp
                            <select name="order" size=1>
                                <option value="ORDER BY beer">Alphabetical Order</option>
                                <option value="ORDER BY price ASC">Price Ascending</option>
                                <option value="ORDER BY price DESC">Price Descending</option>

                            </select>
                        </p>
                        <br>
                        <p style="float:left;margin-left:25px;">Manufacturer&nbsp
                            <select name="manu" size="1">
                                <option value="FALSE">No</option>
                                <option value="TRUE">Yes</option>
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
                        Who likes this beer?
                    </h4>

                    <p align="center">Find out which of your customers like a certain beer.</p>
                    <form method="post" action="who_likes_query.jsp" align="center">
                        <table>

                            <p>Bar: <%=barName%>
                            </p>
                        </table>
                        <p style="float:left;margin-left:25px;">Name:
                            <select name="beer" size=1>
                                <%
                                    while(rs.next())
                                    {
                                        String fname = rs.getString("beer");
                                %>

                                <option value="<%=fname %>"><%=fname %></option>

                                <%
                                    }

                                %>

                            </select>


                        </p>
                        <p style="float:left;margin-left:25px;">Order By:
                            <select name ="order" size =1>
                                <option value="ORDER BY rating ASC">Ascending rating</option>
                                <option value="ORDER BY rating DESC">Descending rating</option>
                                <option value="ORDER BY beer">Alphabetical Order</option>

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
                        Possible New Beers
                    </h4>

                    <p align="center">Beers You Don't Sell, but your customers like</p>
                    <form method="post" action="not_sell_beer.jsp" align="center">
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

    <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <div class="card-body">
                    <h4 class="card-title" align="center">
                        Update Your Beer Price!
                    </h4>


                    <form method="post" action="updatedBeer.jsp" align="center">


                            <p>Bar: <%=barName%></p>

                        <p style="float:left;margin-left:25px;">Beer:
                                <select name="beer2" size=1>
                                    <%
                                        while(rs2.next())
                                        {
                                            String fname = rs2.getString("beer");
                                    %>

                                    <option value="<%=fname %>"><%=fname %></option>

                                    <%
                                        }

                                    %>

                                </select>


                        </p>
                        <br>

                        <p style="float:left;margin-left:25px;">Price
                            <input type="text" name="price2"></td>
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
                        Add New Beers to Sell!
                    </h4>


                    <form method="post" action="newBeer.jsp" align="center">


                            <p>Bar: <%=barName%></p>

                        <p style="float:left;margin-left:25px;">Beer: <input type="text" name="beer1"></p>

                        <p style="float:left;margin-left:25px;">Price:<input type="text" name="price1"></p>

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
                        You want to stop selling a beer? Choose Below!
                    </h4>


                    <form method="post" action="deletedBeer.jsp" align="center">


                        <p>Bar: <%=barName%></p>

                        <p style="float:left;margin-left:25px;">Beer:
                            <select name="beer3" size=1>
                                <%
                                    while(rs3.next())
                                    {
                                        String fname = rs3.getString("beer");
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
        </div>

    </div>


</section>
</div>
</section>

</body>
</html>
