package com.air3.flightInf.VO;

public class FlightInfVO {
	
	long flightNo, cNo, price ;
	String startStation, startCon, endCon, endStation, startDate, endDate, cName;
	
	
	public long getcNo() {
		return cNo;
	}
	public void setcNo(long cNo) {
		this.cNo = cNo;
	}
	public long getCNo() {
		return cNo;
	}
	public void setCNo(long craftNo) {
		this.cNo = craftNo;
	}
	public long getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(long flightNo) {
		this.flightNo = flightNo;
	}
	
	
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getStartStation() {
		return startStation;
	}
	public void setStartStation(String startStation) {
		this.startStation = startStation;
	}
	public String getStartCon() {
		return startCon;
	}
	public void setStartCon(String startCon) {
		this.startCon = startCon;
	}
	public String getEndCon() {
		return endCon;
	}
	public void setEndCon(String endCon) {
		this.endCon = endCon;
	}
	public String getEndStation() {
		return endStation;
	}
	public void setEndStation(String endStation) {
		this.endStation = endStation;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	@Override
	public String toString() {
		return "FlightInfVO [flightNo=" + flightNo + ", cNo=" + cNo + ", price=" + price + ", startStation="
				+ startStation + ", startCon=" + startCon + ", endCon=" + endCon + ", endStation=" + endStation
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", cName=" + cName + "]";
	}
	
	
	
	
}
