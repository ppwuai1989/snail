package org.platform.snail.portal.model;

import java.io.Serializable;
import java.util.Date;

import org.platform.snail.extra.CustomDateSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class MallSettings implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String goodsId;
	
	private String goodsName;
	
	private String amount;
	
	private String price;
	
	private String juniorRate;
	
	private String mediumRate;
	
	private String seniorRate;
	
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getJuniorRate() {
		return juniorRate;
	}
	public void setJuniorRate(String juniorRate) {
		this.juniorRate = juniorRate;
	}
	public String getMediumRate() {
		return mediumRate;
	}
	public void setMediumRate(String mediumRate) {
		this.mediumRate = mediumRate;
	}
	public String getSeniorRate() {
		return seniorRate;
	}
	public void setSeniorRate(String seniorRate) {
		this.seniorRate = seniorRate;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "MallSettings [id=" + id + ", goodsId=" + goodsId + ", goodsName=" + goodsName + ", amount=" + amount
				+ ", price=" + price + ", juniorRate=" + juniorRate + ", mediumRate=" + mediumRate + ", seniorRate="
				+ seniorRate + ", createTime=" + createTime + "]";
	}
	
}
