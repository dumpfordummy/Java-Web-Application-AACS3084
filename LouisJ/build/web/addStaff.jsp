<%-- 
    Document   : addStaff
    Created on : May 1, 2023, 12:30:28 AM
    Author     : Wai Loc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Louis J - Add Staff</title>
        <%@include file="navbar.jsp" %> 
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <form>
            <h4 style="margin: 20px 10px 10px 20px;">Staff Details</h4>
            <div class="card card-solid p-3 mx-auto mt-3 mb-3" style="width: 90%; background-color: #f7c188;">
                <div class="form-group row justify-content-around mb-3">
                    <div class="col-6">
                        <label>First Name</label>
                        <input type="text" class="col-12 form-control" name="StaffFName" autocomplete = "off" />
                    </div>
                    <div class="col-6">
                        <label>Last Name</label>
                        <input type="text" class="col-12 form-control" name="StaffLName" autocomplete = "off" />
                    </div>
                </div>
                <div class="form-group row justify-content-around my-3">
                    <div class="col-6">
                        <label>Email</label>
                        <input type="text" class="col-12 form-control" name="StaffEmail" autocomplete = "off" />
                    </div>
                    <div class="col-6">
                        <label>ContactNo</label>
                        <input type="text" class="col-12 form-control" name="StaffContactNo" autocomplete = "off" />                    
                    </div>
                </div>
                <div class="form-group row justify-content-around my-3">
                    <div class="col-6">
                        <label>Password</label>
                        <div class="input-group">
                            <input type="password" class="col-12 form-control" name="StaffPassword" autocomplete = "off" />
                        </div>
                    </div>
                    <div class="col-6">
                        <label>Confirm Password</label>
                        <div class="input-group">
                            <input type="password" class="col-12 form-control" name="StaffConPassword" autocomplete = "off" />
                        </div>

                    </div>
                </div>
            </div>

            <div class="row" style="margin: 20px;">
                <div class="col-1" style="width: fit-content; margin-right: 5px;">
                    <button type="submit" class="btn btn-success col-12">Create</button>
                </div>
                <div style="width: fit-content">
                    <a href="staffList.jsp" class="btn btn-danger col-12">Back to List</a>
                </div>
            </div>
        </form>
        
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
