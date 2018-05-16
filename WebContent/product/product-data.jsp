<%@page import="semi.service.enums.OrderWay"%>
<%@page import="semi.service.enums.OrderBy"%>
<%@page import="semi.utils.JsonUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Date"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="semi.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int categoryNo = Integer.parseInt(request.getParameter("category-no"));
	int pageNo = Integer.parseInt(request.getParameter("page-no"));

	int orderByNo = Integer.parseInt(request.getParameter("order-by"));
	int orderWayNo = Integer.parseInt(request.getParameter("order-way"));
	
	ProductService productService = ProductService.getInstance();
	
	List<Map<String, Object>> products = productService.getProductsToDisplayProductsTable(pageNo, categoryNo, orderByNo, orderWayNo);
	int lastPage = productService.getLastPageOfProductList(categoryNo);
	
	Map<String,Integer> productsTableSize = new HashMap<>();
	productsTableSize.put("rows", ProductService.PRODUCT_ROWS);
	productsTableSize.put("cols", ProductService.PRODUCT_COLS);
	productsTableSize.put("lastPage", lastPage);
	
	Map<String, Object> resultMap = new HashMap<>();
	resultMap.put("productsTableSize", productsTableSize);
	resultMap.put("products", products);
	
	GsonBuilder gsonBuilder = new GsonBuilder();
	gsonBuilder.registerTypeAdapter(Date.class, new JsonUtil.DateSerializer());
	Gson gson = gsonBuilder.create();
	String jsonText = gson.toJson(resultMap);
	
	out.write(jsonText);
%>