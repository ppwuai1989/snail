package org.platform.snail.portal.service;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.MallSettings;

import net.sf.json.JSONObject;

public interface MallSettingsService {

	public abstract DataResponse findList(MallSettings condition, int start, int limit, String orderBy)
			throws Exception;

	public abstract DataResponse insertSettings(JSONObject jsonObject, SystemUser systemUser) throws Exception;

	public abstract DataResponse updateSettings(JSONObject jsonObject, SystemUser systemUser) throws Exception;

	public abstract DataResponse deleteSettings(String id, SystemUser systemUser) throws Exception;	

}
