package org.platform.snail.portal.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.model.Users;
import org.platform.snail.portal.dao.AgentDao;
import org.platform.snail.portal.dao.MemberDao;
import org.platform.snail.portal.dao.UsersDao;
import org.platform.snail.portal.model.Member;
import org.platform.snail.portal.model.TopUpRecords;
import org.platform.snail.portal.service.MemberService;
import org.platform.snail.portal.service.TopUpRecordsService;
import org.platform.snail.portal.vo.AgentVo;
import org.platform.snail.portal.vo.MemberVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.ImgUtils;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.platform.snail.weixin.model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private AgentDao agentDao;

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private TopUpRecordsService topUpRecordsService;

	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse findUsersSearchList(Member condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<Map<String, String>> list = this.memberDao.findUsersSearchList(condition, start, limit, orderBy);
		rst.setList(list);
		int allRows = this.memberDao.findUsersSearchCount(condition);
		rst.setAllRows(allRows);
		return rst;
	}

	@Override
	public DataResponse findUsersList(Member condition, int start, int limit, String orderBy, SystemUser systemUser)
			throws Exception {
		DataResponse rst = new DataResponse();
		// 20180118判断当前用户是否为代理，并查询相应权限的页面
		String isSearch = "";
		String agentId = "";
		if (systemUser.getAgent() != null) {
			agentId = systemUser.getAgent().getAgentId();
			if (SnailUtils.isNotBlankString(agentId)) {
				isSearch = "1";
			}
		}
		// long before = System.currentTimeMillis();
		List<MemberVo> list = this.memberDao.findUsersList(condition, start, start + limit, orderBy, isSearch, agentId);
		// long middle = System.currentTimeMillis();
		// System.out.println("查询时间：[" + (middle - before) + "]毫秒");
		for (MemberVo i : list) {
			if(SnailUtils.isBlankString(i.getHeadImg())){
				i.setHeadImg("https://open.weixin.qq.com/zh_CN/htmledition/res/assets/res-design-download/icon32_appwx_logo.png");
			}			
			if (i.getHeadImg().indexOf("wx.qlogo.cn") < 0 && i.getHeadImg().indexOf("open.weixin.qq.com") < 0) {
				i.setHeadImg(ImgUtils.getBase64ImgString(i.getHeadImg()));
			}
		}
		// long after = System.currentTimeMillis();
		// System.out.println("转换图片时间：[" + (after - middle) + "]毫秒");
		rst.setList(list);
		if (start <= 1) {
			int allRows = this.memberDao.findUsersCount(condition, isSearch, agentId);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	@Override
	public DataResponse insertUsers(JSONObject josnObject, SystemUser systemUser) throws Exception {
		Member member = new Member();
		SnailBeanUtils.copyProperties(member, josnObject);
		// if (SnailUtils.isBlankString(member.getAccount())) {
		// return new DataResponse(false, "账户不能为空!");
		// }
		// if (this.memberDao.isExitUsersAccount(member.getAccount()) > 0) {
		// return new DataResponse(false, "账户已存在!");
		// }
		// if (SnailUtils.isBlankString(member.getWeChatId())) {
		// return new DataResponse(false, "微信号不能为空!");
		// }
		// if (this.memberDao.isExitUsersWeChatId(member.getWeChatId()) > 0) {
		// return new DataResponse(false, "微信号已存在!");
		// }
		if (SnailUtils.isBlankString(member.getMobile())) {
			return new DataResponse(false, "手机号不能为空!");
		}
		if (this.memberDao.isExitUsersAccount(member.getMobile()) > 0) {
			return new DataResponse(false, "手机号已存在!");
		}
		if (SnailUtils.isBlankString(member.getPassword())) {
			member.setPassword(SnailUtils.getMd5(member.getPassword()));
		}
		int insert = this.memberDao.insertUsers(member);
		if (insert > 0) {
			this.dataBaseLogService.log(CommonKeys.logCreate, "添加", "", member.toString(), "游戏管理-会员管理", systemUser,
					"26");
		}
		return new DataResponse(true, "添加新会员成功！");
	}

	@Override
	public DataResponse updateUsers(JSONObject josnObject, SystemUser systemUser) throws Exception {
		Member member = new Member();
		SnailBeanUtils.copyProperties(member, josnObject);
		// if (SnailUtils.isBlankString(member.getAccount())) {
		// return new DataResponse(false, "账户不能为空!");
		// }
		// if (SnailUtils.isBlankString(member.getWeChatId())) {
		// return new DataResponse(false, "微信号不能为空!");
		// }
		// if (SnailUtils.isBlankString(member.getMobile())) {
		// return new DataResponse(false, "手机号不能为空!");
		// }
		if (!SnailUtils.isBlankString(member.getPassword())) {
			member.setPassword(SnailUtils.getMd5(member.getPassword()));
		}
		MemberVo o = this.memberDao.selectMemberVoByPrimaryKey(member.getUserId());
		int i = this.memberDao.updateUsersByPrimaryKey(member);
		if (i > 0) {
			this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", o.toString(), member.toString(), "游戏管理-会员管理",
					systemUser, "26");
		}
		return new DataResponse(true, "会员信息变更成功！");
	}

	@Override
	public DataResponse updateUsersStatusByPrimaryKey(String userId, String status, SystemUser systemUser)
			throws Exception {
		DataResponse rst = new DataResponse();
		if (SnailUtils.isBlankString(userId)) {
			return new DataResponse(false, "会员编号不能为空！");
		}
		if (SnailUtils.isBlankString(status)) {
			return new DataResponse(false, "会员状态不能为空！");
		}
		MemberVo o = this.memberDao.selectMemberVoByPrimaryKey(userId);
		int i = this.memberDao.updateUsersStatusByPrimaryKey(userId, status);
		if (i > 0) {
			this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", "status[" + o.getStatus() + "]",
					"status:[" + status + "]", "游戏管理-会员管理", systemUser, "26");
		}
		return new DataResponse(true, "会员禁用成功！");
	}

	@Override
	public DataResponse selectUsersByPrimaryKey(String userId) throws Exception {
		DataResponse rst = new DataResponse();
		Member member = this.memberDao.selectMemberVoByPrimaryKey(userId);
		rst.setResponse(member);
		return rst;
	}

	@Override
	public DataResponse findMemberAccountInfo(String agentId) throws Exception {
		DataResponse rst = new DataResponse();
		MemberVo member = this.memberDao.findMemberAccountInfo(agentId);
		Map<String, String> map = new HashMap();
		if (member != null) {
			map.put("coins", member.getCoins());
			map.put("gems", member.getGems());
			map.put("pkCard", member.getPkCard());
			rst.setResponse(map);
			rst.setState(true);
		} else {
			rst.setState(false);
			rst.setErrorMessage("该用户不是代理！");
		}
		return rst;
	}

	/*
	 * 通过微信注册添加用户
	 */
	@Override
	public DataResponse userLoginOrRegister(UserInfo userInfo) throws Exception {
		DataResponse rst = new DataResponse();
		int isExit = this.memberDao.isExitUsersUnionId(userInfo.getUnionid());
		if (isExit > 0) {
			MemberVo memberVo = new MemberVo();
			memberVo = this.memberDao.selectMemberByUnionId(userInfo.getUnionid());
			// 更新用户微信的信息和登录时间
			memberVo.setWeChatId(userInfo.getOpenid());
			memberVo.setName(userInfo.getNickname());
			memberVo.setSex(userInfo.getSex());
			memberVo.setCity(userInfo.getCity());
			memberVo.setLanguage(userInfo.getLanguage());
			memberVo.setProvince(userInfo.getProvince());
			memberVo.setCountry(userInfo.getCountry());
			memberVo.setHeadImg(userInfo.getHeadimgurl());
			memberVo.setPrivilege(userInfo.getPrivilege());
			int update = this.memberDao.updateMemberUserInfoByUserId(memberVo);
			System.out.println("id为[" + memberVo.getUserId() + "]的用户[" + memberVo.getName() + "]登录成功!");
			rst.setState(true);
			rst.setErrorMessage("用户登录成功！");
			memberVo.setHeadImg(ImgUtils.getBase64ImgString(memberVo.getHeadImg()));// 返回可跨域图片
			rst.setResponse(memberVo);
		} else {
			Member member = new Member();
			// 暂时将unionid存入account
			// 初始化账户信息
			member.setLevel("0");
			member.setExperience("0");
			member.setCoins("0");
			member.setGems("0");
			member.setPkCard("0");
			member.setIsAgent("0");
			member.setScore("0");
			member.setAccount(userInfo.getUnionid());
			member.setWeChatId(userInfo.getOpenid());
			member.setName(userInfo.getNickname());
			member.setSex(userInfo.getSex());
			member.setCity(userInfo.getCity());
			member.setLanguage(userInfo.getLanguage());
			member.setProvince(userInfo.getProvince());
			member.setCountry(userInfo.getCountry());
			member.setHeadImg(userInfo.getHeadimgurl());
			member.setPrivilege(userInfo.getPrivilege());
			member.setUnionId(userInfo.getUnionid());
			int insert = this.memberDao.registerMemberByWeChat(member);
			if (insert > 0) {
				member.setHeadImg(ImgUtils.getBase64ImgString(member.getHeadImg()));
				rst.setResponse(member);
				rst.setErrorMessage("注册成功！");
				rst.setState(true);
				this.dataBaseLogService.log("Id为[" + member.getUserId() + "]的用户[" + member.getName() + "]\r\n注册了游戏！",
						"注册", "", "", "游戏管理-会员管理", null);
			} else {
				rst.setErrorMessage("未注册成功！");
				rst.setState(false);
			}
		}
		return rst;
	}

	/*
	 * 通过平台给玩家充值
	 */
	@Override
	public DataResponse topUpMember(JSONObject jsonObject, SystemUser systemUser) throws Exception {
		// 判断是否为代理
		Member topUpInfo = new Member();
		SnailBeanUtils.copyProperties(topUpInfo, jsonObject);
		if (topUpInfo.getCoins().equals("0") && topUpInfo.getGems().equals("0") && topUpInfo.getPkCard().equals("0")) {
			return new DataResponse(false, "请至少选择一项进行充值！");
		}
		if (systemUser.getAgent() != null) {
			MemberVo agentSearchVo = new MemberVo();
			MemberVo agentUpdateVo = new MemberVo();
			MemberVo memberSearchVo = new MemberVo();
			MemberVo memberUpdateVo = new MemberVo();
			agentSearchVo.setAgentId(systemUser.getAgent().getAgentId());
			agentSearchVo = this.memberDao.selectMemberVoByAgentId(agentSearchVo.getAgentId());
			memberSearchVo.setUserId(topUpInfo.getUserId());
			memberSearchVo = this.memberDao.selectMemberVoByPrimaryKey(memberSearchVo.getUserId());
			if(SnailUtils.isNotBlankString(memberSearchVo.getRoomId())){
				return new DataResponse(false,"该玩家正在房间游戏中，请退出房间后再充值！");
			}
			String agentCoins = agentSearchVo.getCoins();
			String agentGems = agentSearchVo.getGems();
			String agentPkCard = agentSearchVo.getPkCard();
			String topUpCoins = topUpInfo.getCoins();
			String topUpGems = topUpInfo.getGems();
			String topUpPkCard = topUpInfo.getPkCard();
			String memberCoins = memberSearchVo.getCoins();
			String memberGems = memberSearchVo.getGems();
			String memeberPkCard = memberSearchVo.getPkCard();
			// 计算代理和玩家充值结果
			calculateResult rst = new calculateResult();
			rst = calculate(agentCoins, topUpCoins, memberCoins);
			if (!rst.isSuccess()) {
				return new DataResponse(false, "您的金币余额不足！");
			}
			agentUpdateVo.setCoins(rst.getAgentNum());
			memberUpdateVo.setCoins(rst.getMemberNum());
			rst = calculate(agentGems, topUpGems, memberGems);
			if (!rst.isSuccess()) {
				return new DataResponse(false, "您的房卡余额不足！");
			}
			agentUpdateVo.setGems(rst.getAgentNum());
			memberUpdateVo.setGems(rst.getMemberNum());
			rst = calculate(agentPkCard, topUpPkCard, memeberPkCard);
			if (!rst.isSuccess()) {
				return new DataResponse(false, "您的比武卡余额不足！");
			}
			agentUpdateVo.setPkCard(rst.getAgentNum());
			memberUpdateVo.setPkCard(rst.getMemberNum());
			// 更新代理和玩家充值结果
			agentUpdateVo.setUserId(agentSearchVo.getUserId());
			this.memberDao.updateUsersByPrimaryKey(agentUpdateVo);
			memberUpdateVo.setUserId(memberSearchVo.getUserId());
			this.memberDao.updateUsersByPrimaryKey(memberUpdateVo);
			// 插入充值记录表
			TopUpRecords records = new TopUpRecords();
			records.setCoins(topUpCoins);
			records.setGems(topUpGems);
			records.setPkCard(topUpPkCard);
			records.setUserId(memberSearchVo.getUserId());
			records.setUserName(memberSearchVo.getName());
			records.setAgentId(agentSearchVo.getAgentId());
			records.setAgentName(agentSearchVo.getName());
			records.setWay(CommonKeys.wayOfAgent);
			this.topUpRecordsService.insertRecords(records);
			return new DataResponse(true, "恭喜您，充值成功！");
		} else {
			MemberVo memberSearchVo = new MemberVo();
			MemberVo memberUpdateVo = new MemberVo();
			memberSearchVo.setUserId(topUpInfo.getUserId());
			memberSearchVo = this.memberDao.selectMemberVoByPrimaryKey(memberSearchVo.getUserId());
			if(SnailUtils.isNotBlankString(memberSearchVo.getRoomId())){
				return new DataResponse(false,"该玩家正在房间游戏中，请退出房间后再充值！");
			}
			String memberCoins = memberSearchVo.getCoins();
			String memberGems = memberSearchVo.getGems();
			String memeberPkCard = memberSearchVo.getPkCard();
			String topUpCoins = topUpInfo.getCoins();
			String topUpGems = topUpInfo.getGems();
			String topUpPkCard = topUpInfo.getPkCard();
			calculateResult rst = new calculateResult();
			rst = calculate(topUpCoins, memberCoins);
			memberUpdateVo.setCoins(rst.getMemberNum());
			rst = calculate(topUpGems, memberGems);
			memberUpdateVo.setGems(rst.getMemberNum());
			rst = calculate(topUpPkCard, memeberPkCard);
			memberUpdateVo.setPkCard(rst.getMemberNum());
			memberUpdateVo.setUserId(memberSearchVo.getUserId());
			this.memberDao.updateUsersByPrimaryKey(memberUpdateVo);
			// 插入充值记录表
			TopUpRecords records = new TopUpRecords();
			records.setCoins(topUpCoins);
			records.setGems(topUpGems);
			records.setPkCard(topUpPkCard);
			records.setUserId(memberSearchVo.getUserId());
			records.setUserName(memberSearchVo.getName());
			records.setAgentId(systemUser.getUsers().getUserId());
			records.setAgentName(systemUser.getUsers().getName());
			records.setWay(CommonKeys.wayOfSystemUser);
			this.topUpRecordsService.insertRecords(records);
			return new DataResponse(true, "恭喜您，充值成功！");
		}
	}

	private calculateResult calculate(String agent, String topUp, String member) {
		calculateResult rst = new calculateResult();
		int a = Integer.valueOf(agent);
		int t = Integer.valueOf(topUp);
		int m = Integer.valueOf(member);
		if (a < t) {
			return new calculateResult(false, "余额不足！");
		} else {
			rst.setAgentNum(a - t);
			rst.setMemberNum(m + t);
		}
		return rst;
	}

	private calculateResult calculate(String topUp, String member) {
		calculateResult rst = new calculateResult();
		int t = Integer.valueOf(topUp);
		int m = Integer.valueOf(member);
		rst.setMemberNum(m + t);
		return rst;
	}

	private class calculateResult {

		private boolean success;
		private String agentNum;
		private String memberNum;
		private String errorMessage;

		public calculateResult() {
			this.success = true;
			this.agentNum = "0";
			this.memberNum = "0";
			this.errorMessage = "";
		}

		public calculateResult(boolean success, String msg) {
			this.success = success;
			this.errorMessage = msg;
		}

		public boolean isSuccess() {
			return success;
		}

		public void setSuccess(boolean success) {
			this.success = success;
		}

		public String getAgentNum() {
			return agentNum;
		}

		public void setAgentNum(String agentNum) {
			this.agentNum = agentNum;
		}

		public void setAgentNum(int agentNum) {
			this.agentNum = String.valueOf(agentNum);
		}

		public String getMemberNum() {
			return memberNum;
		}

		public void setMemberNum(String memberNum) {
			this.memberNum = memberNum;
		}

		public void setMemberNum(int memberNum) {
			this.memberNum = String.valueOf(memberNum);
		}

		public String getErrorMessage() {
			return errorMessage;
		}

		public void setErrorMessage(String errorMessage) {
			this.errorMessage = errorMessage;
		}

	}

	@Override
	public DataResponse setUpAgent(JSONObject jsonObject, SystemUser systemUser) throws Exception {
		// 设置代理（代理使用的）
		// 首先检查该玩家手机号是否存在
		DataResponse dr = new DataResponse();
		if (systemUser.getAgent() != null) {
			Member memberInfo = new Member();
			SnailBeanUtils.copyProperties(memberInfo, jsonObject);
			if (this.memberDao.isExitUsersMobile(memberInfo.getMobile()) > 0) {
				return new DataResponse(false, "手机号已经被其他玩家绑定，请重新输入，或联系客服！");
			}
			// 向用户表插入数据，并且向角色-权限表中添加 该用户数据，使其获得相应权限

			Users user = new Users();
			user.setAccount(memberInfo.getMobile());// 设置手机为账户
			user.setSex(memberInfo.getSex());
			user.setPassword(SnailUtils.getMd5(memberInfo.getMobile().substring(memberInfo.getMobile().length() - 6)));// 手机后六位为密码
			user.setMobile(memberInfo.getMobile());
			user.setName(memberInfo.getName());
			user.setStatus("1");
			int insertU = this.usersDao.registerUsers(user);
			if (insertU > 0) {
				// 用户插入成功后，插入一个低级代理的角色
				// System.out.println(user.getUserId());
				this.usersDao.insertUsersRole(user.getUserId(), new String[] { CommonKeys.juniorAgent });
				// 插入角色后，更新会员表信息 ，代理等级，id，名字、是否代理等
				// 因为传入的memberInfo有其他信息，为了确保不被修改，我们new一个Member实体
				Member updateMember = new Member();
				updateMember.setIsAgent("1");
				updateMember.setAgentId(user.getUserId());// 代理ID
				updateMember.setParentAgentId(systemUser.getAgent().getAgentId());
				updateMember.setAgentLevel(CommonKeys.junior);
				updateMember.setMobile(memberInfo.getMobile());
				updateMember.setUserId(memberInfo.getUserId());
				int updateM = this.memberDao.updateUsersByPrimaryKey(updateMember);
				if (updateM > 0) {
					return new DataResponse(true, "设置代理成功！请通知代理及时登录并修改初始密码--手机号后六位！");
				} else {
					return new DataResponse(false, "注册失败！更新玩家信息失败");
				}
			} else {
				return new DataResponse(false, "注册失败！平台账号未注册成功");
			}

		} else {
			return new DataResponse(false, "对不起您不是代理，不可使用该功能！");
		}

	}

	@Override
	public DataResponse checkMember(JSONObject jsonObject, SystemUser systemUser) throws Exception {
		MemberVo checkInfo = new MemberVo();
		SnailBeanUtils.copyProperties(checkInfo, jsonObject);
		// 根据userid查出会员信息,根据parentAgentId判断是否已经被绑定
		checkInfo = this.memberDao.selectMemberVoByPrimaryKey(checkInfo.getUserId());
		if (checkInfo != null) {
			if (SnailUtils.isNotBlankString(checkInfo.getParentAgentId())) {
				return new DataResponse(false, "该会员已经被其他代理绑定！");
			} else {
				return new DataResponse(true, "您可以绑定该会员，点击确定完成绑定！");
			}
		} else {
			return new DataResponse(true, "该会员不存在！");
		}

	}

	@Override
	public DataResponse bindMember(JSONObject jsonObject, SystemUser systemUser) throws Exception {
		Member bindInfo = new Member();
		SnailBeanUtils.copyProperties(bindInfo, jsonObject);
		if (systemUser.getAgent() != null) {
			bindInfo.setParentAgentId(systemUser.getAgent().getAgentId());
			int update = this.memberDao.updateUsersByPrimaryKey(bindInfo);
			if (update > 0) {
				return new DataResponse(true, "绑定会员成功！");
			} else {
				return new DataResponse(false, "绑定失败，未知错误！");
			}
		} else {
			return new DataResponse(false, "您不是代理，不可以绑定会员！");
		}
	}

	@Override
	public DataResponse upgradeAgent(JSONObject jsonObject, SystemUser systemUser) throws Exception {
		Member upgradeInfo = new Member();
		SnailBeanUtils.copyProperties(upgradeInfo, jsonObject);
		if (systemUser.getAgent() != null) {
			if (systemUser.getAgent().getAgentLevel().equals(CommonKeys.senior)) {
				upgradeInfo.setAgentLevel(CommonKeys.medium);
				upgradeInfo.setParentAgentId(systemUser.getAgent().getAgentId());
				try {
					int upgradeLevel = this.usersDao.insertUsersRole(upgradeInfo.getUserId(),
							new String[] { CommonKeys.mediumAgent });

					int update = this.memberDao.updateUsersByPrimaryKey(upgradeInfo);
					if (update > 0) {
						return new DataResponse(true, "升级成功！该代理现在是中级代理哦！");
					} else {
						return new DataResponse(false, "升级失败，未知错误！");
					}
				} catch (Exception e) {
					return new DataResponse(false, "升级失败，错误信息：" + e.getMessage());
				}
			} else {
				return new DataResponse(false, "只有高级代理才可做升级操作哦！");
			}
		} else {
			return new DataResponse(false, "您不是代理，无权对玩家做升级操作！");
		}
	}

}
