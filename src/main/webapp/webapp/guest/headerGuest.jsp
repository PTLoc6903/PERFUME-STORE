<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link rel="stylesheet" href="css/Gheader.css" scoped>

        <title>Menu</title>
        <style>
            body{
                background-image: url('/backgroundloginguest.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
        </style>
    </head>



    <body>
        <div id="wrapper">
            <header>
                <div class="inner-header container">
                    <img src="../img/logologin.jpg" style="width: 120px; border-radius: 50%"
                         alt="logo Perfume Store">             
                    <a href="" id="logo" style="font-size: 30px">
                        <div class="Campus">
                            Perfume
                        </div>
                        <div style="color: #FFFFFF">
                            Store
                        </div>
                    </a>
                    <nav>
                        <ul id="main-menu">
                            <li><a href="/guest/homeGuest" style="color: red; font-size: 25px">Home</a></li>
                            <li><a href="/guest/menuGuest"style="color: red; font-size: 25px">Menu</a></li>
                            <li><a href="/guest/aboutUsGuest"style="color: red; font-size: 25px">About Us</a></li>
                            <li><a href="/guest/loginGuest"style="color: red; font-size: 25px"> Login</a>

                            </li>
                        </ul>
                    </nav>
                </div>
            </header>
        </div>

        <!-- End of Main Content -->
    </body>
    <script src="index.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('sticky');
                } else {
                    $('header').removeClass('sticky');
                }
            });
        });
    </script>

</html>