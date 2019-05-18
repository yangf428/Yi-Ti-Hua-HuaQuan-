package servlet;

import entity.Pinglun;
import service.PinglunDaoTest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


//3.0以上使用@WebServlet注解，web.xml不再是必须；"/PinglunAddServlet": url路径
@WebServlet("/PinglunAddServlet")
public class PinglunAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		Pinglun pinglun=new Pinglun();
		
		pinglun.setPcontent(request.getParameter("pinglun_m"));
		pinglun.setUserid(new Integer(request.getParameter("userid")));
		pinglun.setByid(new Integer(request.getParameter("byid")));

		System.out.println();
		System.out.println(request.getParameter("pinglun_m"));
		System.out.println(request.getParameter("userid"));
		System.out.println((request.getParameter("byid")));
		PinglunDaoTest.save(pinglun);
		
		response.sendRedirect("f/blogList.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
