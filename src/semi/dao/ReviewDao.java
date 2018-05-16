package semi.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import semi.utils.IbatisUtil;
import semi.vo.AdminComment;
import semi.vo.Review;
import semi.vo.ReviewRecommendHistory;

public class ReviewDao {

	private static ReviewDao instance;
	
	private SqlMapClient sqlMapper;
	
	static {
		instance = new ReviewDao();
	}
	
	private ReviewDao() {
		sqlMapper = IbatisUtil.getsqlMap();
	}
	
	public static ReviewDao getInstance() {
		return instance;
	}	
	
	@SuppressWarnings("unchecked")
	public List<Review> getAllReviews() throws SQLException {
		return sqlMapper.queryForList("getAllReviews");
	}
	
	@SuppressWarnings("unchecked")
	public List<Review> getThisReviews(int no) throws SQLException {
		return sqlMapper.queryForList("getThisReviews", no);
	}
	
	public Review getThisGrade(int no) throws SQLException {
		return (Review) sqlMapper.queryForObject("getThisGrade", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByCategory (int category) throws SQLException {
		return sqlMapper.queryForList("getReviewsByCategory", category);
	}
	
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByProName () throws SQLException {
		return sqlMapper.queryForList("getReviewsByProName");
	}
	
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByLowPrice () throws SQLException {
		return sqlMapper.queryForList("getReviewsByLowPrice");
	}
	
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByHighPrice () throws SQLException {
		return sqlMapper.queryForList("getReviewsByHighPrice");
	}

	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByHighGrade () throws SQLException {
		return sqlMapper.queryForList("getReviewsByHighGrade");
	}
	
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByManys () throws SQLException {
		return sqlMapper.queryForList("getReviewsByManys");
	}
	
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByBestSell () throws SQLException {
		return sqlMapper.queryForList("getReviewsByBestSell");
	}

	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByHighSale () throws SQLException {
		return sqlMapper.queryForList("getReviewsByHighSale");
	}
	
	public void addNewReview(Review review) throws SQLException {
		sqlMapper.insert("addNewReview", review);
	}
	
	public List<AdminComment> getAdminCommentInfoByReviewNo(Map<String,Object> map) throws SQLException {
		return (List<AdminComment>) sqlMapper.queryForList("getAdminCommentInfoByReviewNo", map);
	}
	
	public Review getReviewByProNoAndCustId(Map<String, Object> map) throws SQLException {
		return (Review) sqlMapper.queryForObject("getReviewByProNoAndCustId", map);
	}
	@SuppressWarnings("unchecked")
	public ReviewRecommendHistory getReviewHistoryByReviewNoAndCustNo(Map<String, Object> map) throws SQLException {
		return (ReviewRecommendHistory) sqlMapper.queryForObject("getReviewHistoryByReviewNoAndCustNo", map);
	}
}
