package jeju;

public class ProductVO {
	int productNum;
	String productClassification;
	String productName;
	String productImage;	
	int productPrice;	
	String productLocation;
	String productCommon;
	String productInternal;
	String productRoomType;
	String productPickup;
	String productInfo;
	String productId;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}	
	public int getProductNum() {
		return productNum;
	}
	
	
	public void setProductClassification(String productClassification) {
		this.productClassification = productClassification;
	}	
	public String getProductClassification() {
		return productClassification;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	
	
	
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		/* int productPriceInt = Integer.parseInt(productPriceString) ; */
		this.productPrice = productPrice;
	}
	
	
	
	public String getProductLocation() {
		return productLocation;
	}
	public void setProductLocation(String productLocation) {
		this.productLocation = productLocation;
	}
	public String getProductCommon() {
		return productCommon;
	}
	public void setProductCommon(String productCommon) {
		this.productCommon = productCommon;
	}
	public String getProductInternal() {
		return productInternal;
	}
	public void setProductInternal(String productInternal) {
		this.productInternal = productInternal;
	}
	public String getProductRoomType() {
		return productRoomType;
	}
	public void setProductRoomType(String productRoomType) {
		this.productRoomType = productRoomType;
	}
	public String getProductPickup() {
		return productPickup;
	}
	public void setProductPickup(String productPickup) {
		this.productPickup = productPickup;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	
}
