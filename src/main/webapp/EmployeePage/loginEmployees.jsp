<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/EmployeePage/css/Elogin.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="style.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Perfume Store - Employee Login</title>
        <style>
            body {
                background-image: url('/img/login.jpg');
                background-size: cover;
                background-position: center;
                margin: 0;
                font-family: 'Poppins', sans-serif;
                color: white;
            }
            .box {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }
            .container {
                padding: 30px;
                width: 350px;
                border-radius: 15px;
            }
            .top-header header {
                font-size: 30px;
                text-align: center;
                margin-bottom: 20px;
            }
            .input-field {
                position: relative;
                margin-bottom: 20px;
                width: 100%;
            }
            .input {
                width: 100%;
                height: 45px;
                border: none;
                outline: none;
                border-radius: 30px;
                color: #333;
                padding-left: 40px;
                background: #f0f0f0;
                font-family: 'Poppins', sans serif;
            }
            .input-field i {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #333;
            }
            .submit {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background: #ff7c7c;
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: background 0.3s;
            }
            .submit:hover {
                background: #f0f0f0;
            }
            .bottom {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 10px;
                color: black;
            }
            .bottom a {
                color: white;
                font-family: 'Poppins', sans serif;
                text-decoration: none;
                transition: color 0.3s;
            }
            .bottom a:hover {
                color: white;
            }
            .btnLogin button {
                color: black;
                text-align: center;
                font-size: 15px;
                border-radius: 30px;
                width: 111%;
                height: 45px;
                background: #f0f0f0;
                font-family: 'Poppins', sans serif;
            }
            .btnLogin button:hover {
               background: #f0f0f0; 
            }
        </style>
    </head>

    <body>
        <div class="box">
            <div class="container">
                <div class="top-header">
                    <header>LOGIN</header>
                </div>

                <!-- Display registration success message -->
                <%
                    String message = request.getParameter("message");
                    if ("success".equals(message)) {
                %>
                <div style="color: green; text-align: center; margin-bottom: 20px;">
                    Bạn đã đăng ký thành công
                </div>
                <%
                    }
                %>

                <!-- Login Form -->
                <form action="/employee" method="post" onsubmit="return validateForm()">
                    <div class="input-field">
                        <i class="bx bx-user" aria-label="User Icon"></i>
                        <input type="text" id="username" name="phone" class="input" placeholder="Enter your phone..." required>
                    </div>
                    <div class="input-field">
                        <i class="bx bx-lock-alt" aria-label="Password Icon"></i>
                        <input autocomplete="off" id="logpass" placeholder="Enter your password..." class="input" name="password" type="password" required>
                    </div>

                    <div class="bottom">
                        <div>
                            <input name="checkRememberMe" type="checkbox" id="rememberMe">
                            <label for="rememberMe" style="color: white; font-family: 'Poppins', sans serif;">Remember</label>
                        </div>
                        <div>
                            <a href="/employee/forgotPassEmployees" class="btn-link">Forgot your password?</a>
                        </div>
                    </div>

                    <!-- Display login error if any -->
                    <%
                        String invalid = (String) request.getAttribute("loginError");
                        if (invalid != null && !invalid.equals("")) {
                    %>
                    <div style="color: red; text-align: center; margin-top: 10px;">
                        The phone or password is incorrect!
                    </div>
                    <%
                        }
                    %>

                    <div class="btnLogin my-4" style="text-align: center; margin-top: 20px; ">
                        <button type="submit" name="btnLogin" value="login" class="submit">Login</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function validateForm() {
                const phone = document.getElementById('username').value;
                const password = document.getElementById('logpass').value;
                if (phone === "" || password === "") {
                    alert("Please fill out all fields.");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
