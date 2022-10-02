package com.blog.servlets;

import com.blog.dao.PostDao;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helpers.ConnectionProvider;
import com.blog.helpers.Helper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet(name = "AddPostServlet", value = "/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            Part part = request.getPart("pFile");
            String fileName = part.getSubmittedFileName();
            HttpSession s = request.getSession();

            User user = (User) s.getAttribute("currentUser");
            Post post = new Post(cid, pTitle, pContent, fileName, user.getId());
            PostDao postDao = new PostDao(ConnectionProvider.getConnection());
            if (postDao.savePost(post)) {
                String path = request.getRealPath("/") + "blog_images" + File.separator + fileName;
                Helper.saveFile(part.getInputStream(), path);
                out.println("done");
            } else
                out.println("error");
        }
    }

    //UNWANTED CODE
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
