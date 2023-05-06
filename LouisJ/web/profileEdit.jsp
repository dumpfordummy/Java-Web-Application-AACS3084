<%-- 
    Document   : profileEdit
    Created on : Apr 29, 2023, 12:23:18 AM
    Author     : CY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Employee"%>
<%@page import="util.UserSessionUtil"%>
<%@page import="interfaces.User"%>
<%@page import="model.Customer"%>
<%@page import="model.CustomerService"%>

<%! UserSessionUtil userSession;%>             
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %> 
        <link rel="stylesheet" href="styling/profile.css"/>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
            if (user == null) {
                userSession = new UserSessionUtil(request.getSession());
                user = userSession.getCurrentLoginUser(request.getCookies());
            }
        %>

        <div class="container emp-profile">
            <form action="/profile/edit/<%= user.getUsertype()%>/<%= user.getId()%>" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="/image/<%= user.getUsertype()%>/<%= user.getId()%>"/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                            <h5>
                                <%= user.getUsername()%>
                            </h5>
                            <h6>
                                <%= user.getUsertype()%>
                            </h6>
                            <br>
                            <br>
                            <br>
                            <br>
                            <hr>
                        </div>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>User Id</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><%= user.getId()%></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="username">Username</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="username" name="username" value="<%= user.getUsername()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="fullname">Fullname</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="fullname" name="fullname" value="<%= user.getFullname()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="email">Email</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="email" name="email" value="<%= user.getEmail()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="contact">Contact</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="contact" name="contact" value="<%= user.getContact()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="address">Address</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="address" name="address" value="<%= user.getAddress()%>">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="profileImg">Profile Image</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="file" name="profileImg">
                                    </div>
                                </div>    

                                <input type="submit" value="Confirm">    
                            </div>
                        </div>
                    </div>
                </div>
            </form>           
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
