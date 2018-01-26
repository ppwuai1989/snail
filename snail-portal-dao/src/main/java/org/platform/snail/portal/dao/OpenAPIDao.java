package org.platform.snail.portal.dao;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.TopUpRecords;

public interface OpenAPIDao {
	
	//开放接口
	public abstract int createOrder(@Param("order") TopUpRecords order);
}
