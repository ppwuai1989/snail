package org.platform.snail.portal.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.DictCategoryDao;
import org.platform.snail.portal.model.DictCategory;
import org.platform.snail.portal.service.DictCategoryService;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("dictCategoryService")
public class DictCategoryServiceImpl implements DictCategoryService {

	Logger logger = LogManager.getLogger(this.getClass());
	@Autowired
	private DictCategoryDao dictCategoryDao;

	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse findDictCategoryList(DictCategory condition, int start, int limit, String orderBy)
			throws Exception {
		DataResponse rst = new DataResponse();
		List<DictCategory> list = this.dictCategoryDao.findList(condition, start, start + limit, orderBy);
		rst.setList(list);
		if (start <= 1) {
			int allRows = this.dictCategoryDao.findCount(condition);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	@Override
	public DataResponse insertDictCategory(JSONObject josnObject, SystemUser systemUser) throws Exception {
		DictCategory dictCategory = new DictCategory();
		SnailBeanUtils.copyProperties(dictCategory, josnObject);

		if (SnailUtils.isBlankString(dictCategory.getName())) {

			return new DataResponse(false, "名称不能为空！");
		}
		dictCategory.setCreateTime(new Date());
		int temp = this.dictCategoryDao.isExitByName(dictCategory.getName());
		if (temp > 0) {
			return new DataResponse(false, "名称已存在！");
		}
		this.dictCategoryDao.insert(dictCategory);
		this.dataBaseLogService.log(CommonKeys.logCreate, "添加", "", dictCategory.getName(),
				"字典类型-" + dictCategory.getName(), systemUser, "22");
		return new DataResponse(true, "添加字典类型成功！");
	}

	@Override
	public DataResponse updateDictCategory(JSONObject josnObject, SystemUser systemUser) throws Exception {
		DictCategory dictCategory = new DictCategory();
		SnailBeanUtils.copyProperties(dictCategory, josnObject);

		if (SnailUtils.isBlankString(dictCategory.getName())) {

			return new DataResponse(false, "名称不能为空！");
		}
		DictCategory d = this.dictCategoryDao.selectByPrimaryKey(dictCategory.getCategoryId());
		int update = this.dictCategoryDao.updateByPrimaryKeySelective(dictCategory);
		if (update > 0) {
			this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", d.toString(), dictCategory.toString(),
					"字典类型-" + d.getName(), systemUser, "22");
		}

		return new DataResponse(true, "字典类型变更成功！");
	}

	@Override
	public DataResponse selectDictCategoryByPrimaryKey(String dictCategoryId) throws Exception {
		DataResponse rst = new DataResponse();
		rst.setResponse(this.dictCategoryDao.selectByPrimaryKey(dictCategoryId));
		return rst;
	}

	@Override
	public DataResponse deleteDictCategoryByDictCategoryId(String dictCategoryId, SystemUser systemUser)
			throws Exception {
		DictCategory d = this.dictCategoryDao.selectByPrimaryKey(dictCategoryId);
		int delete = this.dictCategoryDao.deleteByPrimaryKey(dictCategoryId);
		if (delete > 0) {
			this.dataBaseLogService.log(CommonKeys.logDelete, "删除", dictCategoryId, "", "字典类型-" + d.getName(),
					systemUser, "22");
		}
		return new DataResponse(true, "字典类型删除成功！");
	}

	@Override
	public List<DictCategory> findDictCategoryListAll() throws Exception {
		return this.dictCategoryDao.findListAll();
	}

}
