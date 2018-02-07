package org.platform.snail.portal.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.platfom.snail.pay.model.PaySaPi;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.ValidateResult;
import org.platform.snail.model.Users;
import org.platform.snail.portal.dao.MallSettingsDao;
import org.platform.snail.portal.dao.MemberDao;
import org.platform.snail.portal.dao.OpenAPIDao;
import org.platform.snail.portal.dao.UsersDao;
import org.platform.snail.portal.model.Member;
import org.platform.snail.portal.model.TopUpRecords;
import org.platform.snail.portal.service.OpenAPIService;
import org.platform.snail.portal.vo.MallSettingsVo;
import org.platform.snail.portal.vo.MemberVo;
import org.platform.snail.portal.vo.TopUpRecordsVo;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.SnailUtils;
import org.platform.snail.utils.ValidatorUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("openAPIService")
public class OpenAPIServiceImpl implements OpenAPIService {

	@Autowired
	private OpenAPIDao openAPIDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private MallSettingsDao mallSettingsDao;

	@Override
	public boolean createOrder(Map<String, Object> order) throws Exception {
		TopUpRecords records = new TopUpRecords();
		if (SnailUtils.isBlank(order)) {
			return false;
		} else {// orderuid=10000026&orderuname=paopao&goodsname=1&amount=60000&price=6.00&istype=2
			String userId = String.valueOf(order.get("orderuid"));
			String userName = String.valueOf(order.get("orderuname"));
			String goodsName = String.valueOf(order.get("goodsname"));
			String amount = String.valueOf(order.get("amount"));
			String price = String.valueOf(order.get("price"));
			String orderId = String.valueOf(order.get("orderid"));
			switch (goodsName) {
			case CommonKeys.goods_coins:
				records.setCoins(amount);
				records.setGems("0");
				records.setPkCard("0");
				break;
			case CommonKeys.goods_pkCard:
				records.setCoins("0");
				records.setGems("0");
				records.setPkCard(amount);
				break;
			default:
				return false;
			}
			records.setWay(CommonKeys.wayOfInGame);
			records.setCost(price);
			records.setUserId(userId);
			records.setUserName(userName);
			records.setOrderId(orderId);
			records.setPayStatus("0");
			int insert = this.openAPIDao.createOrder(records);
			if (insert > 0) {
				return true;
			} else {
				return false;
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.platform.snail.portal.service.OpenAPIService#completeOrder(org.
	 * platfom.snail.pay.model.PaySaPi)
	 */
	@Override
	public void completeOrder(PaySaPi paySaPi) throws Exception {
		// 1.根据订单号、会员编号查询充值信息
		// 2.根据会员编号查询会员信息 MemberDao.selectMemberVoByPrimaryKey
		// 3. 更新用户账户信息 MemberDao.updateUsersByPrimaryKey
		// 4.更新支付订单信息
		if (paySaPi == null) {
			throw new Exception("支付信息：paySaPi为空！");
		}
		TopUpRecordsVo topUpInfo = this.openAPIDao.findTopUpRecordsByOrderInfo(paySaPi.getOrderid());
		MemberVo memberInfo = this.memberDao.selectMemberVoByPrimaryKey(paySaPi.getOrderuid());
		if (topUpInfo == null) {
			throw new Exception("充值信息：topUpInfo为空！");
		}
		if (memberInfo == null) {
			throw new Exception("会员信息：memberInfo为空！");
		}
		Member updateInfo = new Member();
		updateInfo.setUserId(memberInfo.getUserId());
		updateInfo.setCoins(calculateTopUp(memberInfo.getCoins(), topUpInfo.getCoins()));
		updateInfo.setGems(calculateTopUp(memberInfo.getGems(), topUpInfo.getGems()));
		updateInfo.setPkCard(calculateTopUp(memberInfo.getPkCard(), topUpInfo.getPkCard()));
		int updateMember = this.memberDao.updateUsersByPrimaryKey(updateInfo);
		if (updateMember < 1) {
			throw new Exception("会员账户充值异常！");
		}
		topUpInfo.setCost(paySaPi.getPrice());
		topUpInfo.setPaysApiId(paySaPi.getPaysapi_id());
		topUpInfo.setRealPrice(paySaPi.getRealprice());
		topUpInfo.setPayStatus("1");
		int updateRecords = this.openAPIDao.updateTopUpRecordsByOrderInfo(topUpInfo);
		if (updateRecords < 1) {
			throw new Exception("更新充值记录异常！");
		}

	}

	private String calculateTopUp(String member, String topUp) {
		String rst = "";
		int m = Integer.valueOf(member);
		int t = Integer.valueOf(topUp);
		rst = String.valueOf(m + t);
		return rst;
	}

	@Override
	public Map<String, String> getOrderStatus(String orderId) throws Exception {
		Map<String, String> rst = new HashMap<String, String>();
		TopUpRecordsVo records = this.openAPIDao.findTopUpRecordsByOrderInfo(orderId);
		if (records != null) {
			rst.put("orderId", records.getOrderId());
			rst.put("payStatus", records.getPayStatus());
		} else {
			rst.put("orderId", orderId);
			rst.put("payStatus", "0");
		}
		return rst;
	}

	@Override
	public DataResponse applyToBEAgent(Map<String, String> map) throws Exception {

		// 首先检查传入参数
		if (SnailUtils.isBlankString(map.get("userId"))) {
			return new DataResponse(false, "会员编号不能为空");
		}
		if (SnailUtils.isBlankString(map.get("name"))) {
			return new DataResponse(false, "代理信息名称不能为空");
		}
		if (SnailUtils.isBlankString(map.get("mobile"))) {
			return new DataResponse(false, "代理信息手机号不能为空");
		}
		ValidateResult valMobile = ValidatorUtils.isMobile(map.get("mobile"));
		if (!valMobile.isSuccess()) {
			return new DataResponse(false, valMobile.getErrMsg());
		}
		if (this.memberDao.isExitUsersMobile(map.get("mobile")) > 0) {
			return new DataResponse(false, "手机号已经被其他玩家绑定，请重新输入，或联系客服！");
		}
		// 根据会员编号查出相应信息
		MemberVo memInfo = new MemberVo();
		memInfo = this.memberDao.selectMemberVoByPrimaryKey(map.get("userId"));
		if (memInfo != null) {
			if (memInfo.getIsAgent().equals("1")) {
				return new DataResponse(false, "您已经是代理了，无需再次申请！");
			}
			// 向用户表插入数据，并且向角色-权限表中添加 该用户数据，使其获得相应权限
			Users user = new Users();
			user.setAccount(map.get("mobile"));// 设置手机为账户
			user.setSex(memInfo.getSex());
			user.setPassword(SnailUtils.getMd5(map.get("mobile").substring(map.get("mobile").length() - 6)));// 手机后六位为密码
			user.setMobile(map.get("mobile"));
			user.setName(map.get("name"));
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
				updateMember.setAgentLevel(CommonKeys.junior);
				updateMember.setMobile(map.get("mobile"));
				updateMember.setUserId(memInfo.getUserId());// 根据userId去更新
				int updateM = this.memberDao.updateUsersByPrimaryKey(updateMember);
				if (updateM > 0) {
					return new DataResponse(true, "申请代理成功！请及时登录并修改初始密码--绑定的手机号后六位！");
				} else {
					return new DataResponse(false, "申请失败！更新会员信息失败");
				}
			} else {
				return new DataResponse(false, "申请失败！后台账号未注册成功");
			}
		} else {
			return new DataResponse(false, "未查询到会员信息，申请失败！");
		}
	}

	@Override
	public DataResponse getMallInfo(String userId, int way) throws Exception {
		DataResponse rst = new DataResponse();
		MemberVo memInfo = this.memberDao.selectMemberVoByPrimaryKey(userId);
		if (memInfo != null) {
			long s = System.currentTimeMillis();
			// 程序方式实现
			if (way == 1) {
				List<MallSettingsVo> list = this.mallSettingsDao.findAllList();
				if (list != null && list.size() > 0) {
					Map<String, Object> rstMap = this.getMallInfoMap(list, memInfo.getAgentLevel());
					rst.setResponse(rstMap);
					rst.setState(true);
				} else {
					return new DataResponse(false, "商城信息为空！");
				}
			} else {
				// sql实现
				List<MallSettingsVo> list = this.mallSettingsDao.findAllListByAgentLevel(memInfo.getAgentLevel());
				if (list != null && list.size() > 0) {
					rst.setResponse(list);
					rst.setState(true);
				} else {
					return new DataResponse(false, "商城信息为空！");
				}
			}
			long e = System.currentTimeMillis();
			System.out.println("service耗时：" + (e - s) + "毫秒");
		} else {
			return new DataResponse(false, "会员信息不存在！");
		}
		return rst;
	}

	private Map<String, Object> getMallInfoMap(List<MallSettingsVo> list, String level) {
		Map<String, Object> rstMap = new HashMap<String, Object>();
		List<Map<String, String>> coinsList = new ArrayList<Map<String, String>>();
		List<Map<String, String>> pkCardList = new ArrayList<Map<String, String>>();
		Map<String, String> settingsMap = new HashMap<String, String>();
		for (MallSettingsVo i : list) {
			String rate = "1";
			switch (level) {
			case CommonKeys.junior:
				rate = i.getJuniorRate();
				break;
			case CommonKeys.medium:
				rate = i.getMediumRate();
				break;
			case CommonKeys.senior:
				rate = i.getSeniorRate();
				break;
			default:
				break;
			}
			settingsMap = getSettings(i, rate);
			if (settingsMap != null) {
				switch (i.getGoodsId()) {
				case CommonKeys.goods_coins:
					coinsList.add(settingsMap);
					break;
				case CommonKeys.goods_pkCard:
					pkCardList.add(settingsMap);
					break;
				default:
					break;
				}
			}
		}
		rstMap.put("coins", coinsList);
		rstMap.put("pkCard", pkCardList);
		return rstMap;
	}

	private Map<String, String> getSettings(MallSettingsVo vo, String rate) {
		Map<String, String> rstMap = new HashMap<String, String>();
		rstMap.put("price", vo.getPrice());
		rstMap.put("amount", vo.getAmount());
		rstMap.put("rate", rate);
		String realAmount = vo.getAmount();
		if (!rate.equals("1")) {
			int real = (int) (Float.valueOf(realAmount) * Float.valueOf(rate));
			realAmount = String.valueOf(real);
		}
		rstMap.put("realAmount", realAmount);
		return rstMap;
	}

}
