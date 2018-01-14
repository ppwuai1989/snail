package org.platform.snail.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.dao.DataBaseLogDao;
import org.platform.snail.model.Logs;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.CommonKeys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("dataBaseLogService")
public class DataBaseLogServiceImpl implements DataBaseLogService {
	@Autowired
	private DataBaseLogDao dataBaseLogDao;
	public Logger logger = LogManager.getLogger(this.getClass());

	private static final long serialVersionUID = 1L;

	public void log(String log, String name, String old, String news, String objectValue, SystemUser systemUser) {
		logger.info(systemUser.getUsers().getName() + " " + log + " " + objectValue);
		Logs logs = new Logs();
		logs.setLog(log);
		logs.setName(name);
		logs.setNews(news);
		logs.setOld(old);
		logs.setObjectValue(objectValue);
		logs.setUserId(systemUser.getUsers().getUserId());
		logs.setUserName(systemUser.getUsers().getName());
		logs.setLogType("");
		this.dataBaseLogDao.insert(logs);
	}

	/**
	 * 重载为一般情况 id为{userId}的用户{userName},在{timeNow}
	 * 对{objectValue}进行了{operateName}操作,将旧值{old}改为了新值{news}
	 */
	public void log(int operateType, String operate, String old, String news, String objectValue, SystemUser systemUser,
			String logType) {
		Logs logs = new Logs();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeNow = df.format(new Date());
		StringBuffer logDetail = new StringBuffer();
		logDetail.append("id为" + systemUser.getUsers().getUserId());
		logDetail.append("的用户" + systemUser.getUsers().getName());
		logDetail.append(",在" + timeNow);
		logDetail.append("对" + objectValue);
		logDetail.append("做了" + operate + "操作");
		switch (operateType) {
		case CommonKeys.logCreate:
			logDetail.append(":添加了" + news + "。");
			break;
		case CommonKeys.logRetrieve:
			logDetail.append("。");
			break;
		case CommonKeys.logUpdate:
			logDetail.append(":将旧值" + old + "更新为" + news + "。");
			break;
		case CommonKeys.logDelete:
			logDetail.append(":删除了" + old + "。");
			break;
		}
		logs.setLog(logDetail.toString());
		logs.setName(operate);
		logs.setNews(news);
		logs.setOld(old);
		logs.setObjectValue(objectValue);
		logs.setLogType(logType);
		logs.setUserId(systemUser.getUsers().getUserId());
		logs.setUserName(systemUser.getUsers().getName());
		// logs.setIp(systemUser.getIp());
		this.dataBaseLogDao.insert(logs);

	}

	public DataResponse findList(Map<String, Object> condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<Logs> list = this.dataBaseLogDao.findList(condition, start, start + limit, orderBy);
		rst.setList(list);
		if (start <= 1) {
			int allRows = this.dataBaseLogDao.findCount(condition);
			rst.setAllRows(allRows);
		}
		return rst;
	}

}
