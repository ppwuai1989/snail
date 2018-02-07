package org.platform.snail.portal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.MallSettings;
import org.platform.snail.portal.vo.MallSettingsVo;

public interface MallSettingsDao {

	public abstract int findListCount(@Param("condition") MallSettings condition);

	public abstract List<MallSettingsVo> findList(@Param("condition") MallSettings condition, @Param("start") int start,
			@Param("limit") int limit, @Param("orderBy") String orderBy);

	public abstract int insertSettings(MallSettings settings);

	public abstract int updateSettingsById(MallSettings settings);

	public abstract int deleteSettingsById(String id);

	public abstract int isExitsUnique(@Param("goodsId") String goodsId, @Param("price") String price);
	
	//查出所有商城信息
	public abstract List<MallSettingsVo> findAllList();
	
	public abstract List<MallSettingsVo> findAllListByAgentLevel(@Param("level") String level);

}
