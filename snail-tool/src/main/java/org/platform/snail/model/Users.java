package org.platform.snail.model;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.platform.snail.extra.CustomDateSerializer;

public class Users implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	/** 用户编号 */
	private String userId;
	/** 账户 */
	private String account;
	/** 密码 */
	private String password;
	/** 性别 */
	private String sex;
	/** 身份证号 */
	private String idCard;
	/** 用户名 */
	private String name;
	/** 部门编号 */
	private String departmentId;
	/** 行政编码 */
	private String areaCode;
	/** 出生日期 */
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date birthday;
	/** 状态（0停用正常1） */
	private String status;
	/** 最后登录时间 */
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date lastLoginTime;
	/** 手机号 */
	private String mobile;
	/** 电子邮箱 */
	private String email;
	/** 座位 */
	private String seat;
	/** 用户级别 */
	private String userLevel;
	/** 创建时间 */
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", account=" + account + ", password=" + password + ", sex=" + sex
				+ ", idCard=" + idCard + ", name=" + name + ", departmentId=" + departmentId + ", birthday=" + birthday
				+ ", status=" + status + ", lastLoginTime=" + lastLoginTime + ", mobile=" + mobile + ", email=" + email
				+ ", seat=" + seat + ", userLevel=" + userLevel + ", createTime=" + createTime + "]";
	}

}
