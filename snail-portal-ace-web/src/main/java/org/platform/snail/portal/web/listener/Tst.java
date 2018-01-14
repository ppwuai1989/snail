package org.platform.snail.portal.web.listener;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.platform.snail.beans.SystemUser;
import org.platform.snail.model.Resources;
import javax.servlet.jsp.jstl.core.ConditionalTagSupport;

public class Tst {
	SystemUser systemUser = new SystemUser();
	Map<String, Resources> map = systemUser.getMap();
	// 取前四个作为快捷方式
	List<String> urlList = getStringList(map);
	String url_Btn1 = urlList.get(0);
	String url_Btn2 = urlList.get(1);
	String url_Btn3 = urlList.get(2);
	String url_Btn4 = urlList.get(3);

	public List<String> getStringList(Map<String, Resources> urlMap) {
		List<String> l = new ArrayList();
		for (Entry<String, Resources> e : urlMap.entrySet()) {
			if (e.getValue().getResourcesType() == "2") {
				l.add(e.getValue().getResourcesName() + "|" + e.getValue().getResourcesUrl());
			}
		}
		
		return l;
	}
}
