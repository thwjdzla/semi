package semi.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.time.DateUtils;

import semi.dao.ProductDao;
import semi.service.enums.OrderBy;
import semi.service.enums.OrderWay;
import semi.vo.Category;

public class ProductService {

	private final static int WEEKLY_BEST_PRODUCT_PERIOD_DAYS = 7;

	private final static int BEST_PRODUCT_PERIOD_MONTHS = 6;
	
	private final static int NEW_ARRIVAL_PERIOD_MONTHS = 2;
	
	private final static int DEFAULT_PERIOD_MONTHS = 36;
	
	
	public final static int WEEKLY_BEST_ROWS = 3;
	
	public final static int WEEKLY_BEST_COLS = 3;
	
	
	public final static int NEW_ARRIVAL_ROWS = 4;
	
	public final static int NEW_ARRIVAL_COLS = 4;
	
	
	public final static int BEST_PRODUCT_ROWS = 4;
	
	public final static int BEST_PRODUCT_COLS = 4;
	
	
	public final static int PRODUCT_ROWS = 3;
	
	public final static int PRODUCT_COLS = 4;
	
	private List<OrderBy> orderByList;
	
	private List<OrderWay> orderWayList;
	
	private static ProductService instance;
	
	private ProductDao productDao;
	
	static {
		instance = new ProductService();
	}
	
	private ProductService() {
		productDao = ProductDao.getInstance();
		
		orderByList = new ArrayList<>();
		orderByList.add(OrderBy.CREATE_DATE);
		orderByList.add(OrderBy.ORDER_QTY);
		orderByList.add(OrderBy.DISCOUNT);
		orderByList.add(OrderBy.PRICE);
		orderByList.add(OrderBy.NAME);
		orderByList.add(OrderBy.STOCK_QTY);
		
		orderWayList = new ArrayList<>();
		orderWayList.add(OrderWay.DESC);
		orderWayList.add(OrderWay.ASC);
	}
	
	public static ProductService getInstance() {
		return instance;
	}
	

// 김유호 [ 시작 ] -----------------------------------------------------------------------------------------------------------

	public List<Map<String, Object>> getProductsToDisplayWeeklyBestTable(int categoryNo, int orderBy, int orderWay) throws SQLException{
		
		int pageNumber = 1;
		
		Date createTo = new Date();
		Date createFrom = DateUtils.addMonths(createTo, -DEFAULT_PERIOD_MONTHS);
		Date orderTo = new Date();
		Date orderFrom = DateUtils.addDays(orderTo, -WEEKLY_BEST_PRODUCT_PERIOD_DAYS);

		int rowsPerPage = WEEKLY_BEST_COLS * WEEKLY_BEST_ROWS;
		int startRownum = 1 + (((pageNumber - 1) * rowsPerPage));
		int endRownum = startRownum + rowsPerPage - 1;
		
		Map<String, Object> params = new HashMap<>();
		params.put("orderBySQL", orderByList.get(orderBy).sql);
		params.put("dirSQL", orderWayList.get(orderWay).sql);
		params.put("stockCondition", 1);
		params.put("productStatus", "정상");
		params.put("categoryNo", categoryNo);
		params.put("startRownum", startRownum);
		params.put("endRownum", endRownum);
		params.put("orderFrom", orderFrom);
		params.put("orderTo", orderTo);
		params.put("createFrom", createFrom);
		params.put("createTo", createTo);
		
		return productDao.getProductsByCategory(params);
	}

	public List<Map<String, Object>> getProductsToDisplayNewArrivalTable(int categoryNo, int orderBy, int orderWay) throws SQLException {
		
		int pageNumber = 1;
		
		Date createTo = new Date();
		Date createFrom = DateUtils.addMonths(createTo, -NEW_ARRIVAL_PERIOD_MONTHS);
		Date orderTo = createTo;
		Date orderFrom = createFrom;
		
		int rowsPerPage = NEW_ARRIVAL_COLS * NEW_ARRIVAL_ROWS;
		int startRownum = 1 + (((pageNumber - 1) * rowsPerPage));
		int endRownum = startRownum + rowsPerPage - 1;

		Map<String, Object> params = new HashMap<>();
		params.put("orderBySQL", orderByList.get(orderBy).sql);
		params.put("dirSQL", orderWayList.get(orderWay).sql);
		params.put("stockCondition", 1);
		params.put("productStatus", "정상");
		params.put("categoryNo", categoryNo);
		params.put("startRownum", startRownum);
		params.put("endRownum", endRownum);
		params.put("orderFrom", orderFrom);
		params.put("orderTo", orderTo);
		params.put("createFrom", createFrom);
		params.put("createTo", createTo);
		
		return productDao.getProductsByCategory(params);
	}
	
	public List<Map<String, Object>> getProdutsToDisplayBestTable(int categoryNo, int orderBy, int orderWay) throws SQLException {
		
		int pageNumber = 1;
		
		Date createTo = new Date();
		Date createFrom = DateUtils.addMonths(createTo, -DEFAULT_PERIOD_MONTHS);
		Date orderTo = new Date();
		Date orderFrom = DateUtils.addMonths(orderTo, -BEST_PRODUCT_PERIOD_MONTHS);
		
		int rowsPerPage = BEST_PRODUCT_COLS * BEST_PRODUCT_ROWS;
		int startRownum = 1 + (((pageNumber - 1) * rowsPerPage));
		int endRownum = startRownum + rowsPerPage - 1;
		
		Map<String, Object> params = new HashMap<>();
		params.put("orderBySQL", orderByList.get(orderBy).sql);
		params.put("dirSQL", orderWayList.get(orderWay).sql);
		params.put("stockCondition", 1);
		params.put("productStatus", "정상");
		params.put("categoryNo", categoryNo);
		params.put("startRownum", startRownum);
		params.put("endRownum", endRownum);
		params.put("orderFrom", orderFrom);
		params.put("orderTo", orderTo);
		params.put("createFrom", createFrom);
		params.put("createTo", createTo);

		return productDao.getProductsByCategory(params);
	}
	
	public List<Map<String, Object>> getProductsToDisplayProductsTable(int pageNumber, int categoryNo, int orderBy, int orderWay) throws SQLException {

		Date createTo = new Date();
		Date createFrom = DateUtils.addMonths(createTo, -DEFAULT_PERIOD_MONTHS);
		Date orderTo = createTo;
		Date orderFrom = createFrom;
		
		int rowsPerPage = PRODUCT_COLS * PRODUCT_ROWS;
		int startRownum = 1 + (((pageNumber - 1) * rowsPerPage));
		int endRownum = startRownum + rowsPerPage - 1;
		
		Map<String, Object> params = new HashMap<>();
		params.put("orderBySQL", orderByList.get(orderBy).sql);
		params.put("dirSQL", orderWayList.get(orderWay).sql);
		params.put("stockCondition", 0);
		params.put("productStatus", "정상");
		params.put("categoryNo", categoryNo);
		params.put("startRownum", startRownum);
		params.put("endRownum", endRownum);
		params.put("orderFrom", orderFrom);
		params.put("orderTo", orderTo);
		params.put("createFrom", createFrom);
		params.put("createTo", createTo);
		
		return productDao.getProductsByCategory(params);
	}	
	
	private int getProductsSizeByCategory(int categoryNo) throws SQLException {
		
		Map<String, Object> params = new HashMap<>();
		params.put("productStatus", "정상");
		params.put("categoryNo", categoryNo);
		
		Integer result = productDao.getProductsSizeByCategory(params);
		if(result != null) {
			return productDao.getProductsSizeByCategory(params);
		} else {
			return 0;
		}
	}
	
	public int getLastPageOfProductList(int categoryNo) throws SQLException {
		int size = getProductsSizeByCategory(categoryNo);
		return 1 + ((size - 1) / (PRODUCT_COLS * PRODUCT_ROWS));
	}
	
	public Category getCategoryByNo(int categoryNo) throws SQLException {
		return productDao.getCategoryByNo(categoryNo);
	}
	
	public List<Category> getCategoriesByLevel(int level) throws SQLException {
		return productDao.getCategoriesByLevel(level);
	}
	
	public List<Category> getSubCategoriesByNo(int categoryNo) throws SQLException {
		return productDao.getSubCategoriesByNo(categoryNo);
	}
	
	public List<OrderBy> getOrderByList() {
		return orderByList;
	}

	public List<OrderWay> getOrderWayList() {
		return orderWayList;
	}
	
// 김유호 [ 끝 ] -------------------------------------------------------------------------------------------------------------	
	
}