<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfume Store</title>
        <link rel="stylesheet" href="/EmployeePage/css/EchangePassword.css"/>       
    </head>
    <body>
        <%@include file="/EmployeePage/headerEmployees.jsp" %>
        <div class="container-fluid" style="min-height: 100vh; padding-top: 100px;">
            <div class="title mx-auto my-5" style="color: white; background-color: #ff7c7c">Change Password</div>
            <form action="/employee" method="post" onsubmit="return validateForm()">
                <div class="customer-info mx-auto p-4 d-flex flex-column justify-content-center" style="border: none; background-color: rgba(0, 0, 0, 0.5); border-radius: 10px; color: white;">
                    <div class="form-group m-3">
                        <label for="txtOldPassword">Current Password</label>
                        <input required="" type="password" id="txtOldPassword" name="txtOldPassword" class="form-control">
                    </div>
                    <div class="form-group m-3">
                        <label for="txtNewPassword">New Password</label>
                        <input required="" type="password" id="txtNewPassword" name="txtNewPassword" class="form-control">
                    </div>
                    <div class="form-group m-3">
                        <label for="txtNewPassword1">Confirm New Password</label>
                        <input required="" type="password" id="txtNewPassword1" name="txtNewPassword1" class="form-control">
                    </div>
                    <%
                        try {
                            String result = (String) request.getAttribute("result");
                            if (!result.equals("")) {
                    %>
                    <div class="alert alert-info mt-3" role="alert"><%=result%></div>
                    <%
                            }
                        } catch (Exception e) {
                        }
                    %>
                </div>

                <div class="btnBack mx-auto my-5 d-flex">
                    <button type="submit" value="ChangePassword" name="btnChangePassword" class="btn btn-primary">Confirm</button>
                    <!--                    <a href="/employee/EorderList" class="btn btn-secondary ms-2">Order List</a>-->
                </div>
            </form>
        </div>

        <%@include file="/EmployeePage/footerEmployees.jsp" %>
        <script>
            function validateForm() {
                var newPassword = document.getElementsByName("txtNewPassword")[0].value;
                var confirmPassword = document.getElementsByName("txtNewPassword1")[0].value;
                if (newPassword != confirmPassword) {
                    alert("New Password and Confirm New Password must match");
                    return false;
                }
            }
        </script>
    </body>
</html>
