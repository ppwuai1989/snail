package org.platform.snail.portal.dao;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.TopUpRecords;
import org.platform.snail.portal.vo.TopUpRecordsVo;

public interface OpenAPIDao {

	// 开放接口
	public abstract int createOrder(@Param("order") TopUpRecords order);

	public abstract TopUpRecordsVo findTopUpRecordsByOrderInfo(@Param("orderId") String orderId);

	public abstract int updateTopUpRecordsByOrderInfo(@Param("order") TopUpRecords order);
}
