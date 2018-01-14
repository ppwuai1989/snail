package org.platform.snail.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.platform.snail.model.Department;
import org.platform.snail.model.Resources;
import org.platform.snail.model.Users;

public class SystemUser implements Serializable {

	private static final long serialVersionUID = 1L;

	private Users users;


	// 权限列表
	private List<Resources> resources = new ArrayList<Resources>();
	// 权限列表
	private Map<String, Resources> map = new HashMap<String, Resources>();

	/*private Department department;
	private String ip;

	private Leader leader1;
	private Leader leader2;
	private Leader leader3;
	private Leader leader4;
	private Leader leader5;

	private String dpFullName;
	private String leaderFullName;*/

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}


	public List<Resources> getResources() {
		return resources;
	}

	public void setResources(List<Resources> resources) {
		this.resources = resources;
	}

	public Map<String, Resources> getMap() {
		return map;
	}

	public void setMap(Map<String, Resources> map) {
		this.map = map;
	}

	
}
