<%@page import="semi.vo.ReviewRecommendHistory"%>
<%@page import="java.util.List"%>
<%@page import="semi.dao.ReviewDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="semi.dao.CustomerDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="semi.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String plusOrMinus = request.getParameter("plusOrMinus");
	
	int proNo = Integer.parseInt(request.getParameter("proNo"));
	int custNo = Integer.parseInt(request.getParameter("custNo"));
	if (request.getParameter("loginedUser") == null) {
		return;
	}
	int loginedUserNo = Integer.parseInt(request.getParameter("loginedUser"));
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	
	CustomerDao customerDao = CustomerDao.getInstance();
	ProductDao productDao = ProductDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();
	
	Map<String, Object> checkingMap = new HashMap<>();
	checkingMap.put("custNo", loginedUserNo);
	checkingMap.put("reviewNo", reviewNo);
	
	ReviewRecommendHistory history = reviewDao.getReviewHistoryByReviewNoAndCustNo(checkingMap);

	Map<String, Object> map = new HashMap<>();
	map.put("proNo", proNo);
	map.put("custNo", custNo);
	map.put("reviewNo", reviewNo);
	
	if ("plus".equals(plusOrMinus)) {		
		if (history == null) {
			productDao.plusReviewLike(map);
			productDao.insertReviewLikeHistory(checkingMap);
		}
	} else if ("minus".equals(plusOrMinus)) {
		if (history != null) {
			productDao.minusReviewLike(map);
			productDao.deleteReviewLikeHistory(checkingMap);
		}
	}
	
	int like = productDao.getReviewLike(map);
	
	Gson gson = new Gson();
	String likes = gson.toJson(like);
	out.write(likes);
%>