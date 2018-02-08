package org.platform.snail.portal.service.impl;

import java.util.List;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.MallSettingsDao;
import org.platform.snail.portal.model.MallSettings;
import org.platform.snail.portal.service.MallSettingsService;
import org.platform.snail.portal.vo.MallSettingsVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service
public class MallSettingsServiceImpl implements MallSettingsService {

	@Autowired
	private MallSettingsDao mallDao;

	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse findList(MallSettings condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<MallSettingsVo> list = this.mallDao.findList(condition, start, start + limit, orderBy);
		rst.setList(list);
		if (start < 1) {
			int allRows = this.mallDao.findListCount(condition);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	@Override
	public DataResponse insertSettings(JSONObject jsonObject, SystemUser systemUser) throws Exception {
		MallSettings settings = new MallSettings();
		SnailBeanUtils.copyProperties(settings, jsonObject);
		if (SnailUtils.isBlankString(settings.getGoodsId())) {
			return new DataResponse(false, "请选择一个商品！");
		}
		if (SnailUtils.isBlankString(settings.getPrice())) {
			return new DataResponse(false, "请输入一个价格！");
		} else {
			settings.setPrice(String.valueOf(Integer.valueOf(settings.getPrice())));
		}
		if (SnailUtils.isBlankString(settings.getJuniorRate())) {
			return new DataResponse(false, "请输入初级代理赠送率！");
		}
		if (SnailUtils.isBlankString(settings.getJuniorRate())) {
			return new DataResponse(false, "请输入中级代理赠送率！");
		}
		if (SnailUtils.isBlankString(settings.getJuniorRate())) {
			return new DataResponse(false, "请输入高级代理赠送率！");
		}
		// 检查是否存在同一商品价格相同的设置
		if (this.mallDao.isExitsUnique(settings.getGoodsId(), settings.getPrice(), "") > 0) {
			return new DataResponse(false,
					"编号为[" + settings.getGoodsId() + "]，价格为[" + settings.getPrice() + "]的商品已经存在！");
		}
		int insert = this.mallDao.insertSettings(settings);
		if (insert > 0) {
			this.dataBaseLogService.log(CommonKeys.logCreate, "添加", "", settings.toString(), "商城设置", systemUser, "36");
			return new DataResponse(true, "添加商品设置成功！");
		} else {
			return new DataResponse(false, "添加商品设置失败！");
		}

	}

	@Override
	public DataResponse updateSettings(JSONObject jsonObject, SystemUser systemUser) throws Exception {
		MallSettings settings = new MallSettings();
		SnailBeanUtils.copyProperties(settings, jsonObject);
		if (SnailUtils.isBlankString(settings.getGoodsId())) {
			return new DataResponse(false, "请选择一个商品！");
		}
		if (SnailUtils.isBlankString(settings.getPrice())) {
			return new DataResponse(false, "请输入一个价格！");
		} else {
			settings.setPrice(String.valueOf((int)(Float.parseFloat(settings.getPrice()))));
		}
		if (SnailUtils.isBlankString(settings.getJuniorRate())) {
			return new DataResponse(false, "请输入初级代理赠送率！");
		}
		if (SnailUtils.isBlankString(settings.getJuniorRate())) {
			return new DataResponse(false, "请输入中级代理赠送率！");
		}
		if (SnailUtils.isBlankString(settings.getJuniorRate())) {
			return new DataResponse(false, "请输入高级代理赠送率！");
		}
		// 检查是否存在同一商品价格相同的设置
		if (this.mallDao.isExitsUnique(settings.getGoodsId(), settings.getPrice(), settings.getId()) > 0) {
			return new DataResponse(false, "更新失败，存在相同的商品设置！");
		}
		this.mallDao.updateSettingsById(settings);
		this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", "", settings.toString(), "商城设置", systemUser, "36");
		return new DataResponse(true, "更新成功！");
	}

	@Override
	public DataResponse deleteSettings(String id, SystemUser systemUser) throws Exception {
		this.mallDao.deleteSettingsById(id);
		this.dataBaseLogService.log(CommonKeys.logDelete, "更新", id, "", "商城设置", systemUser, "36");
		return new DataResponse(true, "删除成功！");
	}

}
