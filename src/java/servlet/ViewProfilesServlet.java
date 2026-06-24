package servlet;

import bean.ProfileBean;
import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewProfilesServlet")
public class ViewProfilesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<ProfileBean> profileList = new ArrayList<ProfileBean>();

        try {

            Connection con = DBConnection.getConnection();

            String search = request.getParameter("search");
            String program = request.getParameter("program");
            String sort = request.getParameter("sort");
            String order = request.getParameter("order");

            String sql = "SELECT * FROM profiles WHERE 1=1";

            if (search != null && !search.trim().equals("")) {
                sql += " AND name LIKE '%" + search + "%'";
            }

            if (program != null && !program.equals("")) {
                sql += " AND program='" + program + "'";
            }

            if (sort != null && !sort.equals("")) {

                if (!sort.equals("name") && !sort.equals("studentId")) {
                    sort = "id";
                }

                sql += " ORDER BY " + sort;

                if (order != null && order.equalsIgnoreCase("DESC")) {
                    sql += " DESC";
                } else {
                    sql += " ASC";
                }
            }

            System.out.println(sql);

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                ProfileBean p = new ProfileBean();

                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setStudentId(rs.getString("studentId"));
                p.setProgram(rs.getString("program"));
                p.setEmail(rs.getString("email"));
                p.setHobbies(rs.getString("hobbies"));
                p.setIntro(rs.getString("intro"));

                profileList.add(p);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        request.setAttribute("profileList", profileList);

        request.getRequestDispatcher("viewProfiles.jsp")
               .forward(request, response);

    }

}