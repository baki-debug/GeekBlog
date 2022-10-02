<%@ page import="com.blog.dao.PostDao" %>
<%@ page import="com.blog.helpers.ConnectionProvider" %>
<%@ page import="com.blog.entities.Post" %>
<%@ page import="java.util.List" %>
<div class="row">
    <%
        PostDao pd = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> list;
        if (cid == 0) {
            list = pd.getAllPosts();
        } else {
            list = pd.getPostsByCategory(cid);
        }
        if (list.isEmpty()) {
    %>
    <h3 class="display-6 text-center">There are no posts in this category.</h3>
    <%
        return;
        }
        for (Post p : list) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_images/<%=p.getPpic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getPtitle()%>
                </b>
                <p><%=p.getPcontent()%>
                </p>

            </div>
            <div class="card-footer">
                <a href="show_post_page.jsp?postId=<%=p.getPid()%>" class="btn btn-outline-dark btn-sm">Read more..</a>
                <a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-thumbs-o-up"></i><span> 10</span> </a>
                <a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-commenting-o"></i><span> 5</span> </a>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>