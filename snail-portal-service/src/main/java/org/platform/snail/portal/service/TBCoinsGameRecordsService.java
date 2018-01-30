package org.platform.snail.portal.service;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.TBCoinsGameRecords;

public interface TBCoinsGameRecordsService {

	public abstract DataResponse findRecordsList(TBCoinsGameRecords condition, int start, int limit, String orderBy,
			SystemUser systemUser) throws Exception;

}
