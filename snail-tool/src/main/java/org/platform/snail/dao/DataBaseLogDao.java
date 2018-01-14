package org.platform.snail.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.model.Logs;

public interface DataBaseLogDao {
	abstract public int insert(@Param("logs") Logs logs);

	int findCount(@Param("condition") Map<String, Object> condition);

	List<Logs> findList(@Param("condition") Map<String, Object> condition, @Param("start") int start,
			@Param("limit") int limit, @Param("orderBy") String orderBy);

}
