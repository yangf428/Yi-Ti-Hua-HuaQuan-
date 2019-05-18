package servlet;

import entity.Fatie;
import entity.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.FatieDaoTest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@WebServlet("/FatieAddServlet")
public class FatieAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 存放构造的文件（图片）名
		File fullFile = null;
		// 存放标题和内容
		/*String titles = null;
		String fcontent = null;*/

		String titles = request.getParameter("title");
		String fcontent = request.getParameter("fcontent");
		System.out.println(titles);
		System.out.println(fcontent);

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		int userid = user.getUserid();
		String username = user.getName();
		Fatie fatie = new Fatie();

		/**
		 * 将头像上传保存到相应目录
		 * 
		 */
		// 获取当前项目目录
		String realPath = request.getServletContext().getRealPath("\\");
		/*
		realPath = realPath.substring(0, realPath.indexOf("\\.")).replace("\\", "/");
		 */
		realPath = realPath.substring(0, realPath.indexOf("out"));
		String contextPath = request.getContextPath();//webContent 目录

		System.out.println(realPath + contextPath);
		String uploadPath = (realPath + contextPath) + "web\\img\\upload_Fatie";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			System.out.println("enctype必须是 multipart/form-data");
		}

		
		try {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(request);// 得到所有的文件

			Iterator<FileItem> itr = items.iterator();

			// 改写格式
			DateFormat ddf = DateFormat.getDateInstance();
			Date date = new Date();
			String time = ddf.format(date);
			time = time.replace("-", "_");

			System.out.println(time);

			while (itr.hasNext()) {// 依次处理每个文件
				FileItem item = (FileItem) itr.next();
				String fileName = item.getName();// 获得文件名，包括路径
				if (fileName != null) {

					fullFile = new File(time + "_id" + userid + "_" + item.getName());
					File savedFile = new File(uploadPath, fullFile.getName());
					savedFile.setWritable(true,false);
					item.write(savedFile);
				}
				// 检查是一个普通的表单域还是File组件（true是普通表单）
				if (item.isFormField()) {
					// 检查表单属性
					if ("titles".equals(item.getFieldName())) {
						titles = new String(item.getString().getBytes("iso-8859-1"), "UTF-8");
					}
					if ("fcontent".equals(item.getFieldName())) {
						fcontent = new String(item.getString().getBytes("iso-8859-1"), "UTF-8");
					}
				}
			}

			System.out.println("上传成功");
		} catch (Exception e) {
			e.printStackTrace();
		}

		/* 将发帖的图片信息插入数据库 */

		fatie.setTitles(titles);
		fatie.setFcontent(fcontent);
		fatie.setUserid(userid);
		fatie.setPhoto(fullFile.getName());
		fatie.setUsername(username);
		System.out.println(fatie);

		FatieDaoTest.save(fatie);

		response.sendRedirect("a/myCenter.jsp");

	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
