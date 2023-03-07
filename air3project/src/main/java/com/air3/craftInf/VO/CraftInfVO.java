package com.air3.craftInf.VO;

public class CraftInfVO {
	
	long cNo, cDistance, cChairRowN, cChairN, cSpeed, cDiv ;
	
	String cName, cImg, cChairImg, cChairLineN ;
	
	
	public long getcDiv() {
		return cDiv;
	}
	public void setcDiv(long cDiv) {
		this.cDiv = cDiv;
	}
	public String getcChairLineN() {
		return cChairLineN;
	}
	public void setcChairLineN(String cChairLineN) {
		this.cChairLineN = cChairLineN;
	}
	public long getcNo() {
		return cNo;
	}
	public void setcNo(long cNo) {
		this.cNo = cNo;
	}
	public long getcDistance() {
		return cDistance;
	}
	public void setcDistance(long cDistance) {
		this.cDistance = cDistance;
	}
	public long getcChairRowN() {
		return cChairRowN;
	}
	public void setcChairRowN(long cChairRowN) {
		this.cChairRowN = cChairRowN;
	}
	public long getcChairN() {
		return cChairN;
	}
	public void setcChairN(long cChairN) {
		this.cChairN = cChairN;
	}
	public long getcSpeed() {
		return cSpeed;
	}
	public void setcSpeed(long cSpeed) {
		this.cSpeed = cSpeed;
	}
	
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcImg() {
		return cImg;
	}
	public void setcImg(String cImg) {
		this.cImg = cImg;
	}
	public String getcChairImg() {
		return cChairImg;
	}
	public void setcChairImg(String cChairImg) {
		this.cChairImg = cChairImg;
	}
	@Override
	public String toString() {
		return "CraftInfVO [cNo=" + cNo + ", cDistance=" + cDistance + ", cChairRowN=" + cChairRowN + ", cChairN="
				+ cChairN + ", cSpeed=" + cSpeed + ", cDiv=" + cDiv + ", cName=" + cName + ", cImg=" + cImg
				+ ", cChairImg=" + cChairImg + ", cChairLineN=" + cChairLineN + "]";
	}
	
	
	
	}
	
	

	