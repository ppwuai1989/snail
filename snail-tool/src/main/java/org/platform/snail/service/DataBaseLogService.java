package org.platform.snail.service;

import java.util.Map;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;

public interface DataBaseLogService {
	public void log(String log, String name, String old, String news, String type, SystemUser systemUser);

	public void log(int operateType, String operate, String old, String news, String objectValue, SystemUser systemUser,
			String logType);

	public DataResponse findList(Map<String, Object> condition, int start, int limit, String orderBy) throws Exception;

}
