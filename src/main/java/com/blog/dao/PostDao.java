package com.blog.dao;

import com.blog.entities.Category;
import com.blog.entities.Post;
import javafx.geometry.Pos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            System.out.println("WORKING ");
            String q = "Select * from categories";
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(q);
            while ((rs.next())) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");
                Category c = new Category(cid, name, description);
//                if(c!=null)
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println("POSTDAO SUCKS");
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "insert into post(ptitle,pcontent,ppic,catid,userId) values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, p.getPtitle());
            ps.setString(2, p.getPcontent());
            ps.setString(3, p.getPpic());
            ps.setInt(4, p.getCatid());
            ps.setInt(5, p.getUserId());
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        try {
            String q="select * from post order by pid desc ";
            PreparedStatement p=con.prepareStatement(q);
            ResultSet set=p.executeQuery();
            while (set.next()){
                int pid=set.getInt("pid");
                String ptitle=set.getString("ptitle");
                String pcontent=set.getString("pcontent");
                String ppic=set.getString("ppic");
                Timestamp pdate=set.getTimestamp("pdate");
                int catid=set.getInt("catid");
                int userid=set.getInt("userId");
                Post post=new Post(pid,catid,ptitle,pcontent,ppic,pdate,userid);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostsByCategory(int catid) {
        List<Post> list = new ArrayList<>();
        try {
            String q="select * from post where catid=? order by pid desc ";
            PreparedStatement p=con.prepareStatement(q);
            p.setInt(1,catid);
            ResultSet set=p.executeQuery();
            while (set.next()){
                int pid=set.getInt("pid");
                String ptitle=set.getString("ptitle");
                String pcontent=set.getString("pcontent");
                String ppic=set.getString("ppic");
                Timestamp pdate=set.getTimestamp("pdate");
                int userid=set.getInt("userId");
                Post post=new Post(pid,catid,ptitle,pcontent,ppic,pdate,userid);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostsById(int postid) {
        Post post=null;
        try {
            String q="select * from post where pid=? ";
            PreparedStatement p=con.prepareStatement(q);
            p.setInt(1,postid);
            ResultSet set=p.executeQuery();
            if (set.next()){
                int pid=set.getInt("pid");
                String ptitle=set.getString("ptitle");
                String pcontent=set.getString("pcontent");
                String ppic=set.getString("ppic");
                Timestamp pdate=set.getTimestamp("pdate");
                int userid=set.getInt("userId");
                int catid=set.getInt("catid");
                post=new Post(pid,catid,ptitle,pcontent,ppic,pdate,userid);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}
