package com.blog.servlets;

import com.blog.dao.LikeDao;
import com.blog.helpers.ConnectionProvider;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LikeServlet", value = "/LikeServlet")
public class LikeServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String operation = request.getParameter("operation");
            int uid = Integer.parseInt(request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
            if (operation.equals("like")) {
                boolean f=false;
                if(!ldao.isLikedByUser(pid,uid)) {
                     f= ldao.insertLike(pid, uid);
                }
                else{
                    ldao.removeLike(pid,uid);
                }
                    out.println(f);
            }
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
