
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
        <style>
            .banner-background2{
                clip-path: polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);
            }
        </style>

    </head>
    <body>
        
        <!-- navbar -->
        
        <%@include file="normal_navbar.jsp" %>

        <!-- card -->

        <main class="d-flex align-items-center primary-background banner-background2" style="height: 85vh">
            <div class="container">
                
                    <div class="col-md-6 offset-3">
                        <div class="card">
                            <div class="card-header text-center primary-background" >
                                
                                <i class="fa-solid fa-user-plus fa-2x"></i>
                                <p>Register Here</p>

                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="mb-1">
                                        <label for="user_name" class="form-label">User name</label>
                                        <input type="text" class="form-control" id="user_name" aria-describedby="emailHelp">
                                    </div>
                                    <div class="mb-1">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-1">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="mb-1">
                                        <label for="gender" class="form-label">Gender</label>
                                        <br>
                                        <input type="radio" id="gender" name="gender">Male
                                        <input type="radio" id="gender" name="gender">Female
                                    </div>

                                    <!--<div class="form-group">
                                        <textarea class="form-control" name="about" id="" rows="2" placeholder="Enter something about yourself"></textarea>
                                    </div>-->

                                    <div class="mb-1 form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                                    </div>
                                    <br>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                
            </div>
        </main>

        <!-- Javascript -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>


    </body>
</html>
