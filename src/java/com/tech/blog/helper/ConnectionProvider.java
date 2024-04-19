package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

    private static Connection conn;

    public static Connection getConnection() {
        System.out.println("Hello world");
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String jdbcurl = "jdbc:mysql://localhost:3306/techblog";
                String name = "root";
                String pass = "root";
                conn = DriverManager.getConnection(jdbcurl, name, pass);
                System.out.println("Connection is successful");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
