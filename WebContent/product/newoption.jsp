<%@page import="com.google.gson.Gson"%>
<%@page import="semi.vo.ProductDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String color = request.getParameter("color");
	String size = request.getParameter("size");
	String name = request.getParameter("name");
	String isWithOp = request.getParameter("op");
	
	ProductDetail product = new ProductDetail();
	product.setColor(color);
	product.setSize(size);
	product.setName(name);
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(product);
	out.write(jsonText);
%>