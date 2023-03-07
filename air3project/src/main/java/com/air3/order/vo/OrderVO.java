package com.air3.order.vo;

public class OrderVO {
	private long orderNo,use,totalPrice,price;
	private String orderName,orderDate,pay,productName,img,name;
	private long order_detailNo,productNo,quantity,revNo,flightno,useMoney,usemileage;
	private String orderStatus,id;
	String startDate, startStation, endDate, endStation;
	
	
	
	
	
	public long getUseMoney() {
		return useMoney;
	}
	public void setUseMoney(long useMoney) {
		this.useMoney = useMoney;
	}
	public long getUsemileage() {
		return usemileage;
	}
	public void setUsemileage(long usemileage) {
		this.usemileage = usemileage;
	}
	
	
	public long getFlightno() {
		return flightno;
	}
	public void setFlightno(long flightno) {
		this.flightno = flightno;
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
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
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
	public long getRevNo() {
		return revNo;
	}
	public void setRevNo(long revNo) {
		this.revNo = revNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}
	public long getUse() {
		return use;
	}
	public void setUse(long use) {
		this.use = use;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public long getOrder_detailNo() {
		return order_detailNo;
	}
	public void setOrder_detailNo(long order_detailNo) {
		this.order_detailNo = order_detailNo;
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
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", use=" + use + ", totalPrice=" + totalPrice + ", orderName="
				+ orderName + ", orderDate=" + orderDate + ", pay=" + pay + ", productName=" + productName
				+ ", order_detailNo=" + order_detailNo + ", productNo=" + productNo + ", quantity=" + quantity
				+ ", revNo=" + revNo + ", orderStatus=" + orderStatus + ", id=" + id + "]";
	}
	
	
	
	
	
	
	
}
