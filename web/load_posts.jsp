<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<div class="row">
    <%

            PostDao d = new PostDao(ConnectionProvider.getConnection());
            int cid=Integer.parseInt(request.getParameter("cid"));
            List<Post> post =null;
            if(cid==0){
                post=d.getAllPosts();
            } else  {
                post=d.getPostByCatId(cid);
            }
            if(post.size()==0){
            out.println("No post in this category...");
            return;
        }

            for(Post p : post)
             {
    %>
    <div class="col-md-6">
        <div class="card m-2">
            <img id="posts" src="blog_pics/<%= p.getpPic()%>"  class="card-img-top" alt="...">
            <div class="card-body">
                <b><%= p.getpTitle() %></b>
                <p><%= p.getpContent() %></p>
            </div>
            <div class="card-footer bg-primary ">
                <a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More</a>
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span>10</span></i></a>
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
            </div>
        </div>
            
    </div>
    <%
            }

    %>
</div>
