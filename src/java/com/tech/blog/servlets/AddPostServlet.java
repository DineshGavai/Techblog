package com.tech.blog.servlets;

import com.tech.blog.entities.Post;
import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author Dinesh
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pPic");
            String fileName = part.getSubmittedFileName();
            if (fileName == null || fileName.trim().isEmpty()) {
                fileName = "Default.svg"; // Set default filename
            } else {
                // Save the uploaded file to the server
                String path = request.getServletContext().getRealPath("/") + "blog_pics" + File.separator + fileName;
                Helper.saveFile(part.getInputStream(), path);
            }

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            Post p = new Post(pTitle, pContent, pCode, fileName, null, cid, user.getId());

            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            if (dao.savePost(p)) {
                String path = request.getServletContext().getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), path);
                out.println("done");

            } else {
                out.println("Error");
            }
        }
    }
}
