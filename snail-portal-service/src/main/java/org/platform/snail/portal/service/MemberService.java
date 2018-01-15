package org.platform.snail.portal.service;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.Member;
import org.platform.snail.portal.vo.MemberVo;
import org.platform.snail.weixin.model.OAuthInfo;
import org.platform.snail.weixin.model.UserInfo;

import net.sf.json.JSONObject;

public interface MemberService {

	public abstract DataResponse findUsersSearchList(Member condition, int start, int limit, String orderBy)
			throws Exception;

	public abstract DataResponse findUsersList(Member condition, int start, int limit, String orderBy) throws Exception;

	public abstract DataResponse insertUsers(JSONObject josnObject, SystemUser systemUser) throws Exception;

	public abstract DataResponse updateUsers(JSONObject josnObject, SystemUser systemUser) throws Exception;

	public abstract DataResponse updateUsersStatusByPrimaryKey(String usersId, String status, SystemUser systemUser)
			throws Exception;

	public abstract DataResponse selectUsersByPrimaryKey(String usersId) throws Exception;

	public abstract DataResponse findMemberAccountInfo(String agentId) throws Exception;

	public abstract DataResponse userLoginOrRegister(UserInfo userInfo) throws Exception;
}
