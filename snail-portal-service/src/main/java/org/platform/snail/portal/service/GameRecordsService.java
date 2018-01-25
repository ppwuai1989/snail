package org.platform.snail.portal.service;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.GameRecords;


public interface GameRecordsService {
	
	public abstract DataResponse findRecordsList(GameRecords condition, int start, int limit, String orderBy,
			SystemUser systemUser) throws Exception;

}
