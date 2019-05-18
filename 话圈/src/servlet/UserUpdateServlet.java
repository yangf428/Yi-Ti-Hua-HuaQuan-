package servlet;

import entity.User;
import service.UserDaoTest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


//3.0以上使用@WebServlet注解，web.xml不再是必须；"/UserUpdateServlet": url路径
@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		int userid=(user.getUserid());
		String pass=(user.getPassword());
		String password=request.getParameter("password");
		
		
		/*判断用户原密码输入是否正确*/
		if(password.equals(pass)) {
			user.setUserid(userid);
			user.setName(request.getParameter("name"));
			user.setPassword(request.getParameter("q_password"));
			user.setEmail(request.getParameter("email"));
			user.setFamily(request.getParameter("family"));
			user.setIntro(request.getParameter("intro"));
			
			UserDaoTest.update(user);
			response.sendRedirect("a/myCenter.jsp");
		}else {
			response.sendRedirect("a/myCenter.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
