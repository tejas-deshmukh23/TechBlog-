<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<% User user = (User)session.getAttribute("currentUser"); %>

<div class="row">

    <%
        
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        
        List<Post> posts ;
        int cid = Integer.parseInt(request.getParameter("cid"));
        if (cid == 0) {

            posts = d.getAllPosts();
        }
        else{
            posts = d.getPostByCatId(cid);
        }
        
        if(posts.size()==0)
        {
            out.println("<h3 class='display-3 text-center'>no posts in this category<h3>");
            return;
        }

        for (Post p : posts) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img src="blog_pics/<%=p.getpPic()%>" class="card-img-top" alt="Card Image cap">
            <div class="card-body">
                <b><%=p.getpTitle()%></b>
                <p><%=p.getpContent()%></p>
                
            </div>
                
                <% LikeDao ld = new LikeDao(ConnectionProvider.getConnection());%>
                
                <div class="card-footer text-center primary-background">
                    <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more</a>
                    <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>,this)" class="btn btn-outline-light btn-sm"><i class="fa-regular fa-thumbs-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa-regular fa-comment"></i></a>
                </div>
        </div>
    </div>


    <%
        }


    %>

</div>