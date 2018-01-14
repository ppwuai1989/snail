package org.platform.snail.portal.service;

import java.util.List;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.DictCategory;

import net.sf.json.JSONObject;

public interface DictCategoryService {
	public abstract DataResponse findDictCategoryList(DictCategory condition, int start, int limit, String orderBy)
			throws Exception;

	public abstract DataResponse insertDictCategory(JSONObject josnObject, SystemUser systemUser) throws Exception;

	public abstract DataResponse updateDictCategory(JSONObject josnObject, SystemUser systemUser) throws Exception;

	public abstract DataResponse selectDictCategoryByPrimaryKey(String dictCategoryId) throws Exception;

	public abstract DataResponse deleteDictCategoryByDictCategoryId(String dictCategoryId, SystemUser systemUser)
			throws Exception;

	public abstract List<DictCategory> findDictCategoryListAll() throws Exception;

}
