package com.air3.member.vo;

public class MemberVO {
	
	private String id, pw, name, e_name, gender, birth, tel, email, email1, email2, country, 
			p_nationality, p_country, p_no, p_date, regDate, conDate, status;
	private int gradeNo;
	private String gradeName;
	private int mileage;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getP_nationality() {
		return p_nationality;
	}
	public void setP_nationality(String p_nationality) {
		this.p_nationality = p_nationality;
	}
	public String getP_country() {
		return p_country;
	}
	public void setP_country(String p_country) {
		this.p_country = p_country;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getConDate() {
		return conDate;
	}
	public void setConDate(String conDate) {
		this.conDate = conDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", e_name=" + e_name + ", gender=" + gender
				+ ", birth=" + birth + ", tel=" + tel + ", email=" + email + ", email1=" + email1 + ", email2=" + email2
				+ ", country=" + country + ", p_nationality=" + p_nationality + ", p_country=" + p_country + ", p_no="
				+ p_no + ", p_date=" + p_date + ", regDate=" + regDate + ", conDate=" + conDate + ", status=" + status
				+ ", gradeNo=" + gradeNo + ", gradeName=" + gradeName + ", mileage=" + mileage + "]";
	}

	
	
}
