<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="css/addPerfume.css">
        <title>PerfumeStore manager</title>

    </head>
    <body>


        <div class="container-i">
            <!-- Sidebar -->
            <%@include file="sidebarManager.jsp" %>


            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>
                <%
                    String username = (String) request.getSession().getAttribute("username");
                    if (username == null) {
                        response.sendRedirect("/login");
                    }
                %>
                <div class="header">
                    <div class="logo-tittle">
                   <img src="/img/logo.jpg" style="width: 120px;" alt=""/>
                    </div>

                    <div class="name-tittle">
                        Update Perfume
                    </div>

                    <div class="user-info">

                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Add Perfume Table -->
                <h2>Enter Perfume Information</h2>
                <form action="updatePerfumeManager" method="POST">
                    <div class="perfume-info">
                        <div class="left-info">
                            <ul>
                                <li><label>Perfume ID: </label><input type="text" name="perfume_id" value="${perfume_update.id}" readonly></li>

                                <li><label>Perfume Name: </label><input type="text" name="perfume_name" value="${perfume_update.name}"></li>
                                <li><label>Price: </label><input type="number" name="price" step="0.01" value="${perfume_update.price}"><label>$</label></li>

                                <li><label>Sale: </label><input type="number" name="sale" step="0.01" value="${perfume_update.sale}"><label>%</label></li>
                                <li>
                                    <label>Select file image: </label>
                                    <input type="file" id="fileInput" accept="image/*" value name="img" />

                                    <label style="color: black; margin-left: 7%;" for="fileInput">Choose File Image</label>

                                </li>
                                <li style="width: 200px;"><img style="width: 200px;height: 200px;" id="imagePreview" src="${perfume_update.img}">
                                    <input type="hidden" id="imgSrc" name="imgSrc" value="">
                                </li>
                                <li>
                                    <p id="status"></p>
                                    <p id="displayLink"></p>
                                    <input style="display: none" id="directLink" name ="imageUrl"  value="">
                                </li>
                            </ul>
                        </div>
                        <div class="right-info">
                            <ul>
                                <li>
                                    <label>Category Perfume: </label>
                                    <c:set var="options">
                                        <c:out value="Children perfumes,Comic,Textperfume,Psychology perfumes,Fables,Novel,Combo" />
                                    </c:set>

                                    <select class="select-box" name="category_name">
                                        <c:forEach var="option" items="${fn:split(options, ',')}">
                                            <option value="${option}" ${option eq category_perfume ? 'selected' : ''}>${option}</option>
                                        </c:forEach>
                                    </select>
                                </li>
                                <li><label>Description: </label>
                                    <textarea cols="30" rows="3" name="description" style="resize: none">${perfume_update.description}</textarea>
                                </li>
                                <li><label>Status: </label>
                                    <select class="select-box" name="status">
                                        <option value="Available">Available</option>
                                        <option value="Sold Out" ${'Sold Out' eq status_perfume ? 'selected' : ''}>Sold Out</option>
                                    </select>
                                </li>
                            </ul>
                            <div class="btn-product">
                                <div class="btn-add-product">
                                    <button type="submit">
                                        Update Perfume
                                    </button>
                                </div>
                                <div class="btn-cancel-product">
                                    <button type="button" onclick="backMenu()">
                                        Cancel
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </main>
            <!-- End of Main Content -->
            <script>
                // Lắng nghe sự kiện khi người dùng chọn file
                const fileInput = document.getElementById('fileInput');
                const imagePreview = document.getElementById('imagePreview');

                var imgSrc = imagePreview.getAttribute('src');

                // Gán giá trị src vào trường ẩn trước khi gửi form
                document.getElementById('imgSrc').value = imgSrc;

                fileInput.addEventListener('change', function () {
                    const selectedFile = fileInput.files[0];

                    if (selectedFile) {
                        // Tạo một đối tượng FileReader để đọc file hình ảnh
                        const reader = new FileReader();

                        reader.onload = function (event) {
                            // Đặt src của thẻ <img> thành URL của hình ảnh đã chọn
                            imagePreview.src = event.target.result;

                            // Gọi hàm uploadImage() khi người dùng đã chọn tệp hình ảnh
                            uploadImage();
                        };

                        // Đọc file hình ảnh
                        reader.readAsDataURL(selectedFile);
                    }
                });

                function uploadImage() {
                    const apiKey = '7792a8dba108037602d51b7ee5c91eb9'; //api key
                    const apiUrl = 'https://api.imgbb.com/1/upload';

                    const statusText = document.getElementById('status');
                    const directLinkText = document.getElementById('displayLink');
                    const getLink = document.getElementById('directLink');

                    statusText.textContent = 'Uploading...';
                    directLinkText.textContent = '';  // Xóa liên kết trực tiếp cũ nếu có.
                    getLink.value = '';

                    const imageInput = document.getElementById('fileInput');
                    const file = imageInput.files[0];

                    if (!file) {
                        statusText.textContent = 'Please select an image file.';
                        return;
                    }

                    const formData = new FormData();
                    formData.append('image', file);
                    formData.append('key', apiKey);

                    fetch(apiUrl, {
                        method: 'POST',
                        body: formData,
                    })
                            .then(response => response.json())
                            .then(data => {
                                if (data.data && data.data.url) {
                                    const imageUrl = data.data.url;
                                    statusText.textContent = 'The image has been uploaded successfully!';
                                    directLinkText.innerHTML = '<a href="' + imageUrl + '" target="_blank">' + imageUrl + '</a>';
                                    getLink.value = imageUrl;
                                } else if (data.error) {
                                    statusText.textContent = 'Error: ' + data.error.message;
                                }
                            })
                            .catch(error => {
                                statusText.textContent = 'Error: ' + error.message;
                            });
                }

                document.querySelector('.btn-add-product button').addEventListener('click', function (event) {
                    // Ngăn chặn mặc định của nút Submit để tránh gửi mẫu ngay lập tức
                    event.preventDefault();

                    const perfumeName = document.querySelector('input[name="perfume_name"]').value.trim();
                    const price = parseFloat(document.querySelector('input[name="price"]').value.trim());
                    const sale = parseFloat(document.querySelector('input[name="sale"]').value.trim());

                    const category_name = document.querySelector('select[name="category_name"]').value;
                    const description = document.querySelector('textarea[name="description"]').value.trim();
                    const status = document.querySelector('select[name="status"]').value;

                    if (!perfumeName || isNaN(price) || isNaN(sale) || sale === undefined || category_name === '' || description === '' || description === null || status === '') {
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid information',
                            text: 'Please fill in the required information!',
                        });
                    } else if (perfumeName.length < 1 || perfumeName.length > 50) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid Perfume name Length',
                            text: 'Perfume must be between 1 and 50 characters.',
                        });
                    } else if (price < 0 || price > 10000) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid Price Value',
                            text: 'Price value must be between 0 and 10000.',
                        });
                    } else if (sale < 0 || sale > 100) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid Sale Value',
                            text: 'Sale value must be between 0 and 100.',
                        });
                    } else if (description.length < 1 || description.length > 250) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid Description Length',
                            text: 'Description must be between 1 and 250 characters.',
                        });
                    } else {
                        // Nếu tất cả thông tin hợp lệ, cho phép form được submit
                        document.querySelector('form').submit();
                    }
                });
                function backMenu() {
                    window.location = "listMenuManager";
                }
            </script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/pickadate.js/3.6.6/compressed/picker.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/pickadate.js/3.6.6/compressed/picker.date.js"></script>

        </div>
    </body>

</html>