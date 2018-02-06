package org.platform.snail.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.platform.snail.beans.ValidateResult;

public class ValidatorUtils {

	public static ValidateResult isMobile(String mobile) {
		String regex = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[013678])|(18[0,5-9]))\\d{8}$";
		if (mobile.length() != 11) {
			return new ValidateResult(false, "手机号必须为11位！");
		} else {
			Pattern p = Pattern.compile(regex);
			Matcher m = p.matcher(mobile);
			boolean isMatch = m.matches();
			if (isMatch) {
				return new ValidateResult();
			} else {
				return new ValidateResult(false, "请输入正确的手机号码");
			}
		}
	}

}
