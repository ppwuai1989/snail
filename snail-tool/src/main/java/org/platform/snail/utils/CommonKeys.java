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
	// 对应代理等级 初级--1 中级--2 高级--3
	String senior = "3";
	String medium = "2";
	String junior = "1";
	// 对应充值方式 1--游戏内，2--代理代充，3--管理员充值
	String wayOfInGame = "1";
	String wayOfAgent = "2";
	String wayOfSystemUser = "3";
}
