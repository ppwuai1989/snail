package org.platform.snail.portal.service;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.TopUpRecords;

public interface TopUpRecordsService {

	public abstract DataResponse findRecordsList(TopUpRecords condition, int start, int limit, String orderBy,
			SystemUser systemUser) throws Exception;

	public abstract void insertRecords(TopUpRecords records) throws Exception;
}
