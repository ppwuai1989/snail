package org.platform.snail.portal.service;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.GameControl;

import net.sf.json.JSONObject;

public interface GameControlService {

	public abstract DataResponse findControlList(GameControl control, int start, int limit, String orderBy)
			throws Exception;

	public abstract DataResponse insertControl(JSONObject json, SystemUser systemUser) throws Exception;

	public abstract DataResponse updateControl(JSONObject json, SystemUser systemUser) throws Exception;

	public abstract DataResponse deleteControl(String id, SystemUser systemUser) throws Exception;

	public abstract DataResponse selectSystemState(String gameType) throws Exception;
}
