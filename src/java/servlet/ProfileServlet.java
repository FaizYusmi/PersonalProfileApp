package servlet;

import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        try {

            System.out.println("SERVLET START");

            Connection con = DBConnection.getConnection();

            if(con == null){

                System.out.println("CONNECTION NULL");

            } else {

                System.out.println("CONNECTION SUCCESS");

                String sql =
                "INSERT INTO profiles(name,studentId,program,email,hobbies,intro)"
                + " VALUES(?,?,?,?,?,?)";

                PreparedStatement ps =
                con.prepareStatement(sql);

                ps.setString(1, name);
                ps.setString(2, studentId);
                ps.setString(3, program);
                ps.setString(4, email);
                ps.setString(5, hobbies);
                ps.setString(6, intro);

                int rows = ps.executeUpdate();

                System.out.println("ROWS = " + rows);
            }

        } catch(Exception e){

            System.out.println("INSERT ERROR");
            e.printStackTrace();
        }

        request.setAttribute("name", name);
        request.setAttribute("studentId", studentId);
        request.setAttribute("program", program);
        request.setAttribute("email", email);
        request.setAttribute("hobbies", hobbies);
        request.setAttribute("intro", intro);

        request.getRequestDispatcher("profile.jsp")
               .forward(request, response);
    }
}