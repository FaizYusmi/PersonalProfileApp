package servlet;

import bean.ProfileBean;
import util.DBConnection;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SearchProfileServlet")
public class SearchProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String studentId =
                request.getParameter("studentId");
        System.out.println("Student ID Cari: " + studentId);

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
            "SELECT * FROM profiles WHERE studentId=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, studentId);

            ResultSet rs =
                    ps.executeQuery();

            ProfileBean profile = null;

            if(rs.next()){

                profile =
                        new ProfileBean();

                profile.setId(
                        rs.getInt("id"));

                profile.setName(
                        rs.getString("name"));

                profile.setStudentId(
                        rs.getString("studentId"));

                profile.setProgram(
                        rs.getString("program"));

                profile.setEmail(
                        rs.getString("email"));

                profile.setHobbies(
                        rs.getString("hobbies"));

                profile.setIntro(
                        rs.getString("intro"));
            }

            request.setAttribute(
                    "profile",
                    profile);

            request.getRequestDispatcher(
                    "searchProfile.jsp")
                    .forward(request,response);

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}
