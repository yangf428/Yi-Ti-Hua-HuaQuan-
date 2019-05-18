package servlet;

import entity.Fatie;
import util.ConnectionFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FatieDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int fid = Integer.parseInt(req.getParameter("fid"));
        Fatie fatie=null;


        try {
             fatie = FatieDetailServlet.queryFid(fid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("fid",fid);
        req.setAttribute("titles",fatie.getTitles());
        req.setAttribute("fcontent",fatie.getFcontent());
        req.setAttribute("username",fatie.getUsername());
        req.setAttribute("photo",fatie.getPhoto());
        req.getRequestDispatcher("f/detail.jsp").forward(req,resp);
    }

    public static Fatie queryFid(int fid) throws SQLException {

        Connection conn = ConnectionFactory.getInstance().makeConnection();
        conn.setAutoCommit(false);

        Fatie fatie = new Fatie();
        String sql="select * from fatie where fid=? ";
        //PreparedStatement ps=conn.prepareStatement(sql);也行
        PreparedStatement ps=conn.prepareCall(sql);

        ps.setInt(1, fid);

        ResultSet rs=ps.executeQuery();

        while (rs.next()){

        fatie.setTitles(rs.getString("titles"));
        fatie.setFcontent(rs.getString("fcontent"));
        fatie.setUsername(rs.getString("username"));
        fatie.setPhoto(rs.getString("photo"));
        fatie.setFid(rs.getInt("fid"));
        }
        return fatie;
    }

}


