package semi.vo;

import java.util.Date;

import semi.utils.DateUtil;

public class ProductReviews {
	
	private int reviewNo;
	private int proNo;
	private int custNo;
	private String contents;
	private int recommendCnt;
	private double grade;
	private String status;
	private Date createDate;
	private String img;

	private int custWeight;
	private int custheight;
	private String custSize;

	public int getCustWeight() {
		return custWeight;
	}
	public void setCustWeight(int custWeight) {
		this.custWeight = custWeight;
	}
	public int getCustheight() {
		return custheight;
	}
	public void setCustheight(int custheight) {
		this.custheight = custheight;
	}
	public String getCustSize() {
		return custSize;
	}
	public void setCustSize(String custSize) {
		this.custSize = custSize;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public int getCustNo() {
		return custNo;
	}
	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getRecommendCnt() {
		return recommendCnt;
	}
	public void setRecommendCnt(int recommendCnt) {
		this.recommendCnt = recommendCnt;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public String getCreateDateSDF() {
		return DateUtil.dateToString(createDate);
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
