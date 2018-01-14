package org.platform.snail.portal.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.DictCategory;

public interface DictCategoryDao {

	int init();

	List<Map> selectAllDictList();

	int deleteByPrimaryKey(String categoryId);

	int insert(DictCategory record);

	int insertSelective(DictCategory record);

	DictCategory selectByPrimaryKey(String categoryId);

	int updateByPrimaryKeySelective(DictCategory record);

	int updateByPrimaryKey(DictCategory record);

	List<DictCategory> findList(@Param("condition") DictCategory condition, @Param("start") int start,
			@Param("limit") int limit, @Param("orderBy") String orderBy);

	int findCount(@Param("condition") DictCategory condition);

	List<DictCategory> findListAll();

	int isExitByName(@Param("name") String name);

}
