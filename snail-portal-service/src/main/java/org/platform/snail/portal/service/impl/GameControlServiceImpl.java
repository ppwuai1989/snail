package org.platform.snail.portal.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.GameControlDao;
import org.platform.snail.portal.model.GameControl;
import org.platform.snail.portal.service.GameControlService;
import org.platform.snail.portal.vo.GameControlVo;
import org.platform.snail.portal.vo.SystemStateVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service
public class GameControlServiceImpl implements GameControlService {

	Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private GameControlDao gameControlDao;

	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse findControlList(GameControl control, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<GameControlVo> list = this.gameControlDao.findControlList(control, start, start + limit, orderBy);
		rst.setList(list);
		if (start < 1) {
			int allRows = this.gameControlDao.findControlListCount(control);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	@Override
	public DataResponse insertControl(JSONObject json, SystemUser systemUser) throws Exception {
		GameControl control = new GameControl();
		SnailBeanUtils.copyProperties(control, json);
		if (SnailUtils.isBlankString(control.getAreaOverlineChangeRate())) {
			return new DataResponse(false, "区域超线换牌率不能为空");
		}
		if (SnailUtils.isBlankString(control.getAreaWarningLine())) {
			return new DataResponse(false, "区域警戒线不能为空");
		}
		if (SnailUtils.isBlankString(control.getGameType())) {
			return new DataResponse(false, "游戏类型不能为空");
		}
		if (SnailUtils.isBlankString(control.getPlayerBankerRate())) {
			return new DataResponse(false, "玩家上庄牌率不能为空");
		}
		if (SnailUtils.isBlankString(control.getRobotBankerRate())) {
			return new DataResponse(false, "机器人上庄牌率不能为空");
		}
		if (SnailUtils.isBlankString(control.getStatus())) {
			return new DataResponse(false, "启用状态不能为空");
		}
		if (SnailUtils.isBlankString(control.getSysLoseLowerLimit())) {
			return new DataResponse(false, "系统放水最低限制不能为空");
		}
		if (SnailUtils.isBlankString(control.getSysStatusSwitchTime())) {
			return new DataResponse(false, "系统状态转换时间不能为空");
		}
		if (SnailUtils.isBlankString(control.getSysWinUpperLimit())) {
			return new DataResponse(false, "系统抽水最高限制不能为空");
		}
		if (SnailUtils.isBlankString(control.getTakeBankerRate())) {
			return new DataResponse(false, "庄家抽水率不能为空");
		}
		if (SnailUtils.isBlankString(control.getTakePlayerRate())) {
			return new DataResponse(false, "玩家抽水率不能为空");
		}
		this.gameControlDao.insertControl(control);
		this.dataBaseLogService.log(CommonKeys.logCreate, "添加", "", control.toString(), "游戏控制", systemUser, "33");

		return new DataResponse(true, "控制器添加成功！");
	}

	@Override
	public DataResponse updateControl(JSONObject json, SystemUser systemUser) throws Exception {
		GameControl control = new GameControl();
		SnailBeanUtils.copyProperties(control, json);
		if (SnailUtils.isBlankString(control.getAreaOverlineChangeRate())) {
			return new DataResponse(false, "区域超线换牌率不能为空");
		}
		if (SnailUtils.isBlankString(control.getAreaWarningLine())) {
			return new DataResponse(false, "区域警戒线不能为空");
		}
		if (SnailUtils.isBlankString(control.getGameType())) {
			return new DataResponse(false, "游戏类型不能为空");
		}
		if (SnailUtils.isBlankString(control.getPlayerBankerRate())) {
			return new DataResponse(false, "玩家上庄牌率不能为空");
		}
		if (SnailUtils.isBlankString(control.getRobotBankerRate())) {
			return new DataResponse(false, "机器人上庄牌率不能为空");
		}
		if (SnailUtils.isBlankString(control.getStatus())) {
			return new DataResponse(false, "启用状态不能为空");
		}
		if (SnailUtils.isBlankString(control.getSysLoseLowerLimit())) {
			return new DataResponse(false, "系统放水最低限制不能为空");
		}
		if (SnailUtils.isBlankString(control.getSysStatusSwitchTime())) {
			return new DataResponse(false, "系统状态转换时间不能为空");
		}
		if (SnailUtils.isBlankString(control.getSysWinUpperLimit())) {
			return new DataResponse(false, "系统抽水最高限制不能为空");
		}
		if (SnailUtils.isBlankString(control.getTakeBankerRate())) {
			return new DataResponse(false, "庄家抽水率不能为空");
		}
		if (SnailUtils.isBlankString(control.getTakePlayerRate())) {
			return new DataResponse(false, "玩家抽水率不能为空");
		}
		this.gameControlDao.updateControl(control);
		this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", "", control.toString(), "游戏控制", systemUser, "33");
		return new DataResponse(true, "更新控制器成功！");
	}

	@Override
	public DataResponse deleteControl(String id, SystemUser systemUser) throws Exception {
		this.gameControlDao.deleteControl(id);
		this.dataBaseLogService.log(CommonKeys.logDelete, "删除", "[id：" + id + "]", "", "游戏控制", systemUser, "33");
		return new DataResponse(true, "删除成功！");
	}

	@Override
	public DataResponse selectSystemState(String gameType) throws Exception {
		DataResponse rst = new DataResponse();
		SystemStateVo ss = this.gameControlDao.selectSystemState(gameType);
		if (ss != null) {
			if (ss.getGameType() != null && ss.getId() != null) {
				// 根据游戏类型找到当前正在启用状态的控制器，并查出转换时间
				GameControlVo control = this.gameControlDao.selectActiveControlByGameType(gameType);
				String switchTime = String.valueOf(Math.round(Float.valueOf(control.getSysStatusSwitchTime()) * 60 * 60*1000));// 单位是小时转换为秒
				// 计算下次转换时间
				Long lastSwitchTime = ss.getUpdateTime().getTime();
				Long nowTime = System.currentTimeMillis();
				String nextSwitchTime = String.valueOf(((lastSwitchTime + Long.valueOf(switchTime))-nowTime));
				ss.setNextSwitchTime(nextSwitchTime);// 返回一个剩余时间的秒数字符串
			}
			rst.setResponse(ss);
			rst.setState(true);
		} else {
			return new DataResponse(false, "未查询到系统状态信息！");
		}
		return rst;
	}

}
