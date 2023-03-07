package com.air3.cart.vo;

import java.util.Arrays;

public class CartVO {
	//name,p.price,p.img
	private long flightNo,cartNo,productNo,quantity,price,totalPrice, orderNo ,revNo;
	private String id,name,img,orderStatus, orderName,pay;
	private String  startDate, startStation,endDate, endStation;
	private long productNum,use;
	private String[] bCartNoList,bProductList,nameList,quantityList,priceList,totalPriceLis;
	public long getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(long flightNo) {
		this.flightNo = flightNo;
	}
	public long getCartNo() {
		return cartNo;
	}
	public void setCartNo(long cartNo) {
		this.cartNo = cartNo;
	}
	public long getProductNo() {
		return productNo;
	}
	public void setProductNo(long productNo) {
		this.productNo = productNo;
	}
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}
	public long getRevNo() {
		return revNo;
	}
	public void setRevNo(long revNo) {
		this.revNo = revNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartStation() {
		return startStation;
	}
	public void setStartStation(String startStation) {
		this.startStation = startStation;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndStation() {
		return endStation;
	}
	public void setEndStation(String endStation) {
		this.endStation = endStation;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String[] getbCartNoList() {
		return bCartNoList;
	}
	public void setbCartNoList(String[] bCartNoList) {
		this.bCartNoList = bCartNoList;
	}
	public String[] getbProductList() {
		return bProductList;
	}
	public void setbProductList(String[] bProductList) {
		this.bProductList = bProductList;
	}
	public String[] getNameList() {
		return nameList;
	}
	public void setNameList(String[] nameList) {
		this.nameList = nameList;
	}
	public String[] getQuantityList() {
		return quantityList;
	}
	public void setQuantityList(String[] quantityList) {
		this.quantityList = quantityList;
	}
	public String[] getPriceList() {
		return priceList;
	}
	public void setPriceList(String[] priceList) {
		this.priceList = priceList;
	}
	public String[] getTotalPriceLis() {
		return totalPriceLis;
	}
	public void setTotalPriceLis(String[] totalPriceLis) {
		this.totalPriceLis = totalPriceLis;
	}
	
	public long getUse() {
		return use;
	}
	public void setUse(long use) {
		this.use = use;
	}
	@Override
	public String toString() {
		return "CartVO [flightNo=" + flightNo + ", cartNo=" + cartNo + ", productNo=" + productNo + ", quantity="
				+ quantity + ", price=" + price + ", totalPrice=" + totalPrice + ", orderNo=" + orderNo + ", revNo="
				+ revNo + ", id=" + id + ", name=" + name + ", img=" + img + ", orderStatus=" + orderStatus
				+ ", orderName=" + orderName + ", pay=" + pay + ", startDate=" + startDate + ", startStation="
				+ startStation + ", endDate=" + endDate + ", endStation=" + endStation + ", productNum=" + productNum
				+ ", use=" + use + ", bCartNoList=" + Arrays.toString(bCartNoList) + ", bProductList="
				+ Arrays.toString(bProductList) + ", nameList=" + Arrays.toString(nameList) + ", quantityList="
				+ Arrays.toString(quantityList) + ", priceList=" + Arrays.toString(priceList) + ", totalPriceLis="
				+ Arrays.toString(totalPriceLis) + "]";
	}
	
	

}
