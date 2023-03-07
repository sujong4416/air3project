package com.air3.mileage.vo;

public class MileageVO {

	private int save; // 적립번호
	private String id; // 아이디
	private int smoney, balance; // 적립액, 잔액
	private String regdt, smemo; // 적립일, 적립내용
	
	private int use, orderNo, revNo; // 차감번호, 주문번호, 예약번호
	
	private int umoney; // 차감액
	
	private int checkPeriod, checkType; // 조회기간, 조회유형 ( 마일리지 상세조회 )
	private String startDate, endDate; // 조회기간 선택 시작일, 종료일
	
	public int getSave() {
		return save;
	}
	public void setSave(int save) {
		this.save = save;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSmoney() {
		return smoney;
	}
	public void setSmoney(int smoney) {
		this.smoney = smoney;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getRegdt() {
		return regdt;
	}
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}
	public String getSmemo() {
		return smemo;
	}
	public void setSmemo(String smemo) {
		this.smemo = smemo;
	}
	public int getUse() {
		return use;
	}
	public void setUse(int use) {
		this.use = use;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getRevNo() {
		return revNo;
	}
	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}
	public int getUmoney() {
		return umoney;
	}
	public void setUmoney(int umoney) {
		this.umoney = umoney;
	}
	public int getCheckPeriod() {
		return checkPeriod;
	}
	public void setCheckPeriod(int checkPeriod) {
		this.checkPeriod = checkPeriod;
	}
	public int getCheckType() {
		return checkType;
	}
	public void setCheckType(int checkType) {
		this.checkType = checkType;
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
	@Override
	public String toString() {
		return "MileageVO [save=" + save + ", id=" + id + ", smoney=" + smoney + ", balance=" + balance + ", regdt="
				+ regdt + ", smemo=" + smemo + ", use=" + use + ", orderNo=" + orderNo + ", revNo=" + revNo
				+ ", umoney=" + umoney + ", checkPeriod=" + checkPeriod + ", checkType=" + checkType + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}

	
	
}
