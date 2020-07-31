package com.kh.bunny.review.model.vo;

public class Review {
	
	private int reno;
	private int dno;
	private String rewriter;
	private String recontent;
	private String sellerid;
	private int rating;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int reno, int dno, String rewriter, String recontent, String sellerid, int rating) {
		super();
		this.reno = reno;
		this.dno = dno;
		this.rewriter = rewriter;
		this.recontent = recontent;
		this.sellerid = sellerid;
		this.rating = rating;
	}
	public int getReno() {
		return reno;
	}
	public void setReno(int reno) {
		this.reno = reno;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getRewriter() {
		return rewriter;
	}
	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "Review [reno=" + reno + ", dno=" + dno + ", rewriter=" + rewriter + ", recontent=" + recontent
				+ ", sellerid=" + sellerid + ", rating=" + rating + "]";
	}
	
	
	
}
