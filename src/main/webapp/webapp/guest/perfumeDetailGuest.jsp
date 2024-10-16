
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link href="css/GperfumeDetail.css" rel="stylesheet" type="text/css"/>
        <title>PerfumeStore - Perfume Detail</title>
    </head>

    <body>
        <%@include file="headerGuest.jsp"%>
        <div style="margin-top:140px"></div>
        <div class="container">
            <!-- Main Content -->
            <main>
                <div class="header">

                    <div class="name-tittle">
                        Perfume Details
                    </div>

                </div>
                <!-- Perfume Detail -->
                <div class="main-perfume-details">
                    <div class="perfume-detail">
                        <div class="perfume-img">
                            <img src="${perfume.getImg()}" alt="">
                        </div>
                        <div class="perfume-edit">
                            <p style="margin-right: 5px; font-size: 50px; font-weight: 600; color: #C21010;">${perfume.getName()}</p>
                            <div class="price-section">
                                <p style="font-size: 25px; font-weight: 500;">Price:</p>
                                <c:choose>
                                    <c:when test="${perfume.getSale() == 0}">

                                        <p style="font-size: 25px; font-weight: 500;">${perfume.getRealPrice()}$</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p c style="font-size: 20px;" class="original-price">${perfume.getPrice()}$</p>
                                        <p style="font-size: 25px; font-weight: 500;">${perfume.getRealPrice()}$</p>
                                    </c:otherwise>
                                </c:choose>

                                <!--                                <p style="font-size: 20px;" class="original-price">23$</p>
                                                                <p style="font-size: 28px;">20$</p>-->
                            </div>
                            <div class="edit-quantity">
                                <box style="display: flex; align-items: center; margin: 20px;" class="quantity mt-2">
                                    <button style="font-weight: 1000; color: black;" class="btn btn-sub">-</button>
                                    <span style="margin-top: 30px;padding: 20px;" id="quantity" class="mx-2">1</span>
                                    <button style="font-weight: 600; color: black;" class="btn btn-plus">+</button>
                                </box>
                                <button onclick="addToCart()" style="margin-bottom: 80px; width: 250px; padding: 10px; margin-top: 0px; background-color: #C21010;" ><ion-icon style="font-size: 22px;" name="cart"></ion-icon></button>
                            </div>
                        </div>
                    </div>
                    <div class="perfume-info-detail">
                        <h2>Perfume Information</h2>
                        <p><span class="bold-numbers">Category Name:</span> ${perfume.getCategory().getName()}</p>
                        <p><span class="bold-numbers">Description:</span> ${perfume.getDescription()}</p>
                    </div>
                </div>
                <h2 style="margin: 20px; color: #C21010;">We think you'll like them too</h2>
                <!-- End Perfume Detail -->
                <!-- List Menu -->

                <div class="list-menu row">
                    <c:forEach var="perfume" items="${requestScope.topFour}" >
                        <div class="col-md-3">
                            <div class="best-seller">
                                <img src="${perfume.getImg()}" alt="">
                                <div class="name-perfume">
                                    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
                                    <c:choose>
                                        <c:when test="${fn:length(perfume.getName()) > 15}">
                                            ${fn:substring(perfume.getName(), 0, 15)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${perfume.getName()}
                                        </c:otherwise>
                                    </c:choose> 
                                </div>

                                <div class="perfume-info">
                                    <div class="price-section">
                                        <p>Price:</p>
                                        <c:choose>
                                            <c:when test="${perfume.getSale() == 0}">

                                                <p class="discounted-price">${perfume.getRealPrice()}$</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="original-price">${perfume.getPrice()}$</p>
                                                <p class="discounted-price">${perfume.getRealPrice()}$</p>
                                            </c:otherwise>
                                        </c:choose>


                                    </div>  <p>Units Sold: (+15)</p> 
                                </div>
                                <div class="perfume-btn">
                                    <button onclick="viewPerfume('${perfume.getId()}')">View</button>
                                    <button onclick="addToCart('${perfume.getId()}')"><ion-icon style="font-size: 22px;" name="cart"></ion-icon></button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="not-found" style="display: none;">
                        <p>Name perfume not found !</p>
                    </div>
                </div>
                <style>
            body {
                background-image: url('/img/bgblue (1).jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
            .best-seller {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                border: 1px solid #ddd;
                padding: 10px;
                border-radius: 8px;
                height: 100%;
            }
            .best-seller img {
                max-width: 90%;
                max-height: 400px;
                object-fit: cover;
            }
            .name-perfume {
                height: 50px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            .perfume-info {
                margin-top: 10px;
            }
            .price-section {
                display: flex;
                justify-content: space-between;
            }
            .perfume-btn {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }
            .perfume-btn button {
                flex: 1;
                margin: 0 5px;
            }
        </style>

                <!-- End List Menu -->
            </main>
            <!-- End of Main Content -->



        </div>
        <%@include file="footerGuest.jsp"%>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
                                    const quantityText = document.querySelector(".quantity span");
                                    const minusButton = document.querySelector(".btn-sub");
                                    const plusButton = document.querySelector(".btn-plus");

                                    let quantity = 1;

                                    minusButton.addEventListener("click", () => {
                                        if (quantity > 1) {
                                            quantity--;
                                            quantityText.textContent = quantity;
                                        }
                                    });

                                    plusButton.addEventListener("click", () => {
                                        quantity++;
                                        quantityText.textContent = quantity;
                                    });
                                    function viewPerfume(id) {
                                        window.location = "/guest/perfumeDetailGuest?id=" + id;
                                    }
                                    function addToCart() {
                                        Swal.fire({
                                            title: '',
                                            text: "You have to login to add to cart",
                                            icon: 'warning',
                                            showCancelButton: true,
                                            confirmButtonColor: '#3085d6',
                                            cancelButtonColor: '#d33',
                                            confirmButtonText: 'Log in now'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                window.location = "/guest/loginGuest";
                                                f
                                            }
                                        })
                                    }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
</html>
