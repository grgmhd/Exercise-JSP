<%@page import="log.inout.LogDTO"%>
<%@page import="log.inout.LogDAO"%>
<%@page import="dbConn.ConnOracle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("input_id");
	String user_pw = request.getParameter("input_pw");
	
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String oId = application.getInitParameter("OracleId");
	String oPw = application.getInitParameter("OraclePw");
	
	LogDAO dao = new LogDAO(driver, url, oId, oPw);
	LogDTO dto = dao.getDTO(user_id, user_pw);
	dao.close();
	
	if(dto.getId() !=null) {
		session.setAttribute("user_id", dto.getId());
		session.setAttribute("user_name", dto.getName());
		
		response.sendRedirect("LoginForm.jsp");
	}
	else {
		request.setAttribute("ErrMsg", "로그인 오류가 발생했습니다.");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>