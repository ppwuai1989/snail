package org.platform.snail.portal.service;

import java.util.List;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.beans.Tree;
import org.platform.snail.portal.model.Resources;

import net.sf.json.JSONObject;

public interface ResourcesService {
	public abstract DataResponse findResourcesList(Resources condition, int start, int limit, String orderBy)
			throws Exception;

	public abstract DataResponse insertResources(JSONObject json, SystemUser systemUser) throws Exception;

	public abstract DataResponse updateResources(JSONObject json, SystemUser systemUser) throws Exception;

	public abstract DataResponse selectResourcesByPrimaryKey(String id) throws Exception;

	public abstract DataResponse deleteResourcesByResourcesId(String Jsons, SystemUser systemUser) throws Exception;

	public abstract List<Tree> selectResourcesTreeList() throws Exception;

}
