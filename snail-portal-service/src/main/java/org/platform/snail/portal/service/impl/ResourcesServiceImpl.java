package org.platform.snail.portal.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.beans.Tree;
import org.platform.snail.portal.dao.ResourcesDao;
import org.platform.snail.portal.model.Resources;
import org.platform.snail.portal.service.ResourcesService;
import org.platform.snail.portal.vo.ResourcesVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.CommonTreeUtils;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("resourcesService")
public class ResourcesServiceImpl implements ResourcesService {

	Logger logger = LogManager.getLogger(this.getClass());
	@Autowired
	private ResourcesDao resourcesDao;
	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse findResourcesList(Resources condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<ResourcesVo> list = this.resourcesDao.findList(condition, start, start + limit, orderBy);
		rst.setList(list);
		if (start <= 1) {
			int allRows = this.resourcesDao.findCount(condition);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	@Override
	public DataResponse insertResources(JSONObject json, SystemUser systemUser) throws Exception {
		Resources o = new Resources();
		SnailBeanUtils.copyProperties(o, json);
		if (SnailUtils.isBlankString(o.getResourcesId())) {
			return new DataResponse(false, "编号不能为空！");
		}
		if (SnailUtils.isBlankString(o.getParentResourcesId())) {
			return new DataResponse(false, "父编号不能为空！");
		}
		if (SnailUtils.isBlankString(o.getResourcesName())) {
			return new DataResponse(false, "名称不能为空！");
		}
		if (SnailUtils.isBlankString(o.getResourcesType())) {
			return new DataResponse(false, "类型不能为空！");
		}

		int temp = this.resourcesDao.isExitByName(o.getResourcesName());
		if (temp > 0) {
			return new DataResponse(false, "资源名称重复！");
		}
		o.setCreateTime(new Date());
		o.setStatus("1");
		o.setCreateUserId(systemUser.getUsers().getUserId());
		this.resourcesDao.insert(o);
		this.dataBaseLogService.log(CommonKeys.logCreate, "添加", "", o.getResourcesName(), "资源", systemUser,"5");
		return new DataResponse(true, "添加资源成功！");
	}

	@Override
	public DataResponse updateResources(JSONObject json, SystemUser systemUser) throws Exception {
		Resources o = new Resources();
		SnailBeanUtils.copyProperties(o, json);
		if (SnailUtils.isBlankString(o.getResourcesId())) {
			return new DataResponse(false, "编号不能为空！");
		}
		if (SnailUtils.isBlankString(o.getParentResourcesId())) {
			return new DataResponse(false, "父编号不能为空！");
		}
		if (SnailUtils.isBlankString(o.getResourcesName())) {
			return new DataResponse(false, "名称不能为空！");
		}
		if (SnailUtils.isBlankString(o.getResourcesType())) {
			return new DataResponse(false, "类型不能为空！");
		}
		Resources r = this.resourcesDao.selectByPrimaryKey(o.getResourcesId());
		this.resourcesDao.updateByPrimaryKey(o);		
		this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", o.toString(), r.toString(),
				"资源名称--" + o.getResourcesName(), systemUser,"5");
		return new DataResponse(true, "变更资源成功！");
	}

	@Override
	public DataResponse selectResourcesByPrimaryKey(String id) throws Exception {
		DataResponse rst = new DataResponse();
		rst.setResponse(this.resourcesDao.selectByPrimaryKey(id));
		return rst;
	}

	@Override
	public DataResponse deleteResourcesByResourcesId(String Jsons, SystemUser systemUser) throws Exception {
		JSONObject jsonObject = JSONObject.fromObject(Jsons);
		String id = String.valueOf(jsonObject.get("id"));
		int delete = this.resourcesDao.deleteByPrimaryKey(id);
		if (delete > 0) {
			this.dataBaseLogService.log(CommonKeys.logUpdate, "禁用", "[status:1]", "[status:0]", "资源id--" + id,
					systemUser,"5");
		}
		return new DataResponse(true, "资源禁用成功！");
	}

	@Override
	public List<Tree> selectResourcesTreeList() throws Exception {
		CommonTreeUtils commonTreeUtils = new CommonTreeUtils(this.resourcesDao.selectResourcesTreeList());
		return commonTreeUtils.getTreeList("0");
	}

}
