package semi.vo;

public class ShippingClass {

	private int customerNo;
	
	private int shippingClassNo;
	
	private String shippingClassName;
	
	private String receiverName;
	
	private String postcode;
	
	private String firstAddress;
	
	private String secondAddress;
	
	private String tel;
	
	private String message;

	public String getShippingClassName() {
		return shippingClassName;
	}

	public void setShippingClassName(String shippingClassName) {
		this.shippingClassName = shippingClassName;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public int getShippingClassNo() {
		return shippingClassNo;
	}

	public void setShippingClassNo(int shippingClassNo) {
		this.shippingClassNo = shippingClassNo;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getFirstAddress() {
		return firstAddress;
	}

	public void setFirstAddress(String firstAddress) {
		this.firstAddress = firstAddress;
	}

	public String getSecondAddress() {
		return secondAddress;
	}

	public void setSecondAddress(String secondAddress) {
		this.secondAddress = secondAddress;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}