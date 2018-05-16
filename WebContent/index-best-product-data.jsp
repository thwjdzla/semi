<%@page import="semi.service.enums.OrderWay"%>
<%@page import="semi.service.enums.OrderBy"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="semi.service.ProductService"%>
<%@page import="java.util.Date"%>
<%@page import="semi.utils.JsonUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="semi.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int categoryNo = Integer.parseInt(request.getParameter("category-no"));
	ProductService productService = ProductService.getInstance();
	
	List<Map<String, Object>> bestProducts = productService.getProdutsToDisplayBestTable(categoryNo, OrderBy.ORDER_QTY.no, OrderWay.DESC.no);
	Map<String,Integer> bestTableSize = new HashMap<>();
	bestTableSize.put("rows", ProductService.BEST_PRODUCT_ROWS);
	bestTableSize.put("cols", ProductService.BEST_PRODUCT_COLS);
	
	Map<String, Object> resultMap = new HashMap<>();
	resultMap.put("bestTableSize", bestTableSize);
	resultMap.put("bestProducts", bestProducts);
	
	GsonBuilder gsonBuilder = new GsonBuilder();
	gsonBuilder.registerTypeAdapter(Date.class, new JsonUtil.DateSerializer());
	Gson gson = gsonBuilder.create();
	String jsonText = gson.toJson(resultMap);
	
	out.write(jsonText);
%>