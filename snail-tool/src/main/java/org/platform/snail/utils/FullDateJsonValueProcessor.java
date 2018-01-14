package org.platform.snail.utils;

import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class FullDateJsonValueProcessor implements JsonValueProcessor {
	
	Logger logger = null;
	public static String format = "yyyy-MM-dd  HH:mm:ss";

	public FullDateJsonValueProcessor() {
		logger = LogManager.getLogger(FullDateJsonValueProcessor.class);
	}

	public Object processArrayValue(Object target, JsonConfig config) {
		return process(target);

	}

	public Object processObjectValue(String key, Object target, JsonConfig config) {

		return process(target);

	}

	private String process(Object target) {
		String rst = "";
		if (target != null) {
			if (target instanceof Date) {
				Date p = (Date) target;
				try {
					java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(format);
					rst = formatter.format(p);
				} catch (Exception ex) {
					logger.error("格式化日期失败：" + ex.getMessage() + "\tformatter:" + format);
				}
			}
		}
		return rst;
	}

}
