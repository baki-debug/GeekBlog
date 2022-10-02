package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helpers.ConnectionProvider;
import com.blog.helpers.Helper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditServlet", value = "/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String about = request.getParameter("user_about");
            Part part = request.getPart("user_profile");
            String imageName = part.getSubmittedFileName();
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setName(name);
            user.setAbout(about);
            user.setPassword(password);
            user.setEmail(email);
            String oldProfile = user.getProfile();
            user.setProfile(imageName);
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean res = dao.updateUser(user);
            if (res) {
                String path = request.getRealPath("/") + "profile_pics" + File.separator + user.getProfile();
                String oldPath = request.getRealPath("/") + "profile_pics" + File.separator + oldProfile;
                if(!oldProfile.equals("default.jpg"))
                    Helper.deleteFile(oldPath);
                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println(path);
                    out.println("Profile updated successfully");
                    Message msg = new Message("Profile updated successfully", "success", "alert-success");
                    s.setAttribute("msg", msg);
                } else {
                    Message msg = new Message("Something went wrong in updation", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
            } else {
                Message msg = new Message("Something went wrong", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");
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
