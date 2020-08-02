package com.kh.bunny.love.model.vo;

public class Love {
	private int lno;
	private int pno;
	private String userId;

	public Love() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Love(int lno, int pno, String userId) {
		super();
		this.lno = lno;
		this.pno = pno;
		this.userId = userId;
	}

	public int getLno() {
		return lno;
	}

	public void setLno(int lno) {
		this.lno = lno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "LoveServiceImpl [lno=" + lno + ", pno=" + pno + ", userId=" + userId + "]";
	}
}
