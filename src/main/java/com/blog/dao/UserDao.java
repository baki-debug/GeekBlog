package com.blog.dao;

import com.blog.entities.User;

import java.sql.*;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {
        boolean flag = false;
        try {
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user set name=?, email=?, password=?, about=?,gender=?,profile=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            ps.setString(4,user.getAbout());
            ps.setString(5,user.getGender());
            ps.setString(6,user.getProfile());
            ps.setInt(7,user.getId());
            ps.executeUpdate();
            f=true;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserById(int id){
        User user=new User();
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            if(rs.next()) {
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    return user;
    }
}
