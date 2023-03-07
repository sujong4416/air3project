package com.air3.serviceInfo.vo;

public class ServiceInfoVO {

	// 번호, 제목, 내용, 작성자, 작성일, 조회수, 비밀번호
	private long no;
	private String title, content, writeDate, updateDate, id, fileName;
	private long gradeNo;
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(long gradeNo) {
		this.gradeNo = gradeNo;
	}
	@Override
	public String toString() {
		return "ServiceInfoVO [no=" + no + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", updateDate=" + updateDate + ", id=" + id + ", fileName=" + fileName + ", gradeNo=" + gradeNo + "]";
	}

	
}
