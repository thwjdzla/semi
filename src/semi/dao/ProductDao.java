package semi.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import semi.utils.IbatisUtil;
import semi.vo.Category;
import semi.vo.ProductDetail;
import semi.vo.ProductQuestions;
import semi.vo.ProductReviews;

public class ProductDao {

	private static ProductDao instance;
	
	private SqlMapClient sqlMapper;
	
	static {
		instance = new ProductDao();
	}
	
	private ProductDao() {
		sqlMapper = IbatisUtil.getsqlMap();
	}
	
	public static ProductDao getInstance() {
		return instance;
	}	
	
	@SuppressWarnings("unchecked")
	public List<ProductDetail> getProductByNumber(int no) throws SQLException {
		return (List<ProductDetail>) sqlMapper.queryForList("getProductByNumber", no);		 
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getProductColorByProNo(int no) throws SQLException {
		return (List<String>) sqlMapper.queryForList("getProductColorByProNo", no);
	}
	@SuppressWarnings("unchecked")
	public List<String> getProductSizeByProNo(int no) throws SQLException {
		return (List<String>) sqlMapper.queryForList("getProductSizeByProNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<ProductQuestions> getProductQuestionsByProNo(int no) throws SQLException {
		return sqlMapper.queryForList("getProductQuestionsByProNo", no);
	}
	public List<ProductQuestions> getProductQuestionsByProNoAndRange(Map<String, Object> map) throws SQLException {
		return sqlMapper.queryForList("getProductQuestionsByProNoAndRange", map);
	}
	@SuppressWarnings("unchecked")
	public List<String> getSixReviewImagesByProNo(int no) throws SQLException {
		return (List<String>) sqlMapper.queryForList("getSixReviewImagesByProNo", no);
	}
	@SuppressWarnings("unchecked")
	public List<String> getFourReviewImagesByProNo(int no) throws SQLException {
		return (List<String>) sqlMapper.queryForList("getFourReviewImagesByProNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<ProductReviews> getProductReviewsByProNoOrderByNew(int no) throws SQLException {
		return (List<ProductReviews>) sqlMapper.queryForList("getProductReviewsByProNoOrderByNew", no);
	}
	@SuppressWarnings("unchecked")
	public List<ProductReviews> getProductReviewsByProNoOrderbyGrade(int no) throws SQLException {
		return (List<ProductReviews>) sqlMapper.queryForList("getProductReviewsByProNoOrderbyGrade", no);
	}
	@SuppressWarnings("unchecked")
	public List<ProductReviews> getProductReviewsByProNoOrderbyWithPic(int no) throws SQLException {
		return (List<ProductReviews>) sqlMapper.queryForList("getProductReviewsByProNoOrderbyWithPic", no);
	}
	public double getProductScoreByProNo(int no) throws SQLException {
		return (double) sqlMapper.queryForObject("getProductScoreByProNo", no);
	}
	
	public void plusReviewLike(Map<String, Object> map) throws SQLException {
		sqlMapper.update("plusReviewLike", map);
	}
	public void insertReviewLikeHistory(Map<String, Object> map) throws SQLException {
		sqlMapper.update("insertReviewLikeHistory", map);
	}
	public void minusReviewLike(Map<String, Object> map) throws SQLException {
		sqlMapper.update("minusReviewLike", map);
	}
	public void deleteReviewLikeHistory(Map<String, Object> map) throws SQLException {
		sqlMapper.update("deleteReviewLikeHistory", map);
	}
	public int getReviewLike(Map<String, Object> map) throws SQLException {
		return (int)sqlMapper.queryForObject("getReviewLike",  map);
	}
	@SuppressWarnings("unchecked")
	public List<Integer> getSoldCountTopThreeProductNo() throws SQLException {
		return (List<Integer>) sqlMapper.queryForList("getSoldCountTopThreeProductNo");
	}
	@SuppressWarnings("unchecked")
	public List<ProductReviews> getProductReviewsByProNoOrderByNewAndRange(Map<String, Object> map) throws SQLException {
		return (List<ProductReviews>) sqlMapper.queryForList("getProductReviewsByProNoOrderByNewAndRange", map);
	}
	@SuppressWarnings("unchecked")
	public List<ProductReviews> getProductReviewsByProNoOrderByGradeAndRange(Map<String, Object> map) throws SQLException {
		return (List<ProductReviews>) sqlMapper.queryForList("getProductReviewsByProNoOrderByGradeAndRange", map);
	}
	@SuppressWarnings("unchecked")
	public List<ProductReviews> getProductReviewsByProNoOrderByNewAndRangeAndWithPhoto(Map<String, Object> map) throws SQLException {
		return (List<ProductReviews>) sqlMapper.queryForList("getProductReviewsByProNoOrderByNewAndRangeAndWithPhoto", map);
	}
	@SuppressWarnings("unchecked")
	public List<ProductReviews> getProductReviewsByProNoOrderByGradeAndRangeAndWithPhoto(Map<String, Object> map) throws SQLException {
		return (List<ProductReviews>) sqlMapper.queryForList("getProductReviewsByProNoOrderByGradeAndRangeAndWithPhoto", map);
	}
//-------------------------------------------- *김유호 [ 시작 ] ------------------------------------------------------
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getProductsByCategory(Map<String, Object> params) throws SQLException {
		return (List<Map<String,Object>>) sqlMapper.queryForList("getProductsByCategory", params);
	}
	
	public Integer getProductsSizeByCategory(Map<String, Object> params) throws SQLException{
		return (Integer) sqlMapper.queryForObject("getProductsSizeByCategory", params);
	}
	
	@SuppressWarnings("unchecked")
	public List<Category> getCategoriesByLevel(int level) throws SQLException{
		return (List<Category>) sqlMapper.queryForList("getCategoriesByLevel", level);
	}

	public Category getCategoryByNo(int categoryNo) throws SQLException {
		return (Category) sqlMapper.queryForObject("getCategoryByNo",categoryNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Category> getSubCategoriesByNo(int categoryNo) throws SQLException {
		return (List<Category>) sqlMapper.queryForList("getSubCategoriesByNo", categoryNo);
	}
	
	//--------------------------------------------- *김유호 [ 끝 ] -------------------------------------------------------
	
	
	//-------------------------------------------- 송재호 [CartItem] ----------------------------------------------------
	public void addNewCartItem(Map<String, Object> map) throws SQLException {
		sqlMapper.insert("addNewCartItem", map);
	}
	//-------------------------------------------- 송재호 [끝] ----------------------------------------------------
}