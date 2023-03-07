package com.air3.member.vo;

public class LoginVO {

	private String id, name, ename;
	private int gradeNo;
	private String gradeName, pw;
	private int mileage;
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
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", name=" + name + ", ename=" + ename + ", gradeNo=" + gradeNo + ", gradeName="
				+ gradeName + ", pw=" + pw + ", mileage=" + mileage + "]";
	}


	

}
