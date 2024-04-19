package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.tech.blog.entities.Post;

public class PostDao {

    Connection conn;

    public PostDao(Connection conn) {
        this.conn = conn;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>(); // Initialize the ArrayList
        try {
            String q = "select * from categories;";
            Statement st = this.conn.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?) ";
            PreparedStatement ptst = conn.prepareStatement(query);
            ptst.setString(1, p.getpTitle());
            ptst.setString(2, p.getpContent());
            ptst.setString(3, p.getpCode());
            ptst.setString(4, p.getpPic());
            ptst.setInt(5, p.getCatid());
            ptst.setInt(6, p.getUserId());

            ptst.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

// get all the post
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
//     fetch all post
        try {
            String query = "SELECT * FROM posts ORDER BY pDate DESC;";
            Statement st = this.conn.createStatement();
            ResultSet set = st.executeQuery(query);

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catid");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, catId);
                list.add(post);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
//     fetch  post by catId
        try {
            String query = "select * from posts where catid= " + catId;
            Statement st = this.conn.createStatement();
            ResultSet set = st.executeQuery(query);
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, catId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public Post getPostByPostId(int postid) {

        Post p = null;
        try {
            String query = "select * from posts where pid=? ";
            PreparedStatement ptst = this.conn.prepareStatement(query);
            ptst.setInt(1,postid);
            ResultSet set=ptst.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catid");
                int userId = set.getInt("userId");
                p = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, catId);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }
}
