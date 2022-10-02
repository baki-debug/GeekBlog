package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.User;
import com.blog.helpers.ConnectionProvider;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String check=request.getParameter("check");

            if(check==null){
                out.println("Agree terms and conditions in order to continue");
            }
            else{
                String name=request.getParameter("name");
                String email=request.getParameter("email");
                String password=request.getParameter("password");
                String about=request.getParameter("about");
                String gender=request.getParameter("gender");
                User user=new User();
                user.setName(name);
                user.setEmail(email);
                user.setPassword(password);
                if(about.length()>0)
                    user.setAbout(about);
                user.setGender(gender);

                UserDao dao=new UserDao(ConnectionProvider.getConnection());
                if(dao.saveUser(user))
                    out.println("DONE");
                else
                {
                    out.println("ERROR");
                }

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
