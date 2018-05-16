<%@page import="semi.dao.ProductDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="semi.vo.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	ProductDao productDao = ProductDao.getInstance();

	int length = Integer.parseInt(request.getParameter("length"));
	int custNo = Integer.parseInt(request.getParameter("custNo"));
	int proNo = Integer.parseInt(request.getParameter("proNo"));
	String whichBox = request.getParameter("whichBox");
	
	String[] colors = request.getParameter("color").split(",");
	String[] sizes = request.getParameter("size").split(",");
	String[] qtys = request.getParameter("qty").split(",");
	System.out.println(colors[0]);
	System.out.println(sizes[0]);
	System.out.println(qtys[0]);
	
	List<CartItem> selectedProducts = new ArrayList<>();
	
	for (int i=0; i<length; i++) {
		CartItem item = new CartItem();
		item.setColor(colors[i]);
		item.setProSize(sizes[i]);
		item.setQty(Integer.parseInt(qtys[i]));
		selectedProducts.add(item);
	}
	
	for (CartItem cartitem : selectedProducts) {
		Map<String, Object> map = new HashMap<>();
		map.put("custNo", custNo);
		map.put("proNo", proNo);
		map.put("proQty", cartitem.getQty());
		map.put("proColor", cartitem.getColor());
		map.put("proSize", cartitem.getProSize());
		productDao.addNewCartItem(map);
	}
	
	if ("ADD TO CART".equals(whichBox)) {
		response.sendRedirect("/semi/product/detail.jsp?pro-no="+proNo);
	} 
%>