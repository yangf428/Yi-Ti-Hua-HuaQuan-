package service;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import util.ConnectionFactory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class UserDaoTest {

	static Connection conn = null;

	/**
	 * 登录时作验证
	 */
	public static Map<Object, Object> Login(String name) {

		Map<Object, Object> map = new HashMap<>();

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			
			UserDao userDao = new UserDaoImpl();
			User user = new User();
			user.setName(name);

			ResultSet rs = userDao.login(conn, user);
			//获取
			while (rs.next()) {
				map.put("userid", rs.getInt(1));
				map.put("name", rs.getString(2));
				map.put("password", rs.getString(3));
				map.put("email", rs.getString(4));
				map.put("family", rs.getString(5));
				map.put("intro", rs.getString(6));
				map.put("time", rs.getString(7));
			}

			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return map;
	}

	/**
	 * 注册时插入信息到用户表
	 */
	public static void insert(Map<Object, Object> map) {

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);

			UserDao userDao = new UserDaoImpl();
			User user = new User();
			user.setName((String) map.get("name"));
			user.setPassword((String) map.get("password"));

			userDao.saveOr(conn, user);

			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 查询用户信息
	 */
	public static Map<Object, Object> query(int userid) {

		Map<Object, Object> map = new HashMap<>();

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);

			UserDao userDao = new UserDaoImpl();
			User user = new User();
			user.setUserid(userid);

			ResultSet rs = userDao.query(conn, user);
			while (rs.next()) {
				map.put("userid", rs.getInt(1));
				map.put("name", rs.getString(2));
				map.put("password", rs.getString(3));
				map.put("email", rs.getString(4));
				map.put("family", rs.getString(5));
				map.put("intro", rs.getString(6));
				map.put("time", rs.getString(7));
				//System.out.println(rs.next());

			}

			conn.commit();
		} catch (SQLException e) {
			try {
				if(conn.isClosed()){
					conn = ConnectionFactory.getInstance().makeConnection();
					conn.rollback();
				}else{
					conn.rollback();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return map;
	}
	
	
	/**
	 * 修改用户信息
	 */
	public static void update(User user) {
		
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);

			UserDao userDao = new UserDaoImpl();
			
			userDao.update(conn, user);
			
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
