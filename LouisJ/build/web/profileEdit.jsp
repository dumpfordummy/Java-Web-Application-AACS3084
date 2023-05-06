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
        <style>
            .emp-profile{
                padding: 3%;
                margin-top: 3%;
                margin-bottom: 3%;
                border-radius: 0.5rem;
            }
            .profile-img{
                text-align: center;
            }
            .profile-img img{
                width: 70%;
                height: 100%;
            }
            .profile-img .file {
                position: relative;
                overflow: hidden;
                margin-top: -20%;
                width: 70%;
                border: none;
                border-radius: 0;
                font-size: 15px;
                /*    background: #212529;*/
            }
            .profile-img .file input {
                position: absolute;
                opacity: 0;
                right: 0;
                top: 0;
            }
            .profile-head h5{
                color: #333;
            }
            .profile-head h6{
                color: #0062cc;
            }
            .profile-edit-btn{
                border: none;
                border-radius: 1.5rem;
                width: 70%;
                padding: 2%;
                font-weight: 600;
                /*    color: #6c757d;*/
                cursor: pointer;
            }
            .proile-rating{
                font-size: 12px;
                /*    color: #818182;*/
                margin-top: 5%;
            }
            .proile-rating span{
                color: #495057;
                font-size: 15px;
                font-weight: 600;
            }
            .profile-head .nav-tabs{
                margin-bottom:5%;
            }
            .profile-head .nav-tabs .nav-link{
                font-weight:600;
                border: none;
            }
            .profile-head .nav-tabs .nav-link.active{
                border: none;
                border-bottom:2px solid #0062cc;
            }
            .profile-work{
                padding: 14%;
                margin-top: -15%;
            }
            .profile-work p,.profile-work input{
                font-size: 12px;
                /*    color: #818182;*/
                font-weight: 600;
                margin-top: 10%;
            }

            .profile-work ul{
                list-style: none;
            }
            .profile-tab label{
                font-weight: 600;
            }
            .profile-tab p, .profile-tab input{
                font-weight: 600;
                /*    color: #0062cc;*/
            }

        </style>
    </head>
    <body>
        <%
            User currentUser = (User) request.getAttribute("user");
            if (currentUser == null) {
                userSession = new UserSessionUtil(request.getSession());
                currentUser = userSession.getCurrentLoginUser(request.getCookies());
            }
        %>

        <div class="container emp-profile">
            <form action="/profile/edit/<%= currentUser.getUsertype()%>/<%= currentUser.getId()%>" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="/image/<%= currentUser.getUsertype()%>/<%= currentUser.getId()%>"/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                            <h5>
                                <%= currentUser.getUsername()%>
                            </h5>
                            <h6>
                                <%= currentUser.getUsertype()%>
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
                                        <input type="text" id="userid" name="userid" value="<%= currentUser.getId()%>" disabled>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="username">Username</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="username" name="username" value="<%= currentUser.getUsername()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="fullname">Fullname</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="fullname" name="fullname" value="<%= currentUser.getFullname()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="email">Email</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="email" name="email" value="<%= currentUser.getEmail()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="contact">Contact</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="contact" name="contact" value="<%= currentUser.getContact()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="address">Address</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="address" name="address" value="<%= currentUser.getAddress()%>">
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
