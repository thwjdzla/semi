package semi.vo;

import java.util.Date;

import semi.utils.DateUtil;

public class Notice {

	private int no;
	
	private int adminNo;
	
	private String adminId;
	
	private String subject;
	
	private String contents;
	
	private int viewCount;
	
	private String status;
	
	private Date createDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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
