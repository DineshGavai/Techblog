package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }
//    method to insert data into database

    public boolean saveUser(User user) {
        boolean f = false;
        try {
//            user-->databse
            String query = "insert into users(name,email,password,gender) values(?,?,?,?)";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();

        }
        return f;

    }
//    get user by email and password

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
            String query = "select * from users where email=? and password=?";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                user.setName("name");
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDate(set.getTimestamp("date"));
                user.setProfile(set.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
        boolean f=false;
        
        try{
            String query ="update users set name=?,email=?,password=?,gender=?,profile=? where id=?";
            PreparedStatement p=conn.prepareStatement(query);
            p.setString (1,user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getProfile());
            p.setInt(6,user.getId());
            p.executeUpdate();
            f=true;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public User getUserbyUserId(int userId){
        User user=null;
        try {
            String query="select * from users where id=?";
            PreparedStatement ptst=this.conn.prepareStatement(query);
            ptst.setInt(1,userId);
            ResultSet set=ptst.executeQuery();
            while(set.next()){
                user=new User();
                user.setName("name");
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDate(set.getTimestamp("date"));
                user.setProfile(set.getString("profile"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
}
