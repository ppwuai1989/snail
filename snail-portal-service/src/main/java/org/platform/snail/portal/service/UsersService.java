package org.platform.snail.portal.service;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.model.Users;

import net.sf.json.JSONObject;

public interface UsersService {

	public abstract DataResponse selectByUserId(String userId) throws Exception;

	public abstract DataResponse findUsersSearchList(Users condition, int start, int limit, String orderBy)
			throws Exception;

	public abstract DataResponse findUsersList(Users condition, int start, int limit, String orderBy) throws Exception;

	public abstract DataResponse insertUsers(JSONObject josnObject, SystemUser systemUser) throws Exception;

	public abstract DataResponse updateUsers(JSONObject josnObject, SystemUser systemUser) throws Exception;

	public abstract DataResponse updateUsersStatusByPrimaryKey(String usersId, String status, SystemUser systemUser)
			throws Exception;

	public abstract DataResponse selectUsersByPrimaryKey(String usersId) throws Exception;

	public abstract DataResponse updateUsersForInitPassword(String usersId, String password, SystemUser systemUser)
			throws Exception;

	public abstract DataResponse insertUsersRole(String userId, String[] roleId, SystemUser systemUser)
			throws Exception;

	public abstract DataResponse selectRoleList() throws Exception;

	public abstract DataResponse selectRoleListByUserId(String userId) throws Exception;

}
