package org.platform.snail.utils;

public interface CommonKeys {

	String SystemUser = "SystemUser";

	String CWebPath = "CWebPath";

	int GRID_DEFAULT_PAGE_SIZE = 25;

	String dictPath = "/content/js/common/dict.js";

	String dictAppKey = "dictAppKey";
	// 对应 日志CRUD
	int logCreate = 1;
	int logRetrieve = 2;
	int logUpdate = 3;
	int logDelete = 4;

	// 代理等级start
	/**
	 * 高级--3
	 */
	String senior = "3";
	/**
	 * 中级--2
	 */
	String medium = "2";
	/**
	 * 初级--1
	 */
	String junior = "1";
	// 代理等级end

	// 充值方式 start，2--代理代充，3--管理员充值
	/**
	 * 1--游戏内充值
	 */
	String wayOfInGame = "1";
	/**
	 * 2--代理代充
	 */
	String wayOfAgent = "2";
	/**
	 * 3--管理员充值
	 */
	String wayOfSystemUser = "3";
	// 充值方式 end

	// 初级代理对应的角色编号（对应数据库中role）
	String superManager = "1";
	String seniorAgent = "2";
	String mediumAgent = "3";
	String juniorAgent = "4";
	String directlyUnderAgent = "5";
	String systemManager = "6";

	// goodsName 商品名称！用于商城购买物品
	/**
	 * 1--金币
	 */
	String goods_coins = "1";
	/**
	 * 2--比武卡
	 */
	String goods_pkCard = "2";

}
