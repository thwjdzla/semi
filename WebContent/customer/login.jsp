 

<%@page import="semi.vo.Customer"%>
<%@page import="semi.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String custid = request.getParameter("cust_id");
	String custpasswd = request.getParameter("cust_passwd");

	CustomerDao customerDao = CustomerDao.getInstance();
	Customer customer =  customerDao.login(custid);
	
	if(customer == null) {
		response.sendRedirect("main.jsp?fail=invalid");
		return;
	} 
	
	if(!customer.getPwd().equals(custpasswd)) {
		response.sendRedirect("main.jsp?fail=invalid");
		return;
	} 

	
	session.setAttribute("logged-in-user",customer);
	response.sendRedirect("main.jsp");
	
%>
