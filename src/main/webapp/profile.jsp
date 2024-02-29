
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 96%, 76% 89%, 37% 97%, 0 92%, 0 0);
            }

            body{
                background: url(img/pexels-johannes-plenio-1103970.jpg);
                background-size: cover;
                background-attachment: fixed;
            }


        </style>

    </head>
    <body>

        <!-- navbar -->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background ">
            <div class="container-fluid ">
                <a class="navbar-brand" href="#"><i class="fa-solid fa-laptop-code"></i>TechBlog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><i class="fa-solid fa-pen-fancy"></i>Learn Code with Tejas</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-link"></i> Categories
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Data Structure</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa-regular fa-address-book"></i>Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"  ><i class="fa-regular fa-asterisk"></i>Do Post</a>
                        </li>


                    </ul>

                    <ul class="navbar-nav mr-right">

                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><i class="fa-solid fa-user-circle "></i><%= user.getName()%></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
                        </li>

                    </ul>

                </div>
            </div>
        </nav>

        <!-- Navbar end -->

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {

        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!-- Profile Modal -->

        <!-- Main Body of the page -->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!-- First col -->
                    <div class="col-md-4">
                        <!-- Categories -->

                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
                                All Posts
                            </a>

                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();

                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                            <%
                                }

                            %>



                        </div>

                    </div>
                    <!-- Second col -->
                    <div class="col-md-8">
                        <!-- Posts -->

                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-spin fa-4x"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div> 

                        <div class="container-fluid" id="post-container">

                        </div>

                    </div>
                </div>
            </div>
        </main>

        <!-- End Body of the page -->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="conatiner text-center">
                            <image src="pics/<%= user.getProfile()%>" style="border-radius: 50%; max-width: 150px;"><br>
                            <h5 class="modal-title fs-5 mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!-- Details -->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">id :</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">gender</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Profile Edit -->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">

                                    <table class="table">

                                        <tr>
                                            <td>Id :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"/></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"/></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"/></td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <td>New Profile :</td>
                                            <td><input type="file" name="image" class="form-control"/></td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-success">Save</button>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- end of modal -->

        <!--do-post-modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Provide the post details..</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="POST">

                            <div class="form-group mb-2">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%

                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {

                                    %>

                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>


                                    <% }%>

                                </select>
                            </div>

                            <div class="form-group mb-2">
                                <input type ="text" name="pTitle" placeholder="Enter Post Title" class="form-control"/>
                            </div>
                            <div class="form-group mb-2">
                                <textarea class="form-control" name="pContent" placeholder="Enter your Content" style="height:120px;"></textarea>
                            </div>
                            <div class="form-group mb-2">
                                <textarea class="form-control" name="pCode" placeholder="Enter your Program (if any)" style="height:120px;"></textarea>
                            </div>
                            <div class="form-group mb-2">
                                <label>Select your pic</label><br>
                                <input type="file" name="pic" />
                            </div>

                            <div class="conatiner text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!-- End of do post modal -->

        <!--JavaScript-->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
                                $(document).ready(function () {

                                    let editStatus = false;

                                    $('#edit-profile-button').click(function () {
                                        if (editStatus == false) {
                                            $('#profile-details').hide();
                                            $('#profile-edit').show();
                                            $(this).text("Back");
                                            editStatus = true;
                                        } else {
                                            $('#profile-details').show();
                                            $('#profile-edit').hide();
                                            $(this).text("Edit");
                                            editStatus = false;
                                        }
                                    })
                                })
        </script>

        <!--now add post js-->

        <script>
            $(document).ready(function (e) {

                $("#add-post-form").on("submit", function (event) {
                    //this called when form is submitted...
                    event.preventDefault();



                    let form = new FormData(this);

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success..
                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "Saved Successfully!", "success");
                            } else {
                                swal("Error!", "Something went wrong...", "success");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!", "Something went wrong...", "success");
                        },
                        processData: false,
                        contentType: false
                    })

                })

            })
        </script>

        <script>

            function getPosts(catId, temp)
            {
                $(".c-link").removeClass('active');

                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                })
            }

            $(document).ready(function (e) {
                let allPostRef = $(".c-link")[0]
                getPosts(0, allPostRef)
            })
        </script>

    </body>
</html>
