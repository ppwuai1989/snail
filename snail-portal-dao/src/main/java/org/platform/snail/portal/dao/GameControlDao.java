package org.platform.snail.portal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.GameControl;
import org.platform.snail.portal.vo.GameControlVo;
import org.platform.snail.portal.vo.SystemStateVo;

public interface GameControlDao {

	public abstract int findControlListCount(@Param("condition") GameControl condition);

	public abstract List<GameControlVo> findControlList(@Param("condition") GameControl condition,
			@Param("start") int start, @Param("limit") int limit, @Param("orderBy") String orderBy);

	public abstract int insertControl(@Param("control") GameControl control);

	public abstract int updateControl(@Param("control") GameControl control);

	public abstract int deleteControl(@Param("id") String id);

	public abstract SystemStateVo selectSystemState(@Param("gameType") String gameType);

	public abstract GameControlVo selectActiveControlByGameType(@Param("gameType") String gameType);

}
