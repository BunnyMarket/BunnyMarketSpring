package com.kh.bunny.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

public class Member implements Serializable{
	
	private static final long serialVersionUID = 1004L;
	
	private String userId;
	private String userName;
	private String userPwd;
	private String email;
	private String nickName;
	private String phone;
	private String birth;
	private String introduce;
	private String photo;
	private String epilogue;
	private int nowPoint;
	private int count;
	private int mStatus;
	
	public Member() { }

	public Member(String userId, String userName, String userPwd, String email, String nickName, String phone,
			String birth, String introduce, String photo, String epilogue, int nowPoint, int count, int mStatus) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.birth = birth;
		this.introduce = introduce;
		this.photo = photo;
		this.epilogue = epilogue;
		this.nowPoint = nowPoint;
		this.count = count;
		this.mStatus = mStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEpilogue() {
		return epilogue;
	}

	public void setEpilogue(String epilogue) {
		this.epilogue = epilogue;
	}

	public int getNowPoint() {
		return nowPoint;
	}

	public void setNowPoint(int nowPoint) {
		this.nowPoint = nowPoint;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getmStatus() {
		return mStatus;
	}

	public void setmStatus(int mStatus) {
		this.mStatus = mStatus;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", email=" + email
				+ ", nickName=" + nickName + ", phone=" + phone + ", birth=" + birth + ", introduce=" + introduce
				+ ", photo=" + photo + ", epilogue=" + epilogue + ", nowPoint=" + nowPoint + ", count=" + count
				+ ", mStatus=" + mStatus + "]";
	}

	
}
