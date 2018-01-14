package org.platform.snail.utils;

import java.util.ResourceBundle;

public class Config {

	//获取配置文件
	public static String getProperty(String key) {
		ResourceBundle resource = ResourceBundle.getBundle("properties");
		return resource.getString(key);
	}

}
