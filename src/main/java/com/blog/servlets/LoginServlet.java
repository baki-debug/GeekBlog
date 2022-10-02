package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helpers.ConnectionProvider;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String userEmail=request.getParameter("email");
            String userPassword=request.getParameter("password");

            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            User user=dao.getUserByEmailAndPassword(userEmail,userPassword);
            if(user==null){
                Message msg=new Message("Incorrect email or password","error","alert-danger");
                HttpSession s= request.getSession();
                s.setAttribute("msg",msg);
                response.sendRedirect("login_page.jsp");
            }
            else{
                HttpSession session=request.getSession();
                session.setAttribute("currentUser",user);
                response.sendRedirect("profile.jsp");
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
