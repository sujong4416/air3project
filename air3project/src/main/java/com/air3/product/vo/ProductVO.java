package com.air3.product.vo;

public class ProductVO {
	
	private long productno;
	private String name,description,writeDate,img;
	private long price,stock,quantity;
	public long getProductno() {
		return productno;
	}
	public void setProductno(long productno) {
		this.productno = productno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public long getStock() {
		return stock;
	}
	public void setStock(long stock) {
		this.stock = stock;
	}
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "ProductVO [productno=" + productno + ", name=" + name + ", description=" + description + ", writeDate="
				+ writeDate + ", img=" + img + ", price=" + price + ", stock=" + stock + ", quantity=" + quantity + "]";
	}
	

}
